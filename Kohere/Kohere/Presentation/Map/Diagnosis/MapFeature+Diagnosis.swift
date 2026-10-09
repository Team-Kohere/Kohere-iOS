//
//  MapFeature+Diagnosis.swift
//  Kohere
//
//  Created by Codex on 7/15/26.
//

import ComposableArchitecture
import Foundation
import KohereDomain

extension MapFeature {
    func beginDiagnosisSearch(
        diagnosisID: Int,
        filter: MapFilterState,
        state: inout State
    ) -> Effect<Action> {
        // 1. 모드. 새 진단은 항상 빈 진단 데이터로 시작한다. 이전 모드(또는 이전 진단)의 데이터는 여기서 함께 사라진다.
        state.searchMode = .diagnosis(MapDiagnosisSearchState(diagnosisID: diagnosisID))

        // 2. 모든 새 검색이 하는 정리
        let reset = resetForNewSearch(state: &state)

        // 3. 진단 전용
        state.path = StackState<Path.State>()
        state.appliedFilterSource = .diagnosis
        state.appliedFilter = filter
        state.editingFilter = filter
        state.selectedPlaceSearchTitle = nil
        state.isDiagnosisButtonExpanded = false
        state.isDiagnosisMatchesButtonExpanded = true
        state.viewportSearchTrigger = .onFirstIdle
        state.markers = []

        // 4. 요청
        var requests: [Effect<Action>] = [
            .cancel(id: MapEffectID.diagnosisButtonAutoCollapse),
            fetchDiagnosisRecommendationsEffect(diagnosisID: diagnosisID, state: &state),
            fetchDiagnosisMarkersEffect(diagnosisID: diagnosisID, state: &state)
        ]
        if state.userType != nil {
            requests.append(fetchDiagnosisDetailEffect(diagnosisID: diagnosisID))
        }
        return .merge(reset, .merge(requests))
    }

    // MARK: - Request

    func fetchDiagnosisRecommendationsEffect(
        diagnosisID: Int,
        page: Int? = nil,
        size: Int? = nil,
        state: inout State
    ) -> Effect<Action> {
        let isFirstPage = page == nil
        if case var .diagnosis(diagnosis) = state.searchMode {
            if isFirstPage {
                diagnosis.recommendations.beginFirstPage()
            } else {
                diagnosis.recommendations.beginNextPage()
            }
            state.searchMode = .diagnosis(diagnosis)
        }

        let input = if let page {
            DiagnosisRecommendationsInput(
                diagnosisID: diagnosisID,
                page: page,
                size: size ?? DiagnosisRecommendationsInput.defaultPageSize
            )
        } else {
            DiagnosisRecommendationsInput(diagnosisID: diagnosisID)
        }

        return .run { [diagnosisClient] send in
            do {
                let recommendations = try await diagnosisClient.fetchRecommendations(input)
                try Task.checkCancellation()
                await send(.diagnosisRecommendationsResponse(.success(recommendations), isFirstPage: isFirstPage))
            } catch {
                guard !isDiagnosisRequestCancellation(error) else { return }
                await send(.diagnosisRecommendationsResponse(.failure(error), isFirstPage: isFirstPage))
            }
        }
        .cancellable(id: MapEffectID.diagnosisRecommendations, cancelInFlight: true)
    }

    func fetchDiagnosisMarkersEffect(diagnosisID: Int, state: inout State) -> Effect<Action> {
        if case var .diagnosis(diagnosis) = state.searchMode {
            diagnosis.markerRequest = .loading
            state.searchMode = .diagnosis(diagnosis)
        }
        return .run { [diagnosisClient] send in
            do {
                let map = try await diagnosisClient.fetchRecommendationMap(diagnosisID)
                try Task.checkCancellation()
                await send(.diagnosisMarkersResponse(.success(map)))
            } catch {
                guard !isDiagnosisRequestCancellation(error) else { return }
                await send(.diagnosisMarkersResponse(.failure(.from(error))))
            }
        }
        .cancellable(id: MapEffectID.diagnosisMarkers, cancelInFlight: true)
    }

    func fetchDiagnosisDetailEffect(diagnosisID: Int) -> Effect<Action> {
        .run { [diagnosisClient] send in
            do {
                let detail = try await diagnosisClient.fetchDetail(diagnosisID)
                try Task.checkCancellation()
                await send(.diagnosisDetailResponse(.success(detail)))
            } catch {
                guard !isDiagnosisRequestCancellation(error) else { return }
                await send(.diagnosisDetailResponse(.failure(error)))
            }
        }
        .cancellable(id: MapEffectID.diagnosisDetail, cancelInFlight: true)
    }

