//
//  VerifyPhoneUseCase.swift
//  Kohere
//
//  Created by soomin on 7/3/26.
//

import ComposableArchitecture

public struct VerifyPhoneUseCase {
    public var execute: (_ phoneNumber: String, _ code: String) async throws -> PhoneVerification

    public init(execute: @escaping (_ phoneNumber: String, _ code: String) async throws -> PhoneVerification) {
        self.execute = execute
    }
}

extension VerifyPhoneUseCase: DependencyKey {
    public static let liveValue: VerifyPhoneUseCase = {
        @Dependency(\.authClient)
        var authClient

        return VerifyPhoneUseCase { phoneNumber, code in
            try await authClient.verifyPhone(phoneNumber, code)
        }
    }()
}

public extension DependencyValues {
    var verifyPhoneUseCase: VerifyPhoneUseCase {
        get { self[VerifyPhoneUseCase.self] }
        set { self[VerifyPhoneUseCase.self] = newValue }
    }
}
