//
//  FetchRecentListingsUseCase.swift
//  Kohere
//
//  Created by soomin on 9/22/26.
//

import ComposableArchitecture

public struct FetchRecentListingsUseCase: Sendable {
    public var execute: @Sendable () async throws -> [Listing]

    public init(execute: @escaping @Sendable () async throws -> [Listing]) {
        self.execute = execute
    }
}

extension FetchRecentListingsUseCase: DependencyKey {
    public static let liveValue: FetchRecentListingsUseCase = {
        @Dependency(\.listingClient)
        var listingClient

        return FetchRecentListingsUseCase {
            try await listingClient.fetchRecentListings()
        }
    }()
}

public extension DependencyValues {
    var fetchRecentListingsUseCase: FetchRecentListingsUseCase {
        get { self[FetchRecentListingsUseCase.self] }
        set { self[FetchRecentListingsUseCase.self] = newValue }
    }
}
