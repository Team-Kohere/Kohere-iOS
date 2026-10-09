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
}

extension ChatRealtimeClient: DependencyKey {
    public static let liveValue = ChatRealtimeClient(
        connect: { _ in AsyncStream { $0.finish() } },
        disconnect: {},
        sendText: { _, _, _ in }
    )

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
