//
//  FetchBookingsUseCase.swift
//  Kohere
//
//  Created by Codex on 7/8/26.
//

import ComposableArchitecture

public struct FetchBookingsUseCase {
    public var execute: (_ page: Int, _ size: Int) async throws -> BookingPage

    public init(execute: @escaping (_ page: Int, _ size: Int) async throws -> BookingPage) {
        self.execute = execute
    }
}

extension FetchBookingsUseCase: DependencyKey {
    public static let liveValue: FetchBookingsUseCase = {
        @Dependency(\.bookingClient)
        var bookingClient
        
        return FetchBookingsUseCase { page, size in
            try await bookingClient.fetchBookings(page, size)
        }
    }()
}

public extension DependencyValues {
    var fetchBookingsUseCase: FetchBookingsUseCase {
        get { self[FetchBookingsUseCase.self] }
        set { self[FetchBookingsUseCase.self] = newValue }
    }
}
