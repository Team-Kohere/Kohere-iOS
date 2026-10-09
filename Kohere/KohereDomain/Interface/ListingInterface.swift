//
//  ListingInterface.swift
//  Kohere
//
//  Created by Codex on 7/5/26.
//

import ComposableArchitecture

public protocol ListingInterface {
    func fetchListings(input: ListingSearchInput) async throws -> ListingSearchPage
    func fetchMapMarkers(input: ListingSearchInput) async throws -> [ListingMapMarker]
    func fetchDetail(listingID: String) async throws -> ListingDetail
    func fetchFavoriteListings(page: Int, size: Int) async throws -> ListingSearchPage
    func fetchRecentListings() async throws -> [Listing]
    func addFavorite(listingID: String) async throws -> ListingFavoriteStatus
    func removeFavorite(listingID: String) async throws -> ListingFavoriteStatus
    func createBooking(listingID: String, input: ListingBookingCreateInput) async throws -> ListingBooking
}

public struct ListingClient: Sendable {
    public var fetchListings: @MainActor @Sendable (_ input: ListingSearchInput) async throws -> ListingSearchPage
    public var fetchMapMarkers: @MainActor @Sendable (_ input: ListingSearchInput) async throws -> [ListingMapMarker] = { _ in [] }
    public var fetchDetail: @MainActor @Sendable (_ listingID: String) async throws -> ListingDetail
    public var fetchFavoriteListings: @Sendable (_ page: Int, _ size: Int) async throws -> ListingSearchPage
    public var fetchRecentListings: @Sendable () async throws -> [Listing]
    public var addFavorite: @Sendable (_ listingID: String) async throws -> ListingFavoriteStatus
    public var removeFavorite: @Sendable (_ listingID: String) async throws -> ListingFavoriteStatus
    public var createBooking: @Sendable (_ listingID: String, _ input: ListingBookingCreateInput) async throws -> ListingBooking
}

extension ListingClient {
    public init(repository: any ListingInterface) {
        self.init(
            fetchListings: { input in
                try await repository.fetchListings(input: input)
            },
            fetchMapMarkers: { input in
                try await repository.fetchMapMarkers(input: input)
            },
            fetchDetail: { listingID in
                try await repository.fetchDetail(listingID: listingID)
            },
            fetchFavoriteListings: { page, size in
                try await repository.fetchFavoriteListings(page: page, size: size)
            },
            fetchRecentListings: {
                try await repository.fetchRecentListings()
            },
            addFavorite: { listingID in
                try await repository.addFavorite(listingID: listingID)
            },
            removeFavorite: { listingID in
                try await repository.removeFavorite(listingID: listingID)
            },
            createBooking: { listingID, input in
                try await repository.createBooking(listingID: listingID, input: input)
            }
        )
    }
}

extension ListingClient: DependencyKey {
    public static let liveValue = ListingClient(
        fetchListings: { _ in throw CancellationError() },
        fetchMapMarkers: { _ in throw CancellationError() },
        fetchDetail: { _ in throw CancellationError() },
        fetchFavoriteListings: { _, _ in throw CancellationError() },
        fetchRecentListings: { throw CancellationError() },
        addFavorite: { _ in throw CancellationError() },
        removeFavorite: { _ in throw CancellationError() },
        createBooking: { _, _ in throw CancellationError() }
    )

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
