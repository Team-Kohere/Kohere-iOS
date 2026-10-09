//
//  MapLocationSearchFlowTests.swift
//  KohereTests
//
//  Created by Codex on 7/15/26.
//

import ComposableArchitecture
import KohereDomain
import XCTest
@testable import Kohere

@MainActor
final class MapLocationSearchFlowTests: XCTestCase {
    func testMapDismissedStopsListingSearchLoadingWithoutClearingResults() async {
        var initialState = MapFeature.State()
        initialState.searchMode = .locationSearch(MapLocationSearchState(
            results: PagedRequest(items: [makeListing()], status: .loadingFirstPage)
        ))

        let store = TestStore(initialState: initialState) {
            MapFeature()
        }

        await store.send(.mapDismissed) {
            $0.searchMode = .locationSearch(MapLocationSearchState(
                results: PagedRequest(items: [self.makeListing()], status: .idle)
            ))
        }

        XCTAssertEqual(store.state.listingSource, .locationSearch)
        XCTAssertEqual(store.state.listings.map(\.listingID), ["listing-1"])
    }

    // 진단 카드(목록)는 모드 전환과 함께 사라지고, 마커는 새 결과가 올 때까지 남는다.
    func testBrowseListingsLeavesDiagnosisModeKeepingMarkersUntilNewResults() async {
        let coordinate = MapCoordinate(latitude: 37.5559, longitude: 126.9250)
        let marker = MapMarkerItem(id: "listing-1", coordinate: coordinate)
        var previousFilter = MapFilterState()
        previousFilter.selectedOptions = [.englishSupport]
        var initialState = MapFeature.State()
        initialState.searchMode = .diagnosis(MapDiagnosisSearchState(
            diagnosisID: 1,
            recommendations: PagedRequest(items: [makeRecommendation()], status: .loadingFirstPage)
        ))
        initialState.appliedFilter = previousFilter
        initialState.editingFilter = previousFilter
        initialState.appliedFilterSource = .diagnosis
        initialState.selectedMarkerID = marker.id
        initialState.sheetMode = .selectedListing
        initialState.markers = [marker]

        let store = TestStore(initialState: initialState) {
            MapFeature()
        }

        await store.send(.browseListingsRequested) {
            $0.searchMode = .locationSearch(MapLocationSearchState())
            $0.appliedFilter = MapFilterState()
            $0.editingFilter = MapFilterState()
            $0.appliedFilterSource = .manual
            $0.selectedMarkerID = nil
            $0.sheetMode = .listingList
        }

        XCTAssertEqual(store.state.markers, [marker])
        XCTAssertTrue(store.state.listings.isEmpty)
    }

    func testPlaceResultWaitsForTargetViewportAndClearsVisibleResults() async {
        let coordinate = MapCoordinate(latitude: 37.5559, longitude: 126.9250)
        let placeResult = SearchPlaceResult(
            id: "hongdae",
            title: "홍대입구역",
            roadAddress: "서울 마포구 양화로",
            address: "",
            coordinate: coordinate
        )
        var initialState = MapFeature.State()
        initialState.searchMode = .diagnosis(MapDiagnosisSearchState(
            diagnosisID: 1,
            recommendations: PagedRequest(items: [makeRecommendation()], status: .loaded)
        ))
        initialState.appliedFilterSource = .diagnosis
        initialState.markers = [MapMarkerItem(id: "listing-1", coordinate: coordinate)]

        let store = TestStore(initialState: initialState) {
            MapFeature()
        }

        await store.send(.placeSearchResultSelected(placeResult)) {
            $0.searchMode = .locationSearch(MapLocationSearchState())
            $0.appliedFilterSource = .manual
            $0.viewportSearchTrigger = .onArrival(at: coordinate)
            $0.selectedPlaceSearchTitle = placeResult.title
            $0.cameraMoveRequest = MapCameraMoveRequest(
                coordinate: coordinate,
                targetPosition: .center
            )
            $0.markers = []
        }
    }

    func testPendingTargetStartsSearchOnlyAfterViewportContainsCoordinate() async {
        let target = MapCoordinate(latitude: 37.5559, longitude: 126.9250)
        let outsideViewport = makeViewport(
            center: MapCoordinate(latitude: 37.5000, longitude: 127.0000),
            southWest: MapCoordinate(latitude: 37.4900, longitude: 126.9900),
            northEast: MapCoordinate(latitude: 37.5100, longitude: 127.0100)
        )
        let targetViewport = makeViewport(
            center: target,
            southWest: MapCoordinate(latitude: 37.5450, longitude: 126.9150),
            northEast: MapCoordinate(latitude: 37.5650, longitude: 126.9350)
        )
        var initialState = MapFeature.State()
        initialState.searchMode = .locationSearch(MapLocationSearchState())
        initialState.viewportSearchTrigger = .onArrival(at: target)

        let store = TestStore(initialState: initialState) {
            MapFeature()
        } withDependencies: {
            $0.listingClient.fetchListings = { _ in
                ListingSearchPage(content: [], page: nil)
            }
            $0.listingClient.fetchMapMarkers = { _ in [] }
        }

        await store.send(.viewportChanged(outsideViewport)) {
            $0.currentViewport = outsideViewport
        }

        await store.send(.viewportChanged(targetViewport)) {
            $0.currentViewport = targetViewport
            $0.viewportSearchTrigger = .manual(lastSearched: targetViewport)
            $0.searchMode = .locationSearch(MapLocationSearchState(
                results: PagedRequest(status: .loadingFirstPage)
            ))
        }
        await store.receive {
            guard case .listingSearchResponse(.success, _) = $0 else { return false }
            return true
        } assert: {
            $0.searchMode = .locationSearch(MapLocationSearchState(
                results: PagedRequest(status: .loaded)
            ))
        }
        await store.receive {
            guard case .listingMapMarkersResponse(.success) = $0 else { return false }
            return true
        }
    }

