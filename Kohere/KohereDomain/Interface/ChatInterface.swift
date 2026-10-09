//
//  ChatInterface.swift
//  Kohere
//
//  Created by soomin on 8/25/26.
//

import ComposableArchitecture

public protocol ChatInterface {
    func fetchStompGuide() async throws -> ChatStompGuide
    func fetchChatRooms(page: Int, size: Int) async throws -> ChatRoomPage
    func fetchChatRoom(roomID: Int) async throws -> ChatRoom
    func createInquiry(listingID: String) async throws -> ChatInquiry
    func fetchMessages(roomID: Int, cursor: String?, afterMessageID: Int?, size: Int) async throws -> ChatMessagePage
    func hideRoom(roomID: Int) async throws
    func blockRoom(roomID: Int) async throws
    func reportRoom(roomID: Int, reason: ChatReportReason) async throws -> ChatReport
}

public struct ChatClient: Sendable {
    public var fetchStompGuide: @Sendable () async throws -> ChatStompGuide
    public var fetchChatRooms: @Sendable (_ page: Int, _ size: Int) async throws -> ChatRoomPage
    public var fetchChatRoom: @Sendable (_ roomID: Int) async throws -> ChatRoom
    public var createInquiry: @Sendable (_ listingID: String) async throws -> ChatInquiry
    public var fetchMessages: @Sendable (_ roomID: Int, _ cursor: String?, _ afterMessageID: Int?, _ size: Int) async throws -> ChatMessagePage
    public var hideRoom: @Sendable (_ roomID: Int) async throws -> Void
    public var blockRoom: @Sendable (_ roomID: Int) async throws -> Void
    public var reportRoom: @Sendable (_ roomID: Int, _ reason: ChatReportReason) async throws -> ChatReport
}

extension ChatClient {
    public init(repository: any ChatInterface) {
        self.init(
            fetchStompGuide: {
                try await repository.fetchStompGuide()
            },
            fetchChatRooms: { page, size in
                try await repository.fetchChatRooms(page: page, size: size)
            },
            fetchChatRoom: { roomID in
                try await repository.fetchChatRoom(roomID: roomID)
            },
            createInquiry: { listingID in
                try await repository.createInquiry(listingID: listingID)
            },
            fetchMessages: { roomID, cursor, afterMessageID, size in
                try await repository.fetchMessages(roomID: roomID, cursor: cursor, afterMessageID: afterMessageID, size: size)
            },
            hideRoom: { roomID in
                try await repository.hideRoom(roomID: roomID)
            },
            blockRoom: { roomID in
                try await repository.blockRoom(roomID: roomID)
            },
            reportRoom: { roomID, reason in
                try await repository.reportRoom(roomID: roomID, reason: reason)
            }
        )
    }
}

extension ChatClient: DependencyKey {
    public static let liveValue = ChatClient(
        fetchStompGuide: { throw CancellationError() },
        fetchChatRooms: { _, _ in throw CancellationError() },
        fetchChatRoom: { _ in throw CancellationError() },
        createInquiry: { _ in throw CancellationError() },
        fetchMessages: { _, _, _, _ in throw CancellationError() },
        hideRoom: { _ in },
        blockRoom: { _ in },
        reportRoom: { _, _ in throw CancellationError() }
    )

    public static let testValue = ChatClient(
        fetchStompGuide: { throw CancellationError() },
        fetchChatRooms: { _, _ in throw CancellationError() },
        fetchChatRoom: { _ in throw CancellationError() },
        createInquiry: { _ in throw CancellationError() },
        fetchMessages: { _, _, _, _ in throw CancellationError() },
        hideRoom: { _ in },
        blockRoom: { _ in },
        reportRoom: { _, _ in throw CancellationError() }
    )
}

extension DependencyValues {
    public var chatClient: ChatClient {
        get { self[ChatClient.self] }
        set { self[ChatClient.self] = newValue }
    }
}
