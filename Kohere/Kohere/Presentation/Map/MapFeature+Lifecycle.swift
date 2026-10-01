//
//  MapFeature+Lifecycle.swift
//  Kohere
//
//  Created by Codex on 7/15/26.
//

import ComposableArchitecture

extension MapFeature {
    func handleMapAppeared(state: inout State) -> Effect<Action> {
        var effects: [Effect<Action>] = [startExchangeRateFetchEffect()]

        if state.appliedFilterSource != .diagnosis,
           shouldExpandDiagnosisButtonToday(userDefaultsClient: userDefaultsClient) {
            state.isDiagnosisButtonExpanded = true
            effects.append(diagnosisButtonAutoCollapseEffect)
        }

        // 조회 중 화면을 떠났거나 실패해 받지 못한 것이 있으면 다시 요청한다.
        switch state.searchMode {
        case .idle:
            effects.append(.send(.initialLocationSearchRequested))

        case let .locationSearch(search):
            if search.results.status == .idle,
               let viewport = state.viewportSearchTrigger.lastSearchedViewport {
                effects.append(startListingSearchEffect(state: &state, viewport: viewport))
            }

        case let .diagnosis(diagnosis):
            if diagnosis.recommendations.status == .idle {
                effects.append(fetchDiagnosisRecommendationsEffect(diagnosisID: diagnosis.diagnosisID, state: &state))
            }
            if diagnosis.markerRequest == .idle {
                effects.append(fetchDiagnosisMarkersEffect(diagnosisID: diagnosis.diagnosisID, state: &state))
            }
        }

        return .merge(effects)
    }

    func handleMapDismissed(state: inout State) -> Effect<Action> {
        state.isDiagnosisButtonExpanded = false
        // 진행 중 요청을 끊으므로, 상태도 "받은 적 없음" 또는 "받음"으로 되돌린다. 재진입 시 idle인 것만 다시 요청한다.
        switch state.searchMode {
        case .idle: break
        case var .locationSearch(search):
            search.results.settle()
            state.searchMode = .locationSearch(search)
        case var .diagnosis(diagnosis):
            diagnosis.recommendations.settle()
            if diagnosis.markerRequest == .loading { diagnosis.markerRequest = .idle }
            state.searchMode = .diagnosis(diagnosis)
        }
        if state.selectedListingRequestID != nil {
            state.clearSelectedListing()
        }
        return .merge(
            .cancel(id: MapEffectID.exchangeRate),
            .cancel(id: MapEffectID.diagnosisButtonAutoCollapse),
            .cancel(id: MapEffectID.diagnosisDetail),
            .cancel(id: MapEffectID.diagnosisRecommendations),
            .cancel(id: MapEffectID.diagnosisMarkers),
            .cancel(id: MapEffectID.listingSearch),
            .cancel(id: MapEffectID.listingMapMarkers),
            .cancel(id: MapEffectID.selectedListing)
        )
    }
}
