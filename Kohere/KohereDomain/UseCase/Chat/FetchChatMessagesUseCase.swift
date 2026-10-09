import ComposableArchitecture

public struct FetchChatMessagesUseCase {
    public var execute: (_ roomID: Int, _ cursor: String?, _ afterMessageID: Int?, _ size: Int) async throws -> ChatMessagePage

    public init(execute: @escaping (_ roomID: Int, _ cursor: String?, _ afterMessageID: Int?, _ size: Int) async throws -> ChatMessagePage) {
        self.execute = execute
    }
}

extension FetchChatMessagesUseCase: DependencyKey {
    public static let liveValue: FetchChatMessagesUseCase = {
        @Dependency(\.chatClient)
        var chatClient
        return FetchChatMessagesUseCase { roomID, cursor, afterMessageID, size in
            try await chatClient.fetchMessages(roomID, cursor, afterMessageID, size)
        }
    }()
}

public extension DependencyValues {
    var fetchChatMessagesUseCase: FetchChatMessagesUseCase {
        get { self[FetchChatMessagesUseCase.self] }
        set { self[FetchChatMessagesUseCase.self] = newValue }
    }
}
