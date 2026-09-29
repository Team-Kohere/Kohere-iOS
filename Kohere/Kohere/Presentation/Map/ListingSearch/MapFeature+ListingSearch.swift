//
//  MapFeature+ListingSearch.swift
//  Kohere
//
//  Created by Codex on 7/6/26.
//

import ComposableArchitecture
import Foundation

enum MapLocationSearchIntent {
    /// 지도 탭의 최초 진입이다. 현재 viewport가 없으면 첫 camera idle까지 검색을 기다린다.
    case initialEntry
    /// 기존 필터를 초기화하고 현재 지도 결과를 유지한 채 일반 매물을 둘러본다.
    case browseListings
    /// 장소 검색 결과로 이동한다. 이전 결과를 비우고 목표 좌표가 viewport에 들어오면 검색한다.
    case placeResult(SearchPlaceResult)
    /// 매물 상세에서 지도로 돌아온다. 이전 결과는 유지하고 목표 좌표 이동 뒤 검색한다.
    case listingPreview(MapCoordinate)
    /// 사용자가 옮긴 현재 viewport를 기준으로 명시적으로 다시 검색한다.
    case researchCurrentViewport
    /// 적용한 필터와 현재 viewport를 기준으로 다시 검색한다.
    case filterApplied
}

/// 진입 경로마다 달라지는 것만 모았다. 여기 없는 동작은 모든 경로에서 같다. (resetForNewSearch 참고)
///
/// 기본값은 "대부분의 진입이 하는 일"이다. 그래서 아래 `plan` 매핑에는 기본값과 다른 것만 적히고,
/// 적힌 값이 곧 "이 진입만 다르게 하는 것"이다. keep이 적혀 있으면 "다른 진입은 바꾸지만 여기는 손대지 않는다"는 뜻이다.
struct MapLocationSearchPlan {
    /// 새 결과가 올 때까지 이전 카드를 화면에 남길지.
    enum PreviousResults {
        /// 이전 results를 새 모드 객체로 옮겨 담는다. 페이지·로딩·에러는 옮기지 않는다.
        case keep
        /// 카드와 마커를 비운 채 새 결과를 기다린다.
        case clear
    }
    /// 적용 필터와 편집 중 필터를 어떻게 할지.
    enum FilterPolicy {
        /// 지금 필터 그대로 검색한다.
        case keep
        /// 둘 다 기본 필터로 되돌린다.
        case reset
    }
    /// 적용 필터가 진단 조건인지 표시하는 값(appliedFilterSource)을 어떻게 할지. 진단으로 바꾸는 경우는 없다. (beginDiagnosisSearch가 담당)
    enum FilterSourcePolicy {
        /// 손대지 않는다. 진단 중이었으면 진단 표시가 남는다. 필터 시트가 미리 정한 값도 그대로 둔다.
        case keep
        /// 진단과의 연결을 끊고 일반 필터로 표시한다.
        case manual
    }
    /// 상단 검색바에 표시되는 장소 이름(selectedPlaceSearchTitle)을 어떻게 할지.
    enum PlaceTitlePolicy {
        /// 지금 표시를 유지한다.
        case keep
        /// 표시를 지운다.
        case clear
        /// 고른 장소 이름으로 바꾼다.
        case set(String)
    }
    /// 언제 검색을 시작할지.
    enum SearchTiming {
        /// 지금 viewport로 바로 검색한다. viewport가 아직 없으면 첫 카메라 멈춤에 검색한다.
        case currentViewport
        /// 카메라를 옮기고, 목표 좌표가 화면에 들어온 멈춤에 검색한다. 그 전 멈춤은 무시한다.
        case afterCameraMove(to: MapCoordinate, position: MapCameraTargetPosition)
    }

    var previousResults: PreviousResults = .keep   // 기본: 이전 카드를 남긴다
    var filter: FilterPolicy = .keep               // 기본: 필터를 건드리지 않는다
    var filterSource: FilterSourcePolicy = .manual // 기본: 진단과의 연결을 끊는다
    var placeTitle: PlaceTitlePolicy = .clear      // 기본: 장소 이름을 지운다
    var popsToRoot = false                         // 기본: 네비게이션 스택을 건드리지 않는다
    let search: SearchTiming                       // 기본 없음. 진입마다 반드시 정한다
}

