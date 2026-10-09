//
//  FetchListingsUseCase.swift
//  Kohere
//
//  Created by Codex on 7/5/26.
//

import ComposableArchitecture

public struct FetchListingsUseCase {
    public var execute: (_ input: ListingSearchInput) async throws -> ListingSearchPage

    public init(execute: @escaping (_ input: ListingSearchInput) async throws -> ListingSearchPage) {
        self.execute = execute
    }
}

extension FetchListingsUseCase: DependencyKey {
    public static let liveValue: FetchListingsUseCase = {
        @Dependency(\.listingClient)
        var listingClient

        return FetchListingsUseCase { input in
            try await listingClient.fetchListings(input)
        }
    }()
}

public extension DependencyValues {
    var fetchListingsUseCase: FetchListingsUseCase {
        get { self[FetchListingsUseCase.self] }
        set { self[FetchListingsUseCase.self] = newValue }
    }
}
