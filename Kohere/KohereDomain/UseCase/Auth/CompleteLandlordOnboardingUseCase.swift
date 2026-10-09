//
//  CompleteLandlordOnboardingUseCase.swift
//  Kohere
//
//  Created by soomin on 7/3/26.
//

import ComposableArchitecture

public struct CompleteLandlordOnboardingUseCase {
    public var execute: (_ profile: LandlordOnboardingProfile) async throws -> Auth

    public init(execute: @escaping (_ profile: LandlordOnboardingProfile) async throws -> Auth) {
        self.execute = execute
    }
}

extension CompleteLandlordOnboardingUseCase: DependencyKey {
    public static let liveValue: CompleteLandlordOnboardingUseCase = {
        @Dependency(\.authClient)
        var authClient

        return CompleteLandlordOnboardingUseCase { profile in
            try await authClient.completeLandlordOnboarding(profile)
        }
    }()
}

public extension DependencyValues {
    var completeLandlordOnboardingUseCase: CompleteLandlordOnboardingUseCase {
        get { self[CompleteLandlordOnboardingUseCase.self] }
        set { self[CompleteLandlordOnboardingUseCase.self] = newValue }
    }
}
