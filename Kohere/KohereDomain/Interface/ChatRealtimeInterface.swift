//
//  ChatRealtimeInterface.swift
//  Kohere
//

import ComposableArchitecture
import Foundation

public struct ChatRealtimeClient: Sendable {
    public var connect: @MainActor @Sendable (_ roomID: Int) async throws -> AsyncStream<ChatRealtimeEvent>
    public var disconnect: @MainActor @Sendable () async -> Void
    public var sendText: @MainActor @Sendable (_ roomID: Int, _ clientMessageID: UUID, _ content: String) async throws -> Void

    public init(
        connect: @escaping @MainActor @Sendable (_ roomID: Int) async throws -> AsyncStream<ChatRealtimeEvent>,
        disconnect: @escaping @MainActor @Sendable () async -> Void,
        sendText: @escaping @MainActor @Sendable (_ roomID: Int, _ clientMessageID: UUID, _ content: String) async throws -> Void
    ) {
        self.connect = connect
        self.disconnect = disconnect
        self.sendText = sendText
    }
}

extension ChatRealtimeClient: TestDependencyKey {
    public static let testValue = ChatRealtimeClient(
        connect: { _ in AsyncStream { $0.finish() } },
        disconnect: {},
        sendText: { _, _, _ in }
    )
}

extension DependencyValues {
    public var chatRealtimeClient: ChatRealtimeClient {
        get { self[ChatRealtimeClient.self] }
        set { self[ChatRealtimeClient.self] = newValue }
    }
}
