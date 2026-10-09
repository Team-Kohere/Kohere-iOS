//
//  DeleteCurrentUserUseCase.swift
//  Kohere
//
//  Created by Codex on 7/8/26.
//

import ComposableArchitecture

public struct DeleteCurrentUserUseCase {
    public var execute: () async throws -> Void

    public init(execute: @escaping () async throws -> Void) {
        self.execute = execute
    }
}

extension DeleteCurrentUserUseCase: DependencyKey {
    public static let liveValue: DeleteCurrentUserUseCase = {
        @Dependency(\.userClient)
        var userClient

        return DeleteCurrentUserUseCase {
            try await userClient.deleteCurrentUser()
        }
    }()
}

public extension DependencyValues {
    var deleteCurrentUserUseCase: DeleteCurrentUserUseCase {
        get { self[DeleteCurrentUserUseCase.self] }
        set { self[DeleteCurrentUserUseCase.self] = newValue }
    }
}
