//
//  ListingBooking.swift
//  Kohere
//
//  Created by Codex on 7/9/26.
//

import Foundation

public struct ListingBookingCreateInput: Equatable, Sendable {
    public let roomOfferID: String
    public let moveInDate: Date
    public let contractPeriod: Int

    public init(
        roomOfferID: String,
        moveInDate: Date,
        contractPeriod: Int
    ) {
        self.roomOfferID = roomOfferID
        self.moveInDate = moveInDate
        self.contractPeriod = contractPeriod
    }
}

public struct ListingBooking: Equatable, Identifiable, Sendable {
    public nonisolated var id: Int { bookingID }

    public let bookingID: Int
    public let status: String
    public let listingID: String
    public let roomOfferID: String
    public let moveInDate: String
    public let contractPeriod: Int
    public let createdAt: String

    public init(
        bookingID: Int,
        status: String,
        listingID: String,
        roomOfferID: String,
        moveInDate: String,
        contractPeriod: Int,
        createdAt: String
    ) {
        self.bookingID = bookingID
        self.status = status
        self.listingID = listingID
        self.roomOfferID = roomOfferID
        self.moveInDate = moveInDate
        self.contractPeriod = contractPeriod
        self.createdAt = createdAt
    }
}
