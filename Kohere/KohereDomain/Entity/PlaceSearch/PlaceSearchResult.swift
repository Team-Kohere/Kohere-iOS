//
//  PlaceSearchResult.swift
//  Kohere
//
//  Created by Codex on 7/8/26.
//

import Foundation

public nonisolated struct PlaceSearchResult: Equatable, Identifiable, Sendable {
    public let id: String
    public let title: String
    public let roadAddress: String
    public let address: String
    public let coordinate: MapCoordinate

    public var displayAddress: String {
        roadAddress.isEmpty ? address : roadAddress
    }

    public init(
        id: String,
        title: String,
        roadAddress: String,
        address: String,
        coordinate: MapCoordinate
    ) {
        self.id = id
        self.title = title
        self.roadAddress = roadAddress
        self.address = address
        self.coordinate = coordinate
    }
}