extension MapLocationSearchIntent {
    /// 진입마다 기본값과 다른 것만 적는다. 안 적힌 항목은 MapLocationSearchPlan의 기본값을 따른다.
    var plan: MapLocationSearchPlan {
        switch self {
        // 지도 탭 첫 진입. 전부 기본값이다.
        case .initialEntry:
            .init(search: .currentViewport)
        // 홈의 둘러보기. 필터를 기본으로 되돌린다.
        case .browseListings:
            .init(filter: .reset, search: .currentViewport)
        // 재검색 버튼. 필터와 진단 표시는 그대로 두고 영역만 바꾼다.
        case .researchCurrentViewport:
            .init(filterSource: .keep, search: .currentViewport)
        // 필터 적용. 출처는 필터 시트가 이미 정했고, 장소 기준도 그대로다.
        case .filterApplied:
            .init(filterSource: .keep, placeTitle: .keep, search: .currentViewport)
        // 장소 검색 결과 선택. 이전 결과를 비우고 장소 이름을 띄운 뒤 그 좌표로 이동한다.
        case let .placeResult(place):
            .init(
                previousResults: .clear,
                placeTitle: .set(place.title),
                search: .afterCameraMove(to: place.coordinate, position: .center)
            )
        // 매물 상세의 지도에서 보기. 상세를 걷어내고 매물 좌표로 이동한다.
        case let .listingPreview(coordinate):
            .init(
                popsToRoot: true,
                search: .afterCameraMove(to: coordinate, position: .upper)
            )
        }
    }
}

extension MapFeature {
    // MARK: - Entry

    func beginLocationSearch(
        _ intent: MapLocationSearchIntent,
        state: inout State
    ) -> Effect<Action> {
        let plan = intent.plan

        // 1. 모드. 항상 빈 위치 검색 데이터로 시작한다.
        //    이전 카드를 남기는 경우도 results만 옮기고 페이지·로딩·에러는 새로 시작한다.
        //    진단에서 넘어오면 옮길 결과가 없어 카드가 빈다.
        var search = MapLocationSearchState()
        if plan.previousResults == .keep, case let .locationSearch(previous) = state.searchMode {
            search.results = previous.results
        }
        state.searchMode = .locationSearch(search)

        // 2. 모든 새 검색이 하는 정리
        let reset = resetForNewSearch(state: &state)

        // 3. 진입 경로별 차이
        if plan.filter == .reset {
            state.appliedFilter = MapFilterState()
            state.editingFilter = MapFilterState()
        }
        if plan.filterSource == .manual {
            state.appliedFilterSource = .manual
        }
        switch plan.placeTitle {
        case .keep: break
        case .clear: state.selectedPlaceSearchTitle = nil
        case let .set(title): state.selectedPlaceSearchTitle = title
        }
        if plan.popsToRoot {
            state.path.removeAll()
        }

        // 4. 검색 시점
        switch plan.search {
        case .currentViewport:
            guard let viewport = state.currentViewport else {
                state.viewportSearchTrigger = .onFirstIdle   // 첫 멈춤에 검색된다. (MapFeature+Viewport)
                return reset
            }
            // reset의 취소가 끝난 뒤 시작해야 같은 ID로 등록되는 새 요청이 취소되지 않는다.
            return .concatenate(reset, startListingSearchEffect(state: &state, viewport: viewport))

        case let .afterCameraMove(coordinate, position):
            state.viewportSearchTrigger = .onArrival(at: coordinate)   // 도착한 멈춤에 검색된다. (MapFeature+Viewport)
            state.cameraMoveRequest = MapCameraMoveRequest(coordinate: coordinate, targetPosition: position)
            if plan.previousResults == .clear {
                state.markers = []
            }
            return reset
        }
    }

    // MARK: - Shared

    /// 어떤 종류든 새 검색이 시작될 때 반드시 하는 일.
    /// 사용자가 직전에 보고 있던 것(선택 카드, 필터 시트, 재검색 유도 버튼)을 지우고, 이전 검색의 남은 요청을 끊는다.
    /// 진입 경로에 따라 달라지는 것은 여기 넣지 않는다. (위치 검색은 MapLocationSearchPlan, 진단은 beginDiagnosisSearch)
    func resetForNewSearch(state: inout State) -> Effect<Action> {
        state.clearSelectedListing()
        state.isFilterPresented = false
        state.showsResearchButton = false
        return .merge(
            .cancel(id: MapEffectID.listingSearch),
            .cancel(id: MapEffectID.listingMapMarkers),
            .cancel(id: MapEffectID.diagnosisDetail),
            .cancel(id: MapEffectID.diagnosisRecommendations),
            .cancel(id: MapEffectID.diagnosisMap)
        )
    }

    // MARK: - Request / Response

