//
//  ChatRealtime.swift
//  Kohere
//
//  Created by soomin on 8/28/26.
//

import Foundation

public nonisolated struct ChatStompGuide: Equatable, Sendable {
    public let developmentWebSocketURL: URL
    public let localWebSocketURL: URL
    public let webSocketEndpoint: String
    public let connectHeaderName: String
    public let connectHeaderValueFormat: String
    public let controlQueue: String
    public let ackQueue: String
    public let errorQueue: String
    public let roomEventQueue: String
    public let translationQueue: String
    public let controlSendDestination: String
    public let roomSubscribeDestination: String
    public let messageSendDestination: String
    public let maxTextCodePoints: Int
    public let heartbeatSeconds: Int

    public init(
        developmentWebSocketURL: URL,
        localWebSocketURL: URL,
        webSocketEndpoint: String,
        connectHeaderName: String,
        connectHeaderValueFormat: String,
        controlQueue: String,
        ackQueue: String,
        errorQueue: String,
        roomEventQueue: String,
        translationQueue: String,
        controlSendDestination: String,
        roomSubscribeDestination: String,
        messageSendDestination: String,
        maxTextCodePoints: Int,
        heartbeatSeconds: Int
    ) {
        self.developmentWebSocketURL = developmentWebSocketURL
        self.localWebSocketURL = localWebSocketURL
        self.webSocketEndpoint = webSocketEndpoint
        self.connectHeaderName = connectHeaderName
        self.connectHeaderValueFormat = connectHeaderValueFormat
        self.controlQueue = controlQueue
        self.ackQueue = ackQueue
        self.errorQueue = errorQueue
        self.roomEventQueue = roomEventQueue
        self.translationQueue = translationQueue
        self.controlSendDestination = controlSendDestination
        self.roomSubscribeDestination = roomSubscribeDestination
        self.messageSendDestination = messageSendDestination
        self.maxTextCodePoints = maxTextCodePoints
        self.heartbeatSeconds = heartbeatSeconds
    }
}

public nonisolated enum ChatRealtimeConnectionState: Equatable, Sendable {
    case connecting
    case ready
    case disconnected
}

public nonisolated struct ChatTextAcknowledgement: Equatable, Sendable {
    public let clientMessageID: UUID
    public let messageID: Int
    public let sentAt: Date
    public let duplicate: Bool

    public init(
        clientMessageID: UUID,
        messageID: Int,
        sentAt: Date,
        duplicate: Bool
    ) {
        self.clientMessageID = clientMessageID
        self.messageID = messageID
        self.sentAt = sentAt
        self.duplicate = duplicate
    }
}

public nonisolated struct ChatTextFailure: Equatable, Sendable {
    public let clientMessageID: UUID?
    public let code: String
    public let message: String

    public init(
        clientMessageID: UUID?,
        code: String,
        message: String
    ) {
        self.clientMessageID = clientMessageID
        self.code = code
        self.message = message
    }
}

public nonisolated struct ChatTranslatedMessage: Equatable, Sendable {
    public let messageID: Int
    public let clientMessageID: UUID?
    public let roomID: Int
    public let senderID: Int
    public let originalContent: String
    public let translatedContent: String?
    public let sentAt: Date

    public init(
        messageID: Int,
        clientMessageID: UUID?,
        roomID: Int,
        senderID: Int,
        originalContent: String,
        translatedContent: String?,
        sentAt: Date
    ) {
        self.messageID = messageID
        self.clientMessageID = clientMessageID
        self.roomID = roomID
        self.senderID = senderID
        self.originalContent = originalContent
        self.translatedContent = translatedContent
        self.sentAt = sentAt
    }
}

public nonisolated struct ChatRoomSubscription: Equatable, Sendable {
    public let roomID: Int
    public let highWatermark: Int?

    public init(
        roomID: Int,
        highWatermark: Int?
    ) {
        self.roomID = roomID
        self.highWatermark = highWatermark
    }
}

public nonisolated enum ChatRealtimeEvent: Equatable, Sendable {
    case connection(ChatRealtimeConnectionState)
    case subscriptionReady(ChatRoomSubscription)
    case acknowledgement(ChatTextAcknowledgement)
    case sendFailure(ChatTextFailure)
    case translatedMessage(ChatTranslatedMessage)
    case roomMessage(StoredChatMessage)
    case roomListChanged
}
