//
//  MapViewport.swift
//  Kohere
//
//  Created by Codex on 6/22/26.
//

public struct MapViewport: Equatable, Sendable {
    public let center: MapCoordinate
    public let zoomLevel: Double
    public let visibleBounds: MapBounds

    public init(
        center: MapCoordinate,
        zoomLevel: Double,
        visibleBounds: MapBounds
    ) {
        self.center = center
        self.zoomLevel = zoomLevel
        self.visibleBounds = visibleBounds
    }
}

public struct MapBounds: Equatable, Sendable {
    public let southWest: MapCoordinate
    public let northEast: MapCoordinate

    public init(
        southWest: MapCoordinate,
        northEast: MapCoordinate
    ) {
        self.southWest = southWest
        self.northEast = northEast
    }
}
