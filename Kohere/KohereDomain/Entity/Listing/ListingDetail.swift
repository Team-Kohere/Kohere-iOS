//
//  ListingDetail.swift
//  Kohere
//
//  Created by Codex on 7/8/26.
//

public struct ListingDetail: Equatable, Identifiable, Sendable {
    public nonisolated var id: String { listingID }

    public let listingID: String
    public let title: String
    public let type: String
    public let status: String
    public let rentalType: String
    public let refundPolicy: ListingDetailRefundPolicy?
    public let contract: ListingDetailContract?
    public let genderPolicy: String?
    public let coordinate: MapCoordinate?
    public let address: ListingDetailAddress?
    public let nearestTransit: ListingDetailNearestTransit?
    public let nearbyUniversityCodes: [String]
    public let building: ListingDetailBuilding?
    public let propertyPolicies: ListingDetailPropertyPolicies?
    public let facilities: ListingDetailFacilities?
    public let conditions: [String]
    public let roomOffers: [ListingDetailRoomOffer]
    public let descriptions: ListingDetailDescriptions?
    public let imageURLs: [String]
    public let isFavorited: Bool
    public let favoriteCount: Int
    public let createdAt: String?
    public let updatedAt: String?

    public init(
        listingID: String,
        title: String,
        type: String,
        status: String,
        rentalType: String,
        refundPolicy: ListingDetailRefundPolicy?,
        contract: ListingDetailContract?,
        genderPolicy: String?,
        coordinate: MapCoordinate?,
        address: ListingDetailAddress?,
        nearestTransit: ListingDetailNearestTransit?,
        nearbyUniversityCodes: [String],
        building: ListingDetailBuilding?,
        propertyPolicies: ListingDetailPropertyPolicies?,
        facilities: ListingDetailFacilities?,
        conditions: [String],
        roomOffers: [ListingDetailRoomOffer],
        descriptions: ListingDetailDescriptions?,
        imageURLs: [String],
        isFavorited: Bool,
        favoriteCount: Int,
        createdAt: String?,
        updatedAt: String?
    ) {
        self.listingID = listingID
        self.title = title
        self.type = type
        self.status = status
        self.rentalType = rentalType
        self.refundPolicy = refundPolicy
        self.contract = contract
        self.genderPolicy = genderPolicy
        self.coordinate = coordinate
        self.address = address
        self.nearestTransit = nearestTransit
        self.nearbyUniversityCodes = nearbyUniversityCodes
        self.building = building
        self.propertyPolicies = propertyPolicies
        self.facilities = facilities
        self.conditions = conditions
        self.roomOffers = roomOffers
        self.descriptions = descriptions
        self.imageURLs = imageURLs
        self.isFavorited = isFavorited
        self.favoriteCount = favoriteCount
        self.createdAt = createdAt
        self.updatedAt = updatedAt
    }
}

public struct ListingDetailRefundPolicy: Equatable, Sendable {
    public let code: String
    public let description: String?

    public init(
        code: String,
        description: String?
    ) {
        self.code = code
        self.description = description
    }
}

public struct ListingDetailContract: Equatable, Sendable {
    public let minStayMonths: Int?
    public let maxStayMonths: Int?

    public init(
        minStayMonths: Int?,
        maxStayMonths: Int?
    ) {
        self.minStayMonths = minStayMonths
        self.maxStayMonths = maxStayMonths
    }
}

public struct ListingDetailAddress: Equatable, Sendable {
    public let city: String?
    public let district: String?
    public let fullAddress: String?
    public let detail: String?

    public init(
        city: String?,
        district: String?,
        fullAddress: String?,
        detail: String?
    ) {
        self.city = city
        self.district = district
        self.fullAddress = fullAddress
        self.detail = detail
    }
}

public struct ListingDetailNearestTransit: Equatable, Sendable {
    public let type: String?
    public let name: String
    public let walkMinutes: Int?
    public let nearbyPlacesDescription: String?

    public init(
        type: String?,
        name: String,
        walkMinutes: Int?,
        nearbyPlacesDescription: String?
    ) {
        self.type = type
        self.name = name
        self.walkMinutes = walkMinutes
        self.nearbyPlacesDescription = nearbyPlacesDescription
    }
}

