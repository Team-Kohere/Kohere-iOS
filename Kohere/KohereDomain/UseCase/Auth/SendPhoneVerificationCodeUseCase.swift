//
//  SendPhoneVerificationCodeUseCase.swift
//  Kohere
//
//  Created by soomin on 7/3/26.
//

import ComposableArchitecture

public struct SendPhoneVerificationCodeUseCase {
    public var execute: (_ phoneNumber: String) async throws -> PhoneVerificationCode

    public init(execute: @escaping (_ phoneNumber: String) async throws -> PhoneVerificationCode) {
        self.execute = execute
    }
}

extension SendPhoneVerificationCodeUseCase: DependencyKey {
    public static let liveValue: SendPhoneVerificationCodeUseCase = {
        @Dependency(\.authClient)
        var authClient

        return SendPhoneVerificationCodeUseCase { phoneNumber in
            try await authClient.sendPhoneVerificationCode(phoneNumber)
        }
    }()
}

public extension DependencyValues {
    var sendPhoneVerificationCodeUseCase: SendPhoneVerificationCodeUseCase {
        get { self[SendPhoneVerificationCodeUseCase.self] }
        set { self[SendPhoneVerificationCodeUseCase.self] = newValue }
    }
}