    // MARK: - Response

    func handleDiagnosisDetailResponse(
        _ result: Result<DiagnosisDetail, Error>,
        state: inout State
    ) -> Effect<Action> {
        switch result {
        case let .success(detail):
            // 모드를 떠났거나(위치 검색 전환) 다른 진단으로 바뀐 뒤 늦게 도착한 응답은 버린다.
            guard case let .diagnosis(diagnosis) = state.searchMode,
                  diagnosis.diagnosisID == detail.diagnosisID
            else { return .none }
            let filter = MapFilterState(diagnosisDetail: detail)
            let shouldReloadSelectedCard = state.appliedFilter != filter
                && (state.selectedListing != nil || state.selectedListingRequestID != nil)
            let selectedID = state.selectedMarkerID
            state.appliedFilter = filter
            state.editingFilter = filter

            // 진단 상세가 늦게 와 조건을 보정했다면, 이전 조건으로 조회하던 카드도 갱신한다.
            if shouldReloadSelectedCard, let selectedID {
                state.clearSelectedListing()
                return selectMarker(selectedID, state: &state)
            }

        case .failure:
            guard state.listingSource == .diagnosis else { return .none }
        }

        return .none
    }

    func handleDiagnosisRecommendationsResponse(
        _ result: Result<DiagnosisRecommendations, Error>,
        isFirstPage: Bool,
        state: inout State
    ) -> Effect<Action> {
        guard case var .diagnosis(diagnosis) = state.searchMode else { return .none }

        switch result {
        case let .success(recommendations):
            applyDiagnosisRecommendations(recommendations, isFirstPage: isFirstPage, to: &state)

        case .failure:
            diagnosis.recommendations.settle()
            state.searchMode = .diagnosis(diagnosis)
        }

        return .none
    }

    func applyDiagnosisRecommendations(
        _ recommendations: DiagnosisRecommendations,
        isFirstPage: Bool,
        to state: inout State
    ) {
        guard case var .diagnosis(diagnosis) = state.searchMode else { return }
        diagnosis.recommendations.apply(
            recommendations.listings,
            pageInfo: recommendations.page,
            isFirstPage: isFirstPage
        )
        state.searchMode = .diagnosis(diagnosis)

        guard isFirstPage else { return }
        let cameraCoordinate = recommendations.listings.compactMap(\.coordinate).first
        if state.selectedMarkerID == nil {
            state.cameraMoveRequest = cameraCoordinate.map {
                MapCameraMoveRequest(coordinate: $0, targetPosition: .center)
            }
        }
        if cameraCoordinate == nil {
            state.viewportSearchTrigger = state.currentViewport.map { .manual(lastSearched: $0) } ?? .onFirstIdle
        }
    }

    func handleDiagnosisMarkersResponse(
        _ result: Result<DiagnosisRecommendationMap, DataError>,
        state: inout State
    ) -> Effect<Action> {
        guard case var .diagnosis(diagnosis) = state.searchMode else { return .none }

        switch result {
        case let .success(map):
            state.markers = map.markers.map { MapMarkerItem(id: $0.listingID, coordinate: $0.coordinate) }
            diagnosis.markerRequest = .loaded
        case .failure:
            diagnosis.markerRequest = .idle
        }
        state.searchMode = .diagnosis(diagnosis)
        return .none
    }

    // MARK: - Pagination

    func startNextDiagnosisRecommendationPageEffect(
        appearedListingID: String,
        state: inout State
    ) -> Effect<Action> {
        guard case let .diagnosis(diagnosis) = state.searchMode,
              diagnosis.recommendations.items.last?.id == appearedListingID,
              !diagnosis.recommendations.isLoading,
              diagnosis.recommendations.hasNextPage
        else { return .none }

        return fetchDiagnosisRecommendationsEffect(
            diagnosisID: diagnosis.diagnosisID,
            page: diagnosis.recommendations.nextPageNumber,
            size: diagnosis.recommendations.pageInfo?.size ?? DiagnosisRecommendationsInput.defaultPageSize,
            state: &state
        )
    }
}

nonisolated private func isDiagnosisRequestCancellation(_ error: Error) -> Bool {
    Task.isCancelled
        || error is CancellationError
        || (error as? URLError)?.code == .cancelled
}
