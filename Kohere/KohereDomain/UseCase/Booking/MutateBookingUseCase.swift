//
//  MutateBookingUseCase.swift
//  Kohere
//
//  Created by soomin on 7/22/26.
//

import ComposableArchitecture

public struct MutateBookingUseCase {
    public var execute: (_ mutation: BookingMutation, _ bookingID: Int) async throws -> Void

    public init(execute: @escaping (_ mutation: BookingMutation, _ bookingID: Int) async throws -> Void) {
        self.execute = execute
    }
}

extension MutateBookingUseCase: DependencyKey {
    public static let liveValue: MutateBookingUseCase = {
        @Dependency(\.bookingClient)
        var bookingClient

        return MutateBookingUseCase { mutation, bookingID in
            try await bookingClient.mutateBooking(mutation, bookingID)
        }
    }()
}

public extension DependencyValues {
    var mutateBookingUseCase: MutateBookingUseCase {
        get { self[MutateBookingUseCase.self] }
        set { self[MutateBookingUseCase.self] = newValue }
    }
}
