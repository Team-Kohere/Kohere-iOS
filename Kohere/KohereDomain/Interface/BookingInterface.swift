//
//  BookingInterface.swift
//  Kohere
//
//  Created by Codex on 7/8/26.
//

import ComposableArchitecture

public protocol BookingInterface {
    func fetchBookings(page: Int, size: Int) async throws -> BookingPage
    func fetchBookingDetail(bookingID: Int) async throws -> BookingDetail
    func mutateBooking(_ mutation: BookingMutation, bookingID: Int) async throws
}

public enum BookingMutation: Equatable, Sendable {
    case report
    case block
    case delete
}

public struct BookingClient: Sendable {
    public var fetchBookings: @Sendable (_ page: Int, _ size: Int) async throws -> BookingPage
    public var fetchBookingDetail: @Sendable (_ bookingID: Int) async throws -> BookingDetail
    public var mutateBooking: @Sendable (_ mutation: BookingMutation, _ bookingID: Int) async throws -> Void
}

extension BookingClient {
    public init(repository: any BookingInterface) {
        self.init(
            fetchBookings: { page, size in
                try await repository.fetchBookings(page: page, size: size)
            },
            fetchBookingDetail: { bookingID in
                try await repository.fetchBookingDetail(bookingID: bookingID)
            },
            mutateBooking: { mutation, bookingID in
                try await repository.mutateBooking(mutation, bookingID: bookingID)
            }
        )
    }
}

extension BookingClient: DependencyKey {
    public static let liveValue = BookingClient(
        fetchBookings: { _, _ in throw CancellationError() },
        fetchBookingDetail: { _ in throw CancellationError() },
        mutateBooking: { _, _ in }
    )

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
