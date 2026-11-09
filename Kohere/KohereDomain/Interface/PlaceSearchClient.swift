//
//  PlaceSearchClient.swift
//  Kohere
//
//  Created by Codex on 7/8/26.
//

import Dependencies

public struct PlaceSearchClient: Sendable {
    public var searchPlaces: @Sendable (_ keyword: String) async throws -> [PlaceSearchResult]

    public init(
        searchPlaces: @escaping @Sendable (_ keyword: String) async throws -> [PlaceSearchResult]
    ) {
        self.searchPlaces = searchPlaces
    }
}

extension PlaceSearchClient: TestDependencyKey {
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
