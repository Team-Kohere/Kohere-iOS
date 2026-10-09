//
//  FetchLivingGuideTipsUseCase.swift
//  Kohere
//
//  Created by soomin on 9/22/26.
//

import ComposableArchitecture

public struct FetchLivingGuideTipsUseCase: Sendable {
    public var execute: @Sendable (_ topicCode: String) async throws -> [LivingGuideTip]

    public init(execute: @escaping @Sendable (_ topicCode: String) async throws -> [LivingGuideTip]) {
        self.execute = execute
    }
}

extension FetchLivingGuideTipsUseCase: DependencyKey {
    public static let liveValue: FetchLivingGuideTipsUseCase = {
        @Dependency(\.livingGuideClient)
        var livingGuideClient

        return FetchLivingGuideTipsUseCase { topicCode in
            try await livingGuideClient.fetchTips(topicCode)
        }
    }()
}

public extension DependencyValues {
    var fetchLivingGuideTipsUseCase: FetchLivingGuideTipsUseCase {
        get { self[FetchLivingGuideTipsUseCase.self] }
        set { self[FetchLivingGuideTipsUseCase.self] = newValue }
    }
}
