//
//  FetchChatRoomUseCase.swift
//  Kohere
//
//  Created by soomin on 8/25/26.
//

import ComposableArchitecture

public struct FetchChatRoomUseCase {
    public var execute: (_ roomID: Int) async throws -> ChatRoom

    public init(execute: @escaping (_ roomID: Int) async throws -> ChatRoom) {
        self.execute = execute
    }
}

extension FetchChatRoomUseCase: DependencyKey {
    public static let liveValue: FetchChatRoomUseCase = {
        @Dependency(\.chatClient)
        var chatClient

        return FetchChatRoomUseCase { roomID in
            try await chatClient.fetchChatRoom(roomID)
        }
    }()
}

public extension DependencyValues {
    var fetchChatRoomUseCase: FetchChatRoomUseCase {
        get { self[FetchChatRoomUseCase.self] }
        set { self[FetchChatRoomUseCase.self] = newValue }
    }
}
