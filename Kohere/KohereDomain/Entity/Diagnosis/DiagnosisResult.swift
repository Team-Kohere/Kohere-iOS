//
//  DiagnosisResult.swift
//  Kohere
//
//  Created by Codex on 7/4/26.
//

public struct DiagnosisDetail: Equatable, Sendable {
    public let diagnosisID: Int
    public let region: String
    public let purpose: String
    public let university: String?
    public let district: String?
    public let conditions: [RoomCondition]
    public let monthlyRentMin: Int
    public let monthlyRentMax: Int
    public let arcStatus: String
    public let status: String
    public let submittedAt: String

    public init(
        diagnosisID: Int,
        region: String,
        purpose: String,
        university: String?,
        district: String?,
        conditions: [RoomCondition],
        monthlyRentMin: Int,
        monthlyRentMax: Int,
        arcStatus: String,
        status: String,
        submittedAt: String
    ) {
        self.diagnosisID = diagnosisID
        self.region = region
        self.purpose = purpose
        self.university = university
        self.district = district
        self.conditions = conditions
        self.monthlyRentMin = monthlyRentMin
        self.monthlyRentMax = monthlyRentMax
        self.arcStatus = arcStatus
        self.status = status
        self.submittedAt = submittedAt
    }
}

public nonisolated struct DiagnosisRecommendationsInput: Equatable, Sendable {
    public static let defaultPageSize = 20

    public let diagnosisID: Int
    public let page: Int
    public let size: Int
    // 현재 화면에서는 정렬을 선택하지 않으므로 nil로 두고 서버 기본 정렬을 사용한다.
    public let sort: DiagnosisRecommendationSort?

    public init(
        diagnosisID: Int,
        page: Int = 0,
        size: Int = Self.defaultPageSize,
        sort: DiagnosisRecommendationSort? = nil
    ) {
        self.diagnosisID = diagnosisID
        self.page = page
        self.size = size
        self.sort = sort
    }
}

public nonisolated struct DiagnosisRecommendationSort: Equatable, Sendable {
    public let field: Field
    public let direction: Direction

    public var queryValue: String {
        "\(field.rawValue),\(direction.rawValue)"
    }

    public enum Field: String, Equatable, Sendable {
        case recommended
        case price
        case distance
    }

    public enum Direction: String, Equatable, Sendable {
        case ascending = "asc"
        case descending = "desc"
    }

    public init(
        field: Field,
        direction: Direction
    ) {
        self.field = field
        self.direction = direction
    }
}

public struct DiagnosisRecommendations: Equatable, Sendable {
    public let listings: [DiagnosisRecommendedListing]
    public let page: PageInfo?

    public init(
        listings: [DiagnosisRecommendedListing],
        page: PageInfo?
    ) {
        self.listings = listings
        self.page = page
    }
}

public struct DiagnosisRecommendationMap: Equatable, Sendable {
    public let markers: [ListingMapMarker]
    // 서버는 마커를 최대 500개까지 반환한다. total은 제한 전 전체 개수다.
    public let total: Int

    public init(
        markers: [ListingMapMarker],
        total: Int
    ) {
        self.markers = markers
        self.total = total
    }
}

public struct DiagnosisRecommendedListing: Equatable, Identifiable, Sendable {
    public nonisolated var id: String { listingID }

    public let listingID: String
    public let title: String
    public let type: String
    public let minMonthlyRent: Int?
    public let maxMonthlyRent: Int?
    public let minDeposit: Int?
    public let maxDeposit: Int?
    public let thumbnailURL: String?
    public let coordinate: MapCoordinate?
    public let nearestTransit: ListingNearestTransit?

    public init(
        listingID: String,
        title: String,
        type: String,
        minMonthlyRent: Int?,
        maxMonthlyRent: Int?,
        minDeposit: Int?,
        maxDeposit: Int?,
        thumbnailURL: String?,
        coordinate: MapCoordinate?,
        nearestTransit: ListingNearestTransit?
    ) {
        self.listingID = listingID
        self.title = title
        self.type = type
        self.minMonthlyRent = minMonthlyRent
        self.maxMonthlyRent = maxMonthlyRent
        self.minDeposit = minDeposit
        self.maxDeposit = maxDeposit
        self.thumbnailURL = thumbnailURL
        self.coordinate = coordinate
        self.nearestTransit = nearestTransit
    }
}
