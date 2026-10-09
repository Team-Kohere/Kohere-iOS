//
//  ChatRoom.swift
//  Kohere
//
//  Created by soomin on 8/25/26.
//

import Foundation

public nonisolated enum ChatRoomRole: String, Equatable, Sendable {
    case tenant = "TENANT"
    case landlord = "LANDLORD"

    public init?(userType: UserType) {
        switch userType {
        case .tenant:
            self = .tenant
        case .landlord:
            self = .landlord
        case .unknown:
            return nil
        }
    }
}

public nonisolated struct ChatRoom: Equatable, Identifiable, Sendable {
    public let roomID: Int
    public let myRole: ChatRoomRole
    public let listing: ChatRoomListing
    public let counterpart: ChatRoomCounterpart
    public let isBlocked: Bool
    public let lastMessage: ChatRoomLastMessage?

    public var id: Int { roomID }

    public init(
        roomID: Int,
        myRole: ChatRoomRole,
        listing: ChatRoomListing,
        counterpart: ChatRoomCounterpart,
        isBlocked: Bool,
        lastMessage: ChatRoomLastMessage?
    ) {
        self.roomID = roomID
        self.myRole = myRole
        self.listing = listing
        self.counterpart = counterpart
        self.isBlocked = isBlocked
        self.lastMessage = lastMessage
    }
}

public nonisolated struct ChatRoomPage: Equatable, Sendable {
    public let content: [ChatRoom]
    public let page: PageInfo

    public init(
        content: [ChatRoom],
        page: PageInfo
    ) {
        self.content = content
        self.page = page
    }
}

public nonisolated struct ChatRoomLastMessage: Equatable, Sendable {
    public let messageID: Int?
    public let type: ChatMessageType?
    public let preview: String?
    public let sentAt: Date?

    public init(
        messageID: Int?,
        type: ChatMessageType?,
        preview: String?,
        sentAt: Date?
    ) {
        self.messageID = messageID
        self.type = type
        self.preview = preview
        self.sentAt = sentAt
    }
}

public nonisolated enum ChatMessageType: String, Equatable, Sendable {
    case text = "TEXT"
    case inquiryCard = "INQUIRY_CARD"
    case bookingCard = "BOOKING_CARD"
}

public nonisolated struct ChatRoomListing: Equatable, Sendable {
    public let listingID: String
    public let title: String
    public let address: String

    public init(
        listingID: String,
        title: String,
        address: String
    ) {
        self.listingID = listingID
        self.title = title
        self.address = address
    }
}

public nonisolated struct ChatRoomCounterpart: Equatable, Sendable {
    public let userID: Int
    public let displayName: String

    public init(
        userID: Int,
        displayName: String
    ) {
        self.userID = userID
        self.displayName = displayName
    }
}

public nonisolated struct ChatInquiry: Equatable, Sendable {
    public let roomID: Int
    public let isCreated: Bool

    public init(
        roomID: Int,
        isCreated: Bool
    ) {
        self.roomID = roomID
        self.isCreated = isCreated
    }
}

public nonisolated enum ChatReportReason: String, CaseIterable, Equatable, Sendable {
    case abuseHarassmentDiscrimination = "ABUSE_HARASSMENT_DISCRIMINATION"
    case illegalContent = "ILLEGAL_CONTENT"
    case sexualInappropriateContent = "SEXUAL_INAPPROPRIATE_CONTENT"
    case personalInformation = "PERSONAL_INFORMATION"
    case spam = "SPAM"
    case other = "OTHER"
}

public nonisolated struct ChatReport: Equatable, Sendable {
    public let reportID: Int
    public let roomID: Int
    public let reason: ChatReportReason
    public let status: String
    public let receivedAt: Date

    public init(
        reportID: Int,
        roomID: Int,
        reason: ChatReportReason,
        status: String,
        receivedAt: Date
    ) {
        self.reportID = reportID
        self.roomID = roomID
        self.reason = reason
        self.status = status
        self.receivedAt = receivedAt
    }
}

