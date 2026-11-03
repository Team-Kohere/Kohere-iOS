//
//  ListingClient.swift
//  Kohere
//
//  Created by Codex on 7/5/26.
//

import Dependencies

public struct ListingClient: Sendable {
    public var fetchListings: @MainActor @Sendable (_ input: ListingSearchInput) async throws -> ListingSearchPage
    public var fetchMapMarkers: @MainActor @Sendable (_ input: ListingSearchInput) async throws -> [ListingMapMarker] = { _ in [] }
    public var fetchDetail: @MainActor @Sendable (_ listingID: String) async throws -> ListingDetail
    public var fetchFavoriteListings: @Sendable (_ page: Int, _ size: Int) async throws -> ListingSearchPage
    public var fetchRecentListings: @Sendable () async throws -> [Listing]
    public var addFavorite: @Sendable (_ listingID: String) async throws -> ListingFavoriteStatus
    public var removeFavorite: @Sendable (_ listingID: String) async throws -> ListingFavoriteStatus
    public var createBooking: @Sendable (_ listingID: String, _ input: ListingBookingCreateInput) async throws -> ListingBooking

    public init(
        fetchListings: @escaping @MainActor @Sendable (_ input: ListingSearchInput) async throws -> ListingSearchPage,
        fetchMapMarkers: @escaping @MainActor @Sendable (_ input: ListingSearchInput) async throws -> [ListingMapMarker] = { _ in [] },
        fetchDetail: @escaping @MainActor @Sendable (_ listingID: String) async throws -> ListingDetail,
        fetchFavoriteListings: @escaping @Sendable (_ page: Int, _ size: Int) async throws -> ListingSearchPage,
        fetchRecentListings: @escaping @Sendable () async throws -> [Listing],
        addFavorite: @escaping @Sendable (_ listingID: String) async throws -> ListingFavoriteStatus,
        removeFavorite: @escaping @Sendable (_ listingID: String) async throws -> ListingFavoriteStatus,
        createBooking: @escaping @Sendable (_ listingID: String, _ input: ListingBookingCreateInput) async throws -> ListingBooking
    ) {
        self.fetchListings = fetchListings
        self.fetchMapMarkers = fetchMapMarkers
        self.fetchDetail = fetchDetail
        self.fetchFavoriteListings = fetchFavoriteListings
        self.fetchRecentListings = fetchRecentListings
        self.addFavorite = addFavorite
        self.removeFavorite = removeFavorite
        self.createBooking = createBooking
    }
}

extension ListingClient: TestDependencyKey {
    public static let testValue = ListingClient(
        fetchListings: { _ in throw CancellationError() },
        fetchMapMarkers: { _ in throw CancellationError() },
        fetchDetail: { _ in throw CancellationError() },
        fetchFavoriteListings: { _, _ in throw CancellationError() },
        fetchRecentListings: { throw CancellationError() },
        addFavorite: { _ in throw CancellationError() },
        removeFavorite: { _ in throw CancellationError() },
        createBooking: { _, _ in throw CancellationError() }
    )
}

extension DependencyValues {
    public var listingClient: ListingClient {
        get { self[ListingClient.self] }
        set { self[ListingClient.self] = newValue }
    }
}