    func testPropertyTypeFilterAllowsOnlyOneSelection() {
        var filter = MapFilterState()

        filter.togglePropertyType(.goshiwon)
        filter.togglePropertyType(.coLiving)

        XCTAssertEqual(filter.selectedPropertyTypes, [.coLiving])
    }

    func testViewportChangeAfterSearchOnlyShowsResearchButton() async {
        let previousViewport = makeViewport(
            center: MapCoordinate(latitude: 37.5559, longitude: 126.9250),
            southWest: MapCoordinate(latitude: 37.5450, longitude: 126.9150),
            northEast: MapCoordinate(latitude: 37.5650, longitude: 126.9350)
        )
        let movedViewport = makeViewport(
            center: MapCoordinate(latitude: 37.5659, longitude: 126.9350),
            southWest: MapCoordinate(latitude: 37.5550, longitude: 126.9250),
            northEast: MapCoordinate(latitude: 37.5750, longitude: 126.9450)
        )
        var initialState = MapFeature.State()
        initialState.searchMode = .locationSearch(MapLocationSearchState())
        initialState.currentViewport = previousViewport
        initialState.viewportSearchTrigger = .manual(lastSearched: previousViewport)

        let store = TestStore(initialState: initialState) {
            MapFeature()
        }

        await store.send(.viewportChanged(movedViewport)) {
            $0.currentViewport = movedViewport
            $0.showsResearchButton = true
        }
    }

    func testMapReentryRestartsInterruptedFirstPageSearch() async {
        let viewport = makeViewport(
            center: MapCoordinate(latitude: 37.5559, longitude: 126.9250),
            southWest: MapCoordinate(latitude: 37.5450, longitude: 126.9150),
            northEast: MapCoordinate(latitude: 37.5650, longitude: 126.9350)
        )
        var initialState = MapFeature.State()
        initialState.searchMode = .locationSearch(MapLocationSearchState(
            results: PagedRequest(status: .idle)
        ))
        initialState.currentViewport = viewport
        initialState.viewportSearchTrigger = .manual(lastSearched: viewport)
        // 진단 버튼 펼침 판정(UserDefaults 의존성)을 건너뛰기 위해 진단 조건 표시 상태로 둔다. (locationSearch + diagnosis는 허용된 조합)
        initialState.appliedFilterSource = .diagnosis
        let searchedBounds = LockIsolated<[MapBounds?]>([])

        let store = TestStore(initialState: initialState) {
            MapFeature()
        } withDependencies: {
            $0.listingClient.fetchListings = { input in
                searchedBounds.withValue { $0.append(input.bounds) }
                return ListingSearchPage(content: [self.makeListing()], page: nil)
            }
            $0.listingClient.fetchMapMarkers = { _ in [] }
            $0.fetchKRWToUSDExchangeRateUseCase = .init { .init(usdPerKRW: 0.001) }
            $0.convertMonthlyRentCurrencyUseCase = .liveValue
        }
        store.exhaustivity = .off

        await store.send(.mapAppeared)
        await store.receive(\.listingSearchResponse)
        await store.finish()

        XCTAssertEqual(searchedBounds.value, [viewport.visibleBounds])
        XCTAssertEqual(store.state.searchMode, .locationSearch(MapLocationSearchState(
            results: PagedRequest(items: [makeListing()], status: .loaded)
        )))
    }

    private func makeListing() -> Listing {
        Listing(
            listingID: "listing-1", title: "Listing", type: "Apartment",
            minMonthlyRent: 500_000, maxMonthlyRent: 500_000, minDeposit: 0, maxDeposit: 0,
            minMaintenanceFee: nil, maxMaintenanceFee: nil, minStayMonths: 6, maxStayMonths: nil,
            thumbnailURL: nil, coordinate: nil, address: "Seoul", nearestTransit: nil,
            distanceMeters: nil, isFavorited: false, favoriteCount: nil
        )
    }

    private func makeRecommendation() -> DiagnosisRecommendedListing {
        DiagnosisRecommendedListing(
            listingID: "listing-1", title: "Listing", type: "Apartment",
            minMonthlyRent: 500_000, maxMonthlyRent: 500_000, minDeposit: 0, maxDeposit: 0,
            thumbnailURL: nil, coordinate: nil, nearestTransit: nil
        )
    }

    private func makeViewport(
        center: MapCoordinate,
        southWest: MapCoordinate,
        northEast: MapCoordinate
    ) -> MapViewport {
        MapViewport(
            center: center,
            zoomLevel: 14,
            visibleBounds: MapBounds(southWest: southWest, northEast: northEast)
        )
    }
}
