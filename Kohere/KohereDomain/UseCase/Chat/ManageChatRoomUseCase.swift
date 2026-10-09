import ComposableArchitecture

public struct HideChatRoomUseCase {
    public var execute: (_ roomID: Int) async throws -> Void

    public init(execute: @escaping (_ roomID: Int) async throws -> Void) {
        self.execute = execute
    }
}

extension HideChatRoomUseCase: DependencyKey {
    public static let liveValue: HideChatRoomUseCase = {
        @Dependency(\.chatClient)
        var chatClient
        return HideChatRoomUseCase { try await chatClient.hideRoom($0) }
    }()
}

public struct BlockChatRoomUseCase {
    public var execute: (_ roomID: Int) async throws -> Void

    public init(execute: @escaping (_ roomID: Int) async throws -> Void) {
        self.execute = execute
    }
}

extension BlockChatRoomUseCase: DependencyKey {
    public static let liveValue: BlockChatRoomUseCase = {
        @Dependency(\.chatClient)
        var chatClient
        return BlockChatRoomUseCase { try await chatClient.blockRoom($0) }
    }()
}

public struct ReportChatRoomUseCase {
    public var execute: (_ roomID: Int, _ reason: ChatReportReason) async throws -> ChatReport

    public init(execute: @escaping (_ roomID: Int, _ reason: ChatReportReason) async throws -> ChatReport) {
        self.execute = execute
    }
}

extension ReportChatRoomUseCase: DependencyKey {
    public static let liveValue: ReportChatRoomUseCase = {
        @Dependency(\.chatClient)
        var chatClient
        return ReportChatRoomUseCase { try await chatClient.reportRoom($0, $1) }
    }()
}

public extension DependencyValues {
    var hideChatRoomUseCase: HideChatRoomUseCase {
        get { self[HideChatRoomUseCase.self] }
        set { self[HideChatRoomUseCase.self] = newValue }
    }

    var blockChatRoomUseCase: BlockChatRoomUseCase {
        get { self[BlockChatRoomUseCase.self] }
        set { self[BlockChatRoomUseCase.self] = newValue }
    }

    var reportChatRoomUseCase: ReportChatRoomUseCase {
        get { self[ReportChatRoomUseCase.self] }
        set { self[ReportChatRoomUseCase.self] = newValue }
    }
}
