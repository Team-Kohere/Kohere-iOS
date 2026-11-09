//
//  LivingGuideClient.swift
//  Kohere
//
//  Created by soomin on 7/8/26.
//

import Dependencies

// MARK: - Client

public struct LivingGuideClient: Sendable {
    public var fetchTopics: @Sendable () async throws -> [LivingGuide]
    public var fetchTips: @Sendable (_ topicCode: String) async throws -> [LivingGuideTip]

    public init(
        fetchTopics: @escaping @Sendable () async throws -> [LivingGuide],
        fetchTips: @escaping @Sendable (_ topicCode: String) async throws -> [LivingGuideTip]
    ) {
        self.fetchTopics = fetchTopics
        self.fetchTips = fetchTips
    }
}

// MARK: - Dependency

extension LivingGuideClient: TestDependencyKey {
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
