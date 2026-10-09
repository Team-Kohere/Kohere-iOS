//
//  FetchListingDetailUseCase.swift
//  Kohere
//
//  Created by Codex on 7/8/26.
//

import ComposableArchitecture

public struct FetchListingDetailUseCase {
    public var execute: @MainActor @Sendable (_ listingID: String) async throws -> ListingDetail

    public init(execute: @escaping @MainActor @Sendable (_ listingID: String) async throws -> ListingDetail) {
        self.execute = execute
    }
}

extension FetchListingDetailUseCase: DependencyKey {
    public static let liveValue: FetchListingDetailUseCase = {
        @Dependency(\.listingClient)
        var listingClient

        return FetchListingDetailUseCase { listingID in
            try await listingClient.fetchDetail(listingID)
        }
    }()
}

public extension DependencyValues {
    var fetchListingDetailUseCase: FetchListingDetailUseCase {
        get { self[FetchListingDetailUseCase.self] }
        set { self[FetchListingDetailUseCase.self] = newValue }
    }
}
