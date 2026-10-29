//
//  AppDelegate.swift
//  Kohere
//
//  Created by 송규섭 on 9/4/26.
//

import FirebaseCore
import FirebaseMessaging
import KohereData
import OSLog
import UIKit
import UserNotifications

final class AppDelegate: NSObject, UIApplicationDelegate, UNUserNotificationCenterDelegate {
    private let logger = Logger(subsystem: "com.kohere.Kohere", category: "Push")

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil
    ) -> Bool {
        UNUserNotificationCenter.current().delegate = self
        FirebaseApp.configure()
        Messaging.messaging().delegate = FCMTokenRelay.shared
        return true
    }

    func userNotificationCenter(
        _ center: UNUserNotificationCenter,
        willPresent notification: UNNotification,
        withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void
    ) {
        let userInfo = notification.request.content.userInfo
        let activeChatRoomID = ActiveChatRoomStore.shared.activeRoomID

        guard ForegroundNotificationPolicy.shouldPresent(
            userInfo: userInfo,
            activeChatRoomID: activeChatRoomID
        ) else {
            logger.info("event=foreground_chat_notification_suppressed")
            completionHandler([])
            return
        }

        logger.info("event=foreground_notification_received")
        completionHandler([.banner, .sound, .badge])
    }

    /// APNs 기기 토큰 발급 성공 시 Firebase에 전달한다.
    /// FCM은 이 토큰을 받아야 FCM 등록 토큰을 발급·갱신할 수 있다.
    func application(
        _ application: UIApplication,
        didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data
    ) {
        logger.info("event=apns_token_received")
        Messaging.messaging().apnsToken = deviceToken
    }

    func application(
        _ application: UIApplication,
        didFailToRegisterForRemoteNotificationsWithError error: Error
    ) {
        logger.error("event=apns_register_failed error=\(error.localizedDescription, privacy: .public)")
    }
}
