//
//  VerifyEmailUseCase.swift
//  Kohere
//
//  Created by soomin on 7/3/26.
//

import ComposableArchitecture

public struct VerifyEmailUseCase {
    public var execute: (_ email: String, _ code: String) async throws -> EmailVerification

    public init(execute: @escaping (_ email: String, _ code: String) async throws -> EmailVerification) {
        self.execute = execute
    }
}

extension VerifyEmailUseCase: DependencyKey {
    public static let liveValue: VerifyEmailUseCase = {
        @Dependency(\.authClient)
        var authClient

        return VerifyEmailUseCase { email, code in
            try await authClient.verifyEmail(email, code)
        }
    }()
}

public extension DependencyValues {
    var verifyEmailUseCase: VerifyEmailUseCase {
        get { self[VerifyEmailUseCase.self] }
        set { self[VerifyEmailUseCase.self] = newValue }
    }
}
