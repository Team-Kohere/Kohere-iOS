//
//  ChatClient.swift
//  Kohere
//
//  Created by soomin on 8/25/26.
//

import Dependencies

public struct ChatClient: Sendable {
    public var fetchStompGuide: @Sendable () async throws -> ChatStompGuide
    public var fetchChatRooms: @Sendable (_ page: Int, _ size: Int) async throws -> ChatRoomPage
    public var fetchChatRoom: @Sendable (_ roomID: Int) async throws -> ChatRoom
    public var createInquiry: @Sendable (_ listingID: String) async throws -> ChatInquiry
    public var fetchMessages: @Sendable (_ roomID: Int, _ cursor: String?, _ afterMessageID: Int?, _ size: Int) async throws -> ChatMessagePage
    public var hideRoom: @Sendable (_ roomID: Int) async throws -> Void
    public var blockRoom: @Sendable (_ roomID: Int) async throws -> Void
    public var reportRoom: @Sendable (_ roomID: Int, _ reason: ChatReportReason) async throws -> ChatReport

    public init(
        fetchStompGuide: @escaping @Sendable () async throws -> ChatStompGuide,
        fetchChatRooms: @escaping @Sendable (_ page: Int, _ size: Int) async throws -> ChatRoomPage,
        fetchChatRoom: @escaping @Sendable (_ roomID: Int) async throws -> ChatRoom,
        createInquiry: @escaping @Sendable (_ listingID: String) async throws -> ChatInquiry,
        fetchMessages: @escaping @Sendable (_ roomID: Int, _ cursor: String?, _ afterMessageID: Int?, _ size: Int) async throws -> ChatMessagePage,
        hideRoom: @escaping @Sendable (_ roomID: Int) async throws -> Void,
        blockRoom: @escaping @Sendable (_ roomID: Int) async throws -> Void,
        reportRoom: @escaping @Sendable (_ roomID: Int, _ reason: ChatReportReason) async throws -> ChatReport
    ) {
        self.fetchStompGuide = fetchStompGuide
        self.fetchChatRooms = fetchChatRooms
        self.fetchChatRoom = fetchChatRoom
        self.createInquiry = createInquiry
        self.fetchMessages = fetchMessages
        self.hideRoom = hideRoom
        self.blockRoom = blockRoom
        self.reportRoom = reportRoom
    }
}

extension ChatClient: TestDependencyKey {
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
