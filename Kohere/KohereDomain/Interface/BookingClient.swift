//
//  BookingClient.swift
//  Kohere
//
//  Created by Codex on 7/8/26.
//

import Dependencies

public enum BookingMutation: Equatable, Sendable {
    case report
    case block
    case delete
}

public struct BookingClient: Sendable {
    public var fetchBookings: @Sendable (_ page: Int, _ size: Int) async throws -> BookingPage
    public var fetchBookingDetail: @Sendable (_ bookingID: Int) async throws -> BookingDetail
    public var mutateBooking: @Sendable (_ mutation: BookingMutation, _ bookingID: Int) async throws -> Void

    public init(
        fetchBookings: @escaping @Sendable (_ page: Int, _ size: Int) async throws -> BookingPage,
        fetchBookingDetail: @escaping @Sendable (_ bookingID: Int) async throws -> BookingDetail,
        mutateBooking: @escaping @Sendable (_ mutation: BookingMutation, _ bookingID: Int) async throws -> Void
    ) {
        self.fetchBookings = fetchBookings
        self.fetchBookingDetail = fetchBookingDetail
        self.mutateBooking = mutateBooking
    }
}

extension BookingClient: TestDependencyKey {
    public static let testValue = BookingClient(
        fetchBookings: { _, _ in throw CancellationError() },
        fetchBookingDetail: { _ in throw CancellationError() },
        mutateBooking: { _, _ in }
    )
}

extension DependencyValues {
    public var bookingClient: BookingClient {
        get { self[BookingClient.self] }
        set { self[BookingClient.self] = newValue }
    }
}
