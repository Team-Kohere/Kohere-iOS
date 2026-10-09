//
//  SubmitQuizAnswerUseCase.swift
//  Kohere
//
//  Created by soomin on 9/22/26.
//

import ComposableArchitecture

public struct SubmitQuizAnswerUseCase: Sendable {
    public var execute: @Sendable (_ quizID: Int, _ selectedChoiceKey: String) async throws -> QuizAnswerResult

    public init(execute: @escaping @Sendable (_ quizID: Int, _ selectedChoiceKey: String) async throws -> QuizAnswerResult) {
        self.execute = execute
    }
}

extension SubmitQuizAnswerUseCase: DependencyKey {
    public static let liveValue: SubmitQuizAnswerUseCase = {
        @Dependency(\.quizClient)
        var quizClient

        return SubmitQuizAnswerUseCase { quizID, selectedChoiceKey in
            try await quizClient.submitAnswer(quizID, selectedChoiceKey)
        }
    }()
}

public extension DependencyValues {
    var submitQuizAnswerUseCase: SubmitQuizAnswerUseCase {
        get { self[SubmitQuizAnswerUseCase.self] }
        set { self[SubmitQuizAnswerUseCase.self] = newValue }
    }
}
