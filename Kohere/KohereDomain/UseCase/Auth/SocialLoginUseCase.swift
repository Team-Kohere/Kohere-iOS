//
//  SocialLoginUseCase.swift
//  Kohere
//
//  Created by soomin on 6/30/26.
//

import ComposableArchitecture

public struct SocialLoginUseCase {
    public var execute: (_ credential: SocialLoginCredential) async throws -> Auth

    public init(execute: @escaping (_ credential: SocialLoginCredential) async throws -> Auth) {
        self.execute = execute
    }
}

extension SocialLoginUseCase: DependencyKey {
    public static let liveValue: SocialLoginUseCase = {
        @Dependency(\.authClient)
        var authClient
        
        return SocialLoginUseCase { credential in
            try await authClient.socialLogin(credential)
        }
    }()
}

public extension DependencyValues {
    var socialLoginUseCase: SocialLoginUseCase {
        get { self[SocialLoginUseCase.self] }
        set { self[SocialLoginUseCase.self] = newValue }
    }
}
