//
//  DiagnosisClient.swift
//  Kohere
//
//  Created by Codex on 7/4/26.
//

import Dependencies

public struct DiagnosisClient: Sendable {
    public var startFlow: @Sendable () async throws -> DiagnosisFlowResult
    public var advanceFlow: @Sendable (_ answer: DiagnosisAnswer) async throws -> DiagnosisFlowResult
    public var fetchDetail: @Sendable (_ diagnosisID: Int) async throws -> DiagnosisDetail
    public var fetchRecommendations: @MainActor @Sendable (_ input: DiagnosisRecommendationsInput) async throws -> DiagnosisRecommendations
    public var fetchRecommendationMap: @MainActor @Sendable (_ diagnosisID: Int) async throws -> DiagnosisRecommendationMap

    public init(
        startFlow: @escaping @Sendable () async throws -> DiagnosisFlowResult,
        advanceFlow: @escaping @Sendable (_ answer: DiagnosisAnswer) async throws -> DiagnosisFlowResult,
        fetchDetail: @escaping @Sendable (_ diagnosisID: Int) async throws -> DiagnosisDetail,
        fetchRecommendations: @escaping @MainActor @Sendable (_ input: DiagnosisRecommendationsInput) async throws -> DiagnosisRecommendations,
        fetchRecommendationMap: @escaping @MainActor @Sendable (_ diagnosisID: Int) async throws -> DiagnosisRecommendationMap
    ) {
        self.startFlow = startFlow
        self.advanceFlow = advanceFlow
        self.fetchDetail = fetchDetail
        self.fetchRecommendations = fetchRecommendations
        self.fetchRecommendationMap = fetchRecommendationMap
    }
}

extension DiagnosisClient: TestDependencyKey {
    public static let testValue = DiagnosisClient(
        startFlow: { throw CancellationError() },
        advanceFlow: { _ in throw CancellationError() },
        fetchDetail: { _ in throw CancellationError() },
        fetchRecommendations: { _ in throw CancellationError() },
        fetchRecommendationMap: { _ in throw CancellationError() }
    )
}

extension DependencyValues {
    public var diagnosisClient: DiagnosisClient {
        get { self[DiagnosisClient.self] }
        set { self[DiagnosisClient.self] = newValue }
    }
}