public struct ListingDetailBuilding: Equatable, Sendable {
    public let type: String?
    public let usedFloorMin: Int?
    public let usedFloorMax: Int?
    public let totalFloors: Int?
    public let parkingAvailable: Bool?
    public let elevatorAvailable: Bool?

    public init(
        type: String?,
        usedFloorMin: Int?,
        usedFloorMax: Int?,
        totalFloors: Int?,
        parkingAvailable: Bool?,
        elevatorAvailable: Bool?
    ) {
        self.type = type
        self.usedFloorMin = usedFloorMin
        self.usedFloorMax = usedFloorMax
        self.totalFloors = totalFloors
        self.parkingAvailable = parkingAvailable
        self.elevatorAvailable = elevatorAvailable
    }
}

public struct ListingDetailPropertyPolicies: Equatable, Sendable {
    public let arcRequired: Bool?
    public let residentRegistrationAvailable: Bool?
    public let mealsProvided: Bool?
    public let englishAvailable: Bool?

    public init(
        arcRequired: Bool?,
        residentRegistrationAvailable: Bool?,
        mealsProvided: Bool?,
        englishAvailable: Bool?
    ) {
        self.arcRequired = arcRequired
        self.residentRegistrationAvailable = residentRegistrationAvailable
        self.mealsProvided = mealsProvided
        self.englishAvailable = englishAvailable
    }
}

public struct ListingDetailFacilities: Equatable, Sendable {
    public let heatingSystem: [String]
    public let kitchen: [String]
    public let laundry: [String]
    public let livingAmenities: [String]
    public let securityFeatures: [String]
    public let commonSpaces: [ListingDetailCommonSpace]
    public let providedSupplies: [String]

    public init(
        heatingSystem: [String],
        kitchen: [String],
        laundry: [String],
        livingAmenities: [String],
        securityFeatures: [String],
        commonSpaces: [ListingDetailCommonSpace],
        providedSupplies: [String]
    ) {
        self.heatingSystem = heatingSystem
        self.kitchen = kitchen
        self.laundry = laundry
        self.livingAmenities = livingAmenities
        self.securityFeatures = securityFeatures
        self.commonSpaces = commonSpaces
        self.providedSupplies = providedSupplies
    }
}

public struct ListingDetailCommonSpace: Equatable, Sendable {
    public let type: String
    public let count: Int?

    public init(
        type: String,
        count: Int?
    ) {
        self.type = type
        self.count = count
    }
}

public struct ListingDetailRoomOffer: Equatable, Identifiable, Sendable {
    public let id: String
    public let name: String
    public let status: String?
    public let pricing: ListingDetailRoomPricing?
    public let inventory: ListingDetailRoomInventory?
    public let filterTags: [String]
    public let roomImageURLs: [String]

    public init(
        id: String,
        name: String,
        status: String?,
        pricing: ListingDetailRoomPricing?,
        inventory: ListingDetailRoomInventory?,
        filterTags: [String],
        roomImageURLs: [String]
    ) {
        self.id = id
        self.name = name
        self.status = status
        self.pricing = pricing
        self.inventory = inventory
        self.filterTags = filterTags
        self.roomImageURLs = roomImageURLs
    }
}

public struct ListingDetailRoomPricing: Equatable, Sendable {
    public let monthlyRent: Int?
    public let deposit: Int?
    public let maintenanceFee: Int?
    public let currency: String?

    public init(
        monthlyRent: Int?,
        deposit: Int?,
        maintenanceFee: Int?,
        currency: String?
    ) {
        self.monthlyRent = monthlyRent
        self.deposit = deposit
        self.maintenanceFee = maintenanceFee
        self.currency = currency
    }
}

public struct ListingDetailRoomInventory: Equatable, Sendable {
    public let totalCount: Int?
    public let availableCount: Int?
    public let nextAvailableFrom: String?

    public init(
        totalCount: Int?,
        availableCount: Int?,
        nextAvailableFrom: String?
    ) {
        self.totalCount = totalCount
        self.availableCount = availableCount
        self.nextAvailableFrom = nextAvailableFrom
    }
}

public struct ListingDetailDescriptions: Equatable, Sendable {
    public let korean: String?
    public let english: String?
    public let extraNotes: String?

    public init(
        korean: String?,
        english: String?,
        extraNotes: String?
    ) {
        self.korean = korean
        self.english = english
        self.extraNotes = extraNotes
    }
}
