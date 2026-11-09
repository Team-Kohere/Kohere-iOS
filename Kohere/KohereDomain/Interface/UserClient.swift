//
//  UserClient.swift
//  Kohere
//
//  Created by Codex on 7/8/26.
//

import Dependencies

public struct UserClient: Sendable {
    public var fetchCurrentUser: @Sendable () async throws -> UserProfile
    public var fetchNotificationPreferences: @Sendable () async throws -> UserNotificationPreferences
    public var updateNotificationPreferences: @Sendable (_ chatPushEnabled: Bool) async throws -> UserNotificationPreferences
    public var updateProfile: @Sendable (_ update: UserProfileUpdate) async throws -> UserProfile
    public var deleteCurrentUser: @Sendable () async throws -> Void

    public init(
        fetchCurrentUser: @escaping @Sendable () async throws -> UserProfile,
        fetchNotificationPreferences: @escaping @Sendable () async throws -> UserNotificationPreferences,
        updateNotificationPreferences: @escaping @Sendable (_ chatPushEnabled: Bool) async throws -> UserNotificationPreferences,
        updateProfile: @escaping @Sendable (_ update: UserProfileUpdate) async throws -> UserProfile,
        deleteCurrentUser: @escaping @Sendable () async throws -> Void
    ) {
        self.fetchCurrentUser = fetchCurrentUser
        self.fetchNotificationPreferences = fetchNotificationPreferences
        self.updateNotificationPreferences = updateNotificationPreferences
        self.updateProfile = updateProfile
        self.deleteCurrentUser = deleteCurrentUser
    }
}

extension UserClient: TestDependencyKey {
    public static let testValue = UserClient(
        fetchCurrentUser: { throw CancellationError() },
        fetchNotificationPreferences: { throw CancellationError() },
        updateNotificationPreferences: { _ in throw CancellationError() },
        updateProfile: { _ in throw CancellationError() },
        deleteCurrentUser: { }
    )
}

extension DependencyValues {
    public var userClient: UserClient {
        get { self[UserClient.self] }
        set { self[UserClient.self] = newValue }
    }
}
