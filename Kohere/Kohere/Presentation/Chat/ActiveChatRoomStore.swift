//
//  ActiveChatRoomStore.swift
//  Kohere
//
//  Created by soomin on 10/28/26.
//

import os

nonisolated final class ActiveChatRoomStore: @unchecked Sendable {
    static let shared = ActiveChatRoomStore()

    private let roomID = OSAllocatedUnfairLock<Int?>(initialState: nil)

    private init() {}

    var activeRoomID: Int? {
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
