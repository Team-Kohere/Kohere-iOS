//
//  ActiveChatRoomStore.swift
//  Kohere
//
//  Created by soomin on 10/28/26.
//

import os

public nonisolated final class ActiveChatRoomStore: @unchecked Sendable {
    public static let shared = ActiveChatRoomStore()

    private let roomID = OSAllocatedUnfairLock<Int?>(initialState: nil)

    private init() {}

    public var activeRoomID: Int? {
        roomID.withLock { $0 }
    }

    func activate(_ roomID: Int) {
        self.roomID.withLock { $0 = roomID }
    }

    func deactivate(_ roomID: Int) {
        self.roomID.withLock {
            guard $0 == roomID else { return }
            $0 = nil
        }
    }
}
