//
//  FetchRandomQuizUseCase.swift
//  Kohere
//
//  Created by soomin on 9/22/26.
//

import ComposableArchitecture

public struct FetchRandomQuizUseCase: Sendable {
    public var execute: @Sendable () async throws -> Quiz

    public init(execute: @escaping @Sendable () async throws -> Quiz) {
        self.execute = execute
    }
}

extension FetchRandomQuizUseCase: DependencyKey {
    public static let liveValue: FetchRandomQuizUseCase = {
        @Dependency(\.quizClient)
        var quizClient

        return FetchRandomQuizUseCase {
            try await quizClient.fetchRandomQuiz()
        }
    }()
}

public extension DependencyValues {
    var fetchRandomQuizUseCase: FetchRandomQuizUseCase {
        get { self[FetchRandomQuizUseCase.self] }
        set { self[FetchRandomQuizUseCase.self] = newValue }
    }
}
