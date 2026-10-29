//
//  ForegroundNotificationPolicy.swift
//  Kohere
//
//  Created by soomin on 10/29/26.
//

import Foundation

nonisolated enum ForegroundNotificationPolicy {static func shouldPresent(userInfo: [AnyHashable: Any], activeChatRoomID: Int?) -> Bool {
        guard let chatRoomID = chatRoomID(from: userInfo) else { return true }
        return chatRoomID != activeChatRoomID
    }

    private static func chatRoomID(from userInfo: [AnyHashable: Any]) -> Int? {
        if let chatRoomID = userInfo["chatRoomId"] as? Int {
            return chatRoomID
        }

        if let chatRoomID = userInfo["chatRoomId"] as? String {
            return Int(chatRoomID)
        }

        return nil
    }
}