    func startListingSearchEffect(
        state: inout State,
        viewport: MapViewport
    ) -> Effect<Action> {
        state.viewportSearchTrigger = .manual(lastSearched: viewport)
        state.showsResearchButton = false
        state.clearSelectedListing()
        state.isListingSearchLoading = true
        state.listingSearchErrorMessage = nil

        let input = state.appliedFilter.listingSearchInput(
            bounds: viewport.visibleBounds
        )

        let listingsEffect: Effect<Action> = .run { [listingClient] send in
            debugLogListingSearchRequest(input)

            do {
                let page = try await listingClient.fetchListings(input)
                await send(.listingSearchResponse(.success(page), isFirstPage: true))
            } catch {
                await send(.listingSearchResponse(.failure(error), isFirstPage: true))
            }
        }
        .cancellable(id: MapEffectID.listingSearch, cancelInFlight: true)

        let markersEffect: Effect<Action> = .run { [listingClient] send in
            do {
                let markers = try await listingClient.fetchMapMarkers(input)
                await send(.listingMapMarkersResponse(.success(markers)))
            } catch {
                await send(.listingMapMarkersResponse(.failure(error)))
            }
        }
        .cancellable(id: MapEffectID.listingMapMarkers, cancelInFlight: true)

        return .merge(listingsEffect, markersEffect)
    }

    func handleListingSearchResponse(
        _ result: Result<ListingSearchPage, Error>,
        isFirstPage: Bool,
        state: inout State
    ) -> Effect<Action> {
        guard state.listingSource == .locationSearch else { return .none }

        switch result {
        case let .success(page):
            debugLogListingSearchResponse(page)
            state.isListingSearchLoading = false
            state.listingSearchErrorMessage = nil
            applyListingSearchPage(page, isFirstPage: isFirstPage, to: &state)

        case let .failure(error):
            debugLogListingSearchError(error)
            state.isListingSearchLoading = false
            state.listingSearchErrorMessage = error.localizedDescription
        }

        return .none
    }

    func handleListingMapMarkersResponse(
        _ result: Result<[ListingMapMarker], Error>,
        state: inout State
    ) -> Effect<Action> {
        guard state.listingSource == .locationSearch else { return .none }

        switch result {
        case let .success(markers):
            state.markers = markers.map {
                MapMarkerItem(id: $0.listingID, coordinate: $0.coordinate)
            }
        case .failure:
            state.markers = []
        }

        return .none
    }

    // MARK: - Pagination

    func handleListingRowAppeared(
        _ listingID: String,
        state: inout State
    ) -> Effect<Action> {
        switch state.listingSource {
        case .locationSearch:
            return startNextListingPageEffect(appearedListingID: listingID, state: &state)

        case .diagnosis:
            return startNextDiagnosisRecommendationPageEffect(appearedListingID: listingID, state: &state)

        case .idle:
            return .none
        }
    }

    private func startNextListingPageEffect(
        appearedListingID: String,
        state: inout State
    ) -> Effect<Action> {
        guard state.listings.last?.listingID == appearedListingID,
              !state.isListingSearchLoading,
              state.listingSource == .locationSearch,
              state.listingPageInfo?.hasNext == true,
              let lastSearchedViewport = state.viewportSearchTrigger.lastSearchedViewport
        else { return .none }

        let nextPage = (state.listingPageInfo?.number ?? 0) + 1
        state.isListingSearchLoading = true
        state.listingSearchErrorMessage = nil

        let input = state.appliedFilter.listingSearchInput(
            bounds: lastSearchedViewport.visibleBounds,
            page: nextPage
        )

        return .run { [listingClient] send in
            debugLogListingSearchRequest(input)

            do {
                let page = try await listingClient.fetchListings(input)
                await send(.listingSearchResponse(.success(page), isFirstPage: false))
            } catch {
                await send(.listingSearchResponse(.failure(error), isFirstPage: false))
            }
        }
        .cancellable(id: MapEffectID.listingSearch, cancelInFlight: true)
    }

    // MARK: - Result Mapping

    func applyListingSearchPage(
        _ page: ListingSearchPage,
        isFirstPage: Bool,
        to state: inout State
    ) {
        state.listingPageInfo = page.page

        if isFirstPage {
            state.listingSearchResults = page.content
        } else {
            state.listingSearchResults.appendUnique(contentsOf: page.content)
        }

        if let selectedMarkerID = state.selectedMarkerID,
           !state.markers.contains(where: { $0.id == selectedMarkerID }) {
            state.clearSelectedListing()
        }
    }
}
