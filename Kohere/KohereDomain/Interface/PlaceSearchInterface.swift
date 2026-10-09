//
//  PlaceSearchInterface.swift
//  Kohere
//
//  Created by Codex on 7/8/26.
//

import ComposableArchitecture

public protocol PlaceSearchInterface: Sendable {
    func searchPlaces(keyword: String) async throws -> [PlaceSearchResult]
}

public struct PlaceSearchClient: Sendable {
    public var searchPlaces: @Sendable (_ keyword: String) async throws -> [PlaceSearchResult]
}

extension PlaceSearchClient {
    public init(repository: any PlaceSearchInterface) {
        self.init(
            searchPlaces: { keyword in
                try await repository.searchPlaces(keyword: keyword)
            }
        )
    }
}

extension PlaceSearchClient: DependencyKey {
    public static let liveValue = PlaceSearchClient(
        searchPlaces: { _ in throw CancellationError() }
    )

    public static let testValue = PlaceSearchClient(
        searchPlaces: { _ in throw CancellationError() }
    )
}

extension DependencyValues {
    public var placeSearchClient: PlaceSearchClient {
        get { self[PlaceSearchClient.self] }
        set { self[PlaceSearchClient.self] = newValue }
    }
}
