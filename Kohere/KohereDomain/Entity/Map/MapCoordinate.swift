//
//  MapCoordinate.swift
//  Kohere
//
//  Created by Codex on 6/19/26.
//

public nonisolated struct MapCoordinate: Equatable, Hashable, Sendable {
    public let latitude: Double
    public let longitude: Double

    public init(
        latitude: Double,
        longitude: Double
    ) {
        self.latitude = latitude
        self.longitude = longitude
    }
}
