//
//  MapMarkerItem.swift
//  Kohere
//
//  Created by Codex on 6/19/26.
//

public struct MapMarkerItem: Equatable, Identifiable, Sendable {
    public let id: String
    public let coordinate: MapCoordinate

    public init(
        id: String,
        coordinate: MapCoordinate
    ) {
        self.id = id
        self.coordinate = coordinate
    }
}
