//
//  DiagnosisInterface.swift
//  Kohere
//
//  Created by Codex on 7/4/26.
//

import ComposableArchitecture

public protocol DiagnosisInterface {
    func startFlow() async throws -> DiagnosisFlowResult
    func advanceFlow(with answer: DiagnosisAnswer) async throws -> DiagnosisFlowResult
    func fetchDetail(diagnosisID: Int) async throws -> DiagnosisDetail
    func fetchRecommendations(input: DiagnosisRecommendationsInput) async throws -> DiagnosisRecommendations
    func fetchRecommendationMap(diagnosisID: Int) async throws -> DiagnosisRecommendationMap
}

public struct DiagnosisClient: Sendable {
    public var startFlow: @Sendable () async throws -> DiagnosisFlowResult
    public var advanceFlow: @Sendable (_ answer: DiagnosisAnswer) async throws -> DiagnosisFlowResult
    public var fetchDetail: @Sendable (_ diagnosisID: Int) async throws -> DiagnosisDetail
    public var fetchRecommendations: @MainActor @Sendable (_ input: DiagnosisRecommendationsInput) async throws -> DiagnosisRecommendations
    public var fetchRecommendationMap: @MainActor @Sendable (_ diagnosisID: Int) async throws -> DiagnosisRecommendationMap
}

extension DiagnosisClient {
    public init(repository: any DiagnosisInterface) {
        self.init(
            startFlow: {
                try await repository.startFlow()
            },
            advanceFlow: { answer in
                try await repository.advanceFlow(with: answer)
            },
            fetchDetail: { diagnosisID in
                try await repository.fetchDetail(diagnosisID: diagnosisID)
            },
            fetchRecommendations: { input in
                try await repository.fetchRecommendations(input: input)
            },
            fetchRecommendationMap: { diagnosisID in
                try await repository.fetchRecommendationMap(diagnosisID: diagnosisID)
            }
        )
    }
}

extension DiagnosisClient: DependencyKey {
    public static let liveValue = DiagnosisClient(
        startFlow: { throw CancellationError() },
        advanceFlow: { _ in throw CancellationError() },
        fetchDetail: { _ in throw CancellationError() },
        fetchRecommendations: { _ in throw CancellationError() },
        fetchRecommendationMap: { _ in throw CancellationError() }
    )

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
