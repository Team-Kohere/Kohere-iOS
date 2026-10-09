//
//  FetchLivingGuideTopicsUseCase.swift
//  Kohere
//
//  Created by soomin on 9/22/26.
//

import ComposableArchitecture

public struct FetchLivingGuideTopicsUseCase: Sendable {
    public var execute: @Sendable () async throws -> [LivingGuide]

    public init(execute: @escaping @Sendable () async throws -> [LivingGuide]) {
        self.execute = execute
    }
}

extension FetchLivingGuideTopicsUseCase: DependencyKey {
    public static let liveValue: FetchLivingGuideTopicsUseCase = {
        @Dependency(\.livingGuideClient)
        var livingGuideClient

        return FetchLivingGuideTopicsUseCase {
            try await livingGuideClient.fetchTopics()
        }
    }()
}

public extension DependencyValues {
    var fetchLivingGuideTopicsUseCase: FetchLivingGuideTopicsUseCase {
        get { self[FetchLivingGuideTopicsUseCase.self] }
        set { self[FetchLivingGuideTopicsUseCase.self] = newValue }
    }
}
