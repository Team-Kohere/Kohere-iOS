//
//  UpdateProfileUseCase.swift
//  Kohere
//
//  Created by Codex on 7/8/26.
//

import ComposableArchitecture

public struct UpdateProfileUseCase {
    public var execute: (_ update: UserProfileUpdate) async throws -> UserProfile

    public init(execute: @escaping (_ update: UserProfileUpdate) async throws -> UserProfile) {
        self.execute = execute
    }
}

extension UpdateProfileUseCase: DependencyKey {
    public static let liveValue: UpdateProfileUseCase = {
        @Dependency(\.userClient)
        var userClient

        return UpdateProfileUseCase { update in
            try await userClient.updateProfile(update)
        }
    }()
}

public extension DependencyValues {
    var updateProfileUseCase: UpdateProfileUseCase {
        get { self[UpdateProfileUseCase.self] }
        set { self[UpdateProfileUseCase.self] = newValue }
    }
}
