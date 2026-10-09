//
//  FetchBookingDetailUseCase.swift
//  Kohere
//
//  Created by Codex on 7/8/26.
//

import ComposableArchitecture

public struct FetchBookingDetailUseCase {
    public var execute: (_ bookingID: Int) async throws -> BookingDetail

    public init(execute: @escaping (_ bookingID: Int) async throws -> BookingDetail) {
        self.execute = execute
    }
}

extension FetchBookingDetailUseCase: DependencyKey {
    public static let liveValue: FetchBookingDetailUseCase = {
        @Dependency(\.bookingClient)
        var bookingClient
        
        return FetchBookingDetailUseCase { bookingID in
            try await bookingClient.fetchBookingDetail(bookingID)
        }
    }()
}

public extension DependencyValues {
    var fetchBookingDetailUseCase: FetchBookingDetailUseCase {
        get { self[FetchBookingDetailUseCase.self] }
        set { self[FetchBookingDetailUseCase.self] = newValue }
    }
}
