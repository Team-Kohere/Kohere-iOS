//
//  AgreeTermsUseCase.swift
//  Kohere
//
//  Created by soomin on 7/3/26.
//

import ComposableArchitecture

public struct AgreeTermsUseCase {
    public var execute: (
        _ termsOfServiceAgreed: Bool,
        _ privacyPolicyAgreed: Bool,
        _ marketingAgreed: Bool
    ) async throws -> TermsAgreement

    public init(
        execute: @escaping (
            _ termsOfServiceAgreed: Bool,
            _ privacyPolicyAgreed: Bool,
            _ marketingAgreed: Bool
        ) async throws -> TermsAgreement
    ) {
        self.execute = execute
    }
}

extension AgreeTermsUseCase: DependencyKey {
    public static let liveValue: AgreeTermsUseCase = {
        @Dependency(\.authClient)
        var authClient

        return AgreeTermsUseCase { termsOfServiceAgreed, privacyPolicyAgreed, marketingAgreed in
            try await authClient.agreeTerms(
                termsOfServiceAgreed,
                privacyPolicyAgreed,
                marketingAgreed
            )
        }
    }()
}

public extension DependencyValues {
    var agreeTermsUseCase: AgreeTermsUseCase {
        get { self[AgreeTermsUseCase.self] }
        set { self[AgreeTermsUseCase.self] = newValue }
    }
}