public nonisolated struct ChatMessagePage: Equatable, Sendable {
    public let content: [StoredChatMessage]
    public let nextCursor: String?
    public let hasNext: Bool

    public init(
        content: [StoredChatMessage],
        nextCursor: String?,
        hasNext: Bool
    ) {
        self.content = content
        self.nextCursor = nextCursor
        self.hasNext = hasNext
    }
}

public nonisolated struct StoredChatMessage: Equatable, Identifiable, Sendable {
    public let messageID: Int
    public let roomID: Int
    public let type: ChatMessageType
    public let isMine: Bool
    public let originalContent: String?
    public let translatedContent: String?
    public let sentAt: Date
    public let inquiryCard: ChatInquiryCard?
    public let bookingCard: ChatBookingCard?

    public var id: Int { messageID }

    public init(
        messageID: Int,
        roomID: Int,
        type: ChatMessageType,
        isMine: Bool,
        originalContent: String?,
        translatedContent: String?,
        sentAt: Date,
        inquiryCard: ChatInquiryCard?,
        bookingCard: ChatBookingCard?
    ) {
        self.messageID = messageID
        self.roomID = roomID
        self.type = type
        self.isMine = isMine
        self.originalContent = originalContent
        self.translatedContent = translatedContent
        self.sentAt = sentAt
        self.inquiryCard = inquiryCard
        self.bookingCard = bookingCard
    }
}

public nonisolated struct ChatInquiryCard: Equatable, Sendable {
    public let listingID: String
    public let thumbnailURL: String?
    public let title: String
    public let city: String
    public let district: String
    public let listingType: String
    public let monthlyRentMin: Int
    public let monthlyRentMax: Int

    public init(
        listingID: String,
        thumbnailURL: String?,
        title: String,
        city: String,
        district: String,
        listingType: String,
        monthlyRentMin: Int,
        monthlyRentMax: Int
    ) {
        self.listingID = listingID
        self.thumbnailURL = thumbnailURL
        self.title = title
        self.city = city
        self.district = district
        self.listingType = listingType
        self.monthlyRentMin = monthlyRentMin
        self.monthlyRentMax = monthlyRentMax
    }
}

public nonisolated struct ChatBookingCard: Equatable, Sendable {
    public let bookingID: Int?
    public let roomOfferID: String?
    public let roomOfferName: String?
    public let moveInDate: Date?
    public let contractPeriod: Int?
    public let deposit: Int?
    public let totalAmount: Int?
    public let listing: ChatBookingListing?
    public let applicant: ChatBookingApplicant?

    public init(
        bookingID: Int?,
        roomOfferID: String?,
        roomOfferName: String?,
        moveInDate: Date?,
        contractPeriod: Int?,
        deposit: Int?,
        totalAmount: Int?,
        listing: ChatBookingListing?,
        applicant: ChatBookingApplicant?
    ) {
        self.bookingID = bookingID
        self.roomOfferID = roomOfferID
        self.roomOfferName = roomOfferName
        self.moveInDate = moveInDate
        self.contractPeriod = contractPeriod
        self.deposit = deposit
        self.totalAmount = totalAmount
        self.listing = listing
        self.applicant = applicant
    }
}

public nonisolated struct ChatBookingListing: Equatable, Sendable {
    public let listingID: String?
    public let title: String?
    public let address: String?
    public let monthlyRent: Int?
    public let thumbnailURL: String?

    public init(
        listingID: String?,
        title: String?,
        address: String?,
        monthlyRent: Int?,
        thumbnailURL: String?
    ) {
        self.listingID = listingID
        self.title = title
        self.address = address
        self.monthlyRent = monthlyRent
        self.thumbnailURL = thumbnailURL
    }
}

public nonisolated struct ChatBookingApplicant: Equatable, Sendable {
    public let userID: Int?
    public let name: String?
    public let gender: String?
    public let country: String?
    public let countryName: String?
    public let email: String?

    public init(
        userID: Int?,
        name: String?,
        gender: String?,
        country: String?,
        countryName: String?,
        email: String?
    ) {
        self.userID = userID
        self.name = name
        self.gender = gender
        self.country = country
        self.countryName = countryName
        self.email = email
    }
}
