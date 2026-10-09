//
//  UserInterface.swift
//  Kohere
//
//  Created by Codex on 7/8/26.
//

import ComposableArchitecture

public protocol UserInterface {
    func fetchCurrentUser() async throws -> UserProfile
    func fetchNotificationPreferences() async throws -> UserNotificationPreferences
    func updateNotificationPreferences(chatPushEnabled: Bool) async throws -> UserNotificationPreferences
    func updateProfile(_ update: UserProfileUpdate) async throws -> UserProfile
    func deleteCurrentUser() async throws
}

public struct UserClient: Sendable {
    public var fetchCurrentUser: @Sendable () async throws -> UserProfile
    public var fetchNotificationPreferences: @Sendable () async throws -> UserNotificationPreferences
    public var updateNotificationPreferences: @Sendable (_ chatPushEnabled: Bool) async throws -> UserNotificationPreferences
    public var updateProfile: @Sendable (_ update: UserProfileUpdate) async throws -> UserProfile
    public var deleteCurrentUser: @Sendable () async throws -> Void
}

extension UserClient {
    public init(repository: any UserInterface) {
        self.init(
            fetchCurrentUser: {
                try await repository.fetchCurrentUser()
            },
            fetchNotificationPreferences: {
                try await repository.fetchNotificationPreferences()
            },
            updateNotificationPreferences: { isEnabled in
                try await repository.updateNotificationPreferences(chatPushEnabled: isEnabled)
            },
            updateProfile: { update in
                try await repository.updateProfile(update)
            },
            deleteCurrentUser: {
                try await repository.deleteCurrentUser()
            }
        )
    }
}

extension UserClient: DependencyKey {
    public static let liveValue = UserClient(
        fetchCurrentUser: { throw CancellationError() },
        fetchNotificationPreferences: { throw CancellationError() },
        updateNotificationPreferences: { _ in throw CancellationError() },
        updateProfile: { _ in throw CancellationError() },
        deleteCurrentUser: { }
    )

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
