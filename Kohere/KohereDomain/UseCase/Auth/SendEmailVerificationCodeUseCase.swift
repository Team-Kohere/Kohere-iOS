//
//  SendEmailVerificationCodeUseCase.swift
//  Kohere
//
//  Created by soomin on 7/3/26.
//

import ComposableArchitecture

public struct SendEmailVerificationCodeUseCase {
    public var execute: (_ email: String) async throws -> EmailVerificationCode

    public init(execute: @escaping (_ email: String) async throws -> EmailVerificationCode) {
        self.execute = execute
    }
}

extension SendEmailVerificationCodeUseCase: DependencyKey {
    public static let liveValue: SendEmailVerificationCodeUseCase = {
        @Dependency(\.authClient)
        var authClient

        return SendEmailVerificationCodeUseCase { email in
            try await authClient.sendEmailVerificationCode(email)
        }
    }()
}

public extension DependencyValues {
    var sendEmailVerificationCodeUseCase: SendEmailVerificationCodeUseCase {
        get { self[SendEmailVerificationCodeUseCase.self] }
        set { self[SendEmailVerificationCodeUseCase.self] = newValue }
    }
}
