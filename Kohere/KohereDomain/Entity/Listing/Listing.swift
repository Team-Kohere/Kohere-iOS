//
//  Listing.swift
//  Kohere
//
//  Created by soomin on 6/23/26.
//

public struct Listing: Equatable, Identifiable, Sendable {
    public nonisolated var id: String { listingID }

    public let listingID: String
    public let title: String
    public let type: String
    public let minMonthlyRent: Int?
    public let maxMonthlyRent: Int?
    public let minDeposit: Int?
    public let maxDeposit: Int?
    public let minMaintenanceFee: Int?
    public let maxMaintenanceFee: Int?
    public let minStayMonths: Int?
    public let maxStayMonths: Int?
    public let thumbnailURL: String?
    public let coordinate: MapCoordinate?
    public let address: String?
    public let nearestTransit: ListingNearestTransit?
    public let distanceMeters: Double?
    public let isFavorited: Bool
    public let favoriteCount: Int?

    public init(
        listingID: String,
        title: String,
        type: String,
        minMonthlyRent: Int?,
        maxMonthlyRent: Int?,
        minDeposit: Int?,
        maxDeposit: Int?,
        minMaintenanceFee: Int?,
        maxMaintenanceFee: Int?,
        minStayMonths: Int?,
        maxStayMonths: Int?,
        thumbnailURL: String?,
        coordinate: MapCoordinate?,
        address: String?,
        nearestTransit: ListingNearestTransit?,
        distanceMeters: Double?,
        isFavorited: Bool,
        favoriteCount: Int?
    ) {
        self.listingID = listingID
        self.title = title
        self.type = type
        self.minMonthlyRent = minMonthlyRent
        self.maxMonthlyRent = maxMonthlyRent
        self.minDeposit = minDeposit
        self.maxDeposit = maxDeposit
        self.minMaintenanceFee = minMaintenanceFee
        self.maxMaintenanceFee = maxMaintenanceFee
        self.minStayMonths = minStayMonths
        self.maxStayMonths = maxStayMonths
        self.thumbnailURL = thumbnailURL
        self.coordinate = coordinate
        self.address = address
        self.nearestTransit = nearestTransit
        self.distanceMeters = distanceMeters
        self.isFavorited = isFavorited
        self.favoriteCount = favoriteCount
    }
}

public struct ListingNearestTransit: Equatable, Sendable {
    public let type: String
    public let name: String
    public let walkMinutes: Int?

    public init(
        type: String,
        name: String,
        walkMinutes: Int?
    ) {
        self.type = type
        self.name = name
        self.walkMinutes = walkMinutes
    }
}

public struct ListingFavoriteStatus: Equatable, Sendable {
    public let isFavorited: Bool
    public let favoriteCount: Int

    public init(
        isFavorited: Bool,
        favoriteCount: Int
    ) {
        self.isFavorited = isFavorited
        self.favoriteCount = favoriteCount
    }
}

public struct ListingMapMarker: Equatable, Identifiable, Sendable {
    public nonisolated var id: String { listingID }

    public let listingID: String
    public let coordinate: MapCoordinate

    public init(
        listingID: String,
        coordinate: MapCoordinate
    ) {
        self.listingID = listingID
        self.coordinate = coordinate
    }
}
