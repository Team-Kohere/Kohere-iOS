//
//  QuizInterface.swift
//  Kohere
//
//  Created by soomin on 7/7/26.
//

import ComposableArchitecture

// MARK: - Interface

public protocol QuizInterface {
    func fetchRandomQuiz() async throws -> Quiz
    func submitAnswer(quizID: Int, selectedChoiceKey: String) async throws -> QuizAnswerResult
}

// MARK: - Client

public struct QuizClient: Sendable {
    public var fetchRandomQuiz: @Sendable () async throws -> Quiz
    public var submitAnswer: @Sendable (_ quizID: Int, _ selectedChoiceKey: String) async throws -> QuizAnswerResult
}

extension QuizClient {
    public init(repository: any QuizInterface) {
        self.init(
            fetchRandomQuiz: {
                try await repository.fetchRandomQuiz()
            },
            submitAnswer: { quizID, selectedChoiceKey in
                try await repository.submitAnswer(quizID: quizID, selectedChoiceKey: selectedChoiceKey)
            }
        )
    }
}

// MARK: - Dependency

extension QuizClient: DependencyKey {
    public static let liveValue = QuizClient(
        fetchRandomQuiz: { throw CancellationError() },
        submitAnswer: { _, _ in throw CancellationError() }
    )

    public static let testValue = QuizClient(
        fetchRandomQuiz: { throw CancellationError() },
        submitAnswer: { _, _ in throw CancellationError() }
    )
}

extension DependencyValues {
    public var quizClient: QuizClient {
        get { self[QuizClient.self] }
        set { self[QuizClient.self] = newValue }
    }
}
