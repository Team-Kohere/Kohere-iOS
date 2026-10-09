//
//  LivingGuideInterface.swift
//  Kohere
//
//  Created by soomin on 7/8/26.
//

import ComposableArchitecture

// MARK: - Interface

public protocol LivingGuideInterface {
    func fetchTopics() async throws -> [LivingGuide]
    func fetchTips(topicCode: String) async throws -> [LivingGuideTip]
}

// MARK: - Client

public struct LivingGuideClient: Sendable {
    public var fetchTopics: @Sendable () async throws -> [LivingGuide]
    public var fetchTips: @Sendable (_ topicCode: String) async throws -> [LivingGuideTip]
}

extension LivingGuideClient {
    public init(repository: any LivingGuideInterface) {
        self.init(
            fetchTopics: {
                try await repository.fetchTopics()
            },
            fetchTips: { topicCode in
                try await repository.fetchTips(topicCode: topicCode)
            }
        )
    }
}

// MARK: - Dependency

extension LivingGuideClient: DependencyKey {
    public static let liveValue = LivingGuideClient(
        fetchTopics: { throw CancellationError() },
        fetchTips: { _ in throw CancellationError() }
    )

    public static let testValue = LivingGuideClient(
        fetchTopics: { throw CancellationError() },
        fetchTips: { _ in throw CancellationError() }
    )
}

extension DependencyValues {
    public var livingGuideClient: LivingGuideClient {
        get { self[LivingGuideClient.self] }
        set { self[LivingGuideClient.self] = newValue }
    }
}
