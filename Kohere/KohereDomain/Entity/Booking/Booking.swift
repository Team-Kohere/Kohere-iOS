//
//  Booking.swift
//  Kohere
//
//  Created by Codex on 7/8/26.
//

import Foundation

public nonisolated struct BookingPage: Equatable, Sendable {
    public let content: [BookingSummary]
    public let page: PageInfo?

    public init(
        content: [BookingSummary],
        page: PageInfo?
    ) {
        self.content = content
        self.page = page
    }
}

public nonisolated struct BookingSummary: Equatable, Identifiable, Sendable {
    public let bookingID: Int
    public let listingID: String
    public let title: String
    public let thumbnailURL: URL?
    public let roomOfferID: String
    public let moveInDate: Date?
    public let contractPeriod: Int
    public let status: String
    public let createdAt: Date?
    
    public var id: Int { bookingID }

    public init(
        bookingID: Int,
        listingID: String,
        title: String,
        thumbnailURL: URL?,
        roomOfferID: String,
        moveInDate: Date?,
        contractPeriod: Int,
        status: String,
        createdAt: Date?
    ) {
        self.bookingID = bookingID
        self.listingID = listingID
        self.title = title
        self.thumbnailURL = thumbnailURL
        self.roomOfferID = roomOfferID
        self.moveInDate = moveInDate
        self.contractPeriod = contractPeriod
        self.status = status
        self.createdAt = createdAt
    }
}

public nonisolated struct BookingDetail: Equatable, Identifiable, Sendable {
    public let bookingID: Int
    public let status: String
    public let listingID: String
    public let roomOfferID: String
    public let title: String
    public let thumbnailURL: URL?
    public let address: String
    public let roomOfferName: String
    public let createdAt: Date?
    public let moveInDate: Date?
    public let contractPeriod: Int
    public let applicantName: String
    public let applicantGender: String
    public let applicantCountry: String
    public let applicantCountryName: String
    public let applicantEmail: String
    public let tenantName: String
    public let deposit: Int
    public let totalAmount: Int
    
    public var id: Int { bookingID }

    public init(
        bookingID: Int,
        status: String,
        listingID: String,
        roomOfferID: String,
        title: String,
        thumbnailURL: URL?,
        address: String,
        roomOfferName: String,
        createdAt: Date?,
        moveInDate: Date?,
        contractPeriod: Int,
        applicantName: String,
        applicantGender: String,
        applicantCountry: String,
        applicantCountryName: String,
        applicantEmail: String,
        tenantName: String,
        deposit: Int,
        totalAmount: Int
    ) {
        self.bookingID = bookingID
        self.status = status
        self.listingID = listingID
        self.roomOfferID = roomOfferID
        self.title = title
        self.thumbnailURL = thumbnailURL
        self.address = address
        self.roomOfferName = roomOfferName
        self.createdAt = createdAt
        self.moveInDate = moveInDate
        self.contractPeriod = contractPeriod
        self.applicantName = applicantName
        self.applicantGender = applicantGender
        self.applicantCountry = applicantCountry
        self.applicantCountryName = applicantCountryName
        self.applicantEmail = applicantEmail
        self.tenantName = tenantName
        self.deposit = deposit
        self.totalAmount = totalAmount
    }
}
