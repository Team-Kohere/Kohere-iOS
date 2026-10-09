//
//  FetchCurrentUserUseCase.swift
//  Kohere
//
//  Created by Codex on 7/8/26.
//

import ComposableArchitecture

public struct FetchCurrentUserUseCase {
    public var execute: () async throws -> UserProfile

    public init(execute: @escaping () async throws -> UserProfile) {
        self.execute = execute
    }
}

extension FetchCurrentUserUseCase: DependencyKey {
    public static let liveValue: FetchCurrentUserUseCase = {
        @Dependency(\.userClient)
        var userClient

        return FetchCurrentUserUseCase {
            try await userClient.fetchCurrentUser()
        }
    }()
}

public extension DependencyValues {
    var fetchCurrentUserUseCase: FetchCurrentUserUseCase {
        get { self[FetchCurrentUserUseCase.self] }
        set { self[FetchCurrentUserUseCase.self] = newValue }
    }
}
