//
//  CompleteOnboardingUseCase.swift
//  Kohere
//
//  Created by soomin on 7/3/26.
//

import ComposableArchitecture

public struct CompleteOnboardingUseCase {
    public var execute: (_ profile: AuthOnboardingProfile) async throws -> Auth

    public init(execute: @escaping (_ profile: AuthOnboardingProfile) async throws -> Auth) {
        self.execute = execute
    }
}

extension CompleteOnboardingUseCase: DependencyKey {
    public static let liveValue: CompleteOnboardingUseCase = {
        @Dependency(\.authClient)
        var authClient

        return CompleteOnboardingUseCase { profile in
            try await authClient.completeOnboarding(profile)
        }
    }()
}

public extension DependencyValues {
    var completeOnboardingUseCase: CompleteOnboardingUseCase {
        get { self[CompleteOnboardingUseCase.self] }
        set { self[CompleteOnboardingUseCase.self] = newValue }
    }
}
