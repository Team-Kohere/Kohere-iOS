//
//  CreateChatInquiryUseCase.swift
//  Kohere
//

import ComposableArchitecture

public struct CreateChatInquiryUseCase {
    public var execute: (_ listingID: String) async throws -> ChatInquiry

    public init(execute: @escaping (_ listingID: String) async throws -> ChatInquiry) {
        self.execute = execute
    }
}

extension CreateChatInquiryUseCase: DependencyKey {
    public static let liveValue: CreateChatInquiryUseCase = {
        @Dependency(\.chatClient)
        var chatClient

        return CreateChatInquiryUseCase { listingID in
            try await chatClient.createInquiry(listingID)
        }
    }()
}

public extension DependencyValues {
    var createChatInquiryUseCase: CreateChatInquiryUseCase {
        get { self[CreateChatInquiryUseCase.self] }
        set { self[CreateChatInquiryUseCase.self] = newValue }
    }
}
