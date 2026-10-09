//
//  ListingSearchInput.swift
//  Kohere
//
//  Created by Codex on 7/5/26.
//

public struct ListingSearchInput: Equatable, Sendable {
    public static let defaultPageSize = 10

    public let bounds: MapBounds?
    public let listingIDs: [String]
    public let page: Int
    public let size: Int
    public let sort: ListingSearchSort
    public let minBudget: Int?
    public let maxBudget: Int?
    public let minDeposit: Int?
    public let maxDeposit: Int?
    public let propertyTypes: [ListingSearchPropertyType]
    public let conditions: [RoomCondition]
    public let arcRequired: Bool?

    public init(
        bounds: MapBounds? = nil,
        listingIDs: [String] = [],
        page: Int = 0,
        size: Int = Self.defaultPageSize,
        sort: ListingSearchSort = .recommended,
        minBudget: Int? = nil,
        maxBudget: Int? = nil,
        minDeposit: Int? = nil,
        maxDeposit: Int? = nil,
        propertyTypes: [ListingSearchPropertyType] = [],
        conditions: [RoomCondition] = [],
        arcRequired: Bool? = nil
    ) {
        self.bounds = bounds
        self.listingIDs = listingIDs
        self.page = page
        self.size = size
        self.sort = sort
        self.minBudget = minBudget
        self.maxBudget = maxBudget
        self.minDeposit = minDeposit
        self.maxDeposit = maxDeposit
        self.propertyTypes = propertyTypes
        self.conditions = conditions
        self.arcRequired = arcRequired
    }
}

public enum ListingSearchSort: String, Equatable, Sendable {
    case recommended = "RECOMMENDED"
    case priceAscending = "PRICE_ASC"
    case distance = "DISTANCE"
}

public enum ListingSearchPropertyType: String, Equatable, Sendable {
    case goshiwon = "GOSHIWON"
    case coLiving = "CO_LIVING"
    case shareHouse = "SHARE_HOUSE"
}
