//
//  CreateListingBookingUseCase.swift
//  Kohere
//
//  Created by Codex on 7/9/26.
//

import ComposableArchitecture

public struct CreateListingBookingUseCase {
    public var execute: (_ listingID: String, _ input: ListingBookingCreateInput) async throws -> ListingBooking

    public init(execute: @escaping (_ listingID: String, _ input: ListingBookingCreateInput) async throws -> ListingBooking) {
        self.execute = execute
    }
}

extension CreateListingBookingUseCase: DependencyKey {
    public static let liveValue: CreateListingBookingUseCase = {
        @Dependency(\.listingClient)
        var listingClient

        return CreateListingBookingUseCase { listingID, input in
            try await listingClient.createBooking(listingID, input)
        }
    }()
}

public extension DependencyValues {
    var createListingBookingUseCase: CreateListingBookingUseCase {
        get { self[CreateListingBookingUseCase.self] }
        set { self[CreateListingBookingUseCase.self] = newValue }
    }
}
