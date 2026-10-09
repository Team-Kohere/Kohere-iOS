//
//  ReissueTokenUseCase.swift
//  Kohere
//
//  Created by soomin on 6/30/26.
//

import ComposableArchitecture

public struct ReissueTokenUseCase {
    public var execute: (_ refreshToken: String) async throws -> AuthToken

    public init(execute: @escaping (_ refreshToken: String) async throws -> AuthToken) {
        self.execute = execute
    }
}

extension ReissueTokenUseCase: DependencyKey {
    public static let liveValue: ReissueTokenUseCase = {
        @Dependency(\.authClient)
        var authClient
        
        return ReissueTokenUseCase { refreshToken in
            try await authClient.reissue(refreshToken)
        }
    }()
}

public extension DependencyValues {
    var reissueTokenUseCase: ReissueTokenUseCase {
        get { self[ReissueTokenUseCase.self] }
        set { self[ReissueTokenUseCase.self] = newValue }
    }
}
