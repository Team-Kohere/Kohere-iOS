//
//  QuizClient.swift
//  Kohere
//
//  Created by soomin on 7/7/26.
//

import Dependencies

// MARK: - Client

public struct QuizClient: Sendable {
    public var fetchRandomQuiz: @Sendable () async throws -> Quiz
    public var submitAnswer: @Sendable (_ quizID: Int, _ selectedChoiceKey: String) async throws -> QuizAnswerResult

    public init(
        fetchRandomQuiz: @escaping @Sendable () async throws -> Quiz,
        submitAnswer: @escaping @Sendable (_ quizID: Int, _ selectedChoiceKey: String) async throws -> QuizAnswerResult
    ) {
        self.fetchRandomQuiz = fetchRandomQuiz
        self.submitAnswer = submitAnswer
    }
}

// MARK: - Dependency

extension QuizClient: TestDependencyKey {
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
