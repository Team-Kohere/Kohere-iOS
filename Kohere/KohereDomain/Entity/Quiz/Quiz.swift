//
//  Quiz.swift
//  Kohere
//
//  Created by soomin on 6/25/26.
//

public struct Quiz: Equatable, Identifiable, Sendable {
    public let id: Int
    public let question: String
    public let choices: [QuizChoice]
    public let correctChoiceKey: String?
    public let explanation: String?

    public init(
        id: Int,
        question: String,
        choices: [QuizChoice],
        correctChoiceKey: String?,
        explanation: String?
    ) {
        self.id = id
        self.question = question
        self.choices = choices
        self.correctChoiceKey = correctChoiceKey
        self.explanation = explanation
    }
}

public struct QuizChoice: Equatable, Identifiable, Sendable {
    public nonisolated var id: String { key }

    public let key: String
    public let text: String

    public init(
        key: String,
        text: String
    ) {
        self.key = key
        self.text = text
    }
}

public struct QuizAnswerResult: Equatable, Sendable {
    public let quizID: Int
    public let selectedChoiceKey: String
    public let isCorrect: Bool
    public let correctChoiceKey: String
    public let explanation: String

    public init(
        quizID: Int,
        selectedChoiceKey: String,
        isCorrect: Bool,
        correctChoiceKey: String,
        explanation: String
    ) {
        self.quizID = quizID
        self.selectedChoiceKey = selectedChoiceKey
        self.isCorrect = isCorrect
        self.correctChoiceKey = correctChoiceKey
        self.explanation = explanation
    }
}

extension Quiz {
    public static let mockQuiz = Quiz(
        id: 1,
        question: "고시원 계약 시 ‘관리비’에 포함되지 않는 것은?",
        choices: [
            QuizChoice(key: "A", text: "인터넷 & Wi-Fi"),
            QuizChoice(key: "B", text: "개인 전기요금"),
            QuizChoice(key: "C", text: "공용 청소"),
            QuizChoice(key: "D", text: "수도요금")
        ],
        correctChoiceKey: "B",
        explanation: "전기요금은 보통 방별로 얼마나 썼는지를 기반으로 개별적으로 청구돼요."
    )
}
