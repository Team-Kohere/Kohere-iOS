//
//  LogoutUseCase.swift
//  Kohere
//
//  Created by soomin on 6/30/26.
//

import ComposableArchitecture

public enum LogoutError: Error {
    case remoteRequestFailed
    case localAuthCleanupFailed
}

public struct LogoutUseCase {
    public var execute: () async throws -> Void

    public init(execute: @escaping () async throws -> Void) {
        self.execute = execute
    }
}

extension LogoutUseCase: DependencyKey {
    public static let liveValue: LogoutUseCase = {
        @Dependency(\.authClient)
        var authClient
        
        return LogoutUseCase {
            try await authClient.logout()
        }
    }()
}

public extension DependencyValues {
    var logoutUseCase: LogoutUseCase {
        get { self[LogoutUseCase.self] }
        set { self[LogoutUseCase.self] = newValue }
    }
}
