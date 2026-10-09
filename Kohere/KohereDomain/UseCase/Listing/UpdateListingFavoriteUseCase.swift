//
//  UpdateListingFavoriteUseCase.swift
//  Kohere
//
//  Created by soomin on 9/22/26.
//

import ComposableArchitecture

public struct UpdateListingFavoriteUseCase: Sendable {
    public var execute: @Sendable (_ listingID: String, _ isCurrentlyFavorited: Bool) async throws -> ListingFavoriteStatus

    public init(execute: @escaping @Sendable (_ listingID: String, _ isCurrentlyFavorited: Bool) async throws -> ListingFavoriteStatus) {
        self.execute = execute
    }
}

extension UpdateListingFavoriteUseCase: DependencyKey {
    public static let liveValue: UpdateListingFavoriteUseCase = {
        @Dependency(\.listingClient)
        var listingClient

        return UpdateListingFavoriteUseCase { listingID, isCurrentlyFavorited in
            if isCurrentlyFavorited {
                try await listingClient.removeFavorite(listingID)
            } else {
                try await listingClient.addFavorite(listingID)
            }
        }
    }()
}

public extension DependencyValues {
    var updateListingFavoriteUseCase: UpdateListingFavoriteUseCase {
        get { self[UpdateListingFavoriteUseCase.self] }
        set { self[UpdateListingFavoriteUseCase.self] = newValue }
    }
}
