//
//  Diagnosis.swift
//  Kohere
//
//  Created by soomin on 6/26/26.
//

public enum SelectType: Equatable, Sendable {
    case single
    case multi
    case slider
}

public struct Diagnosis: Equatable, Sendable {
    public let step: Int
    public let field: String
    public let question: String
    public let selectType: SelectType
    public let maxSelectCount: Int
    public let options: [DiagnosisOption]

    public init(
        step: Int,
        field: String,
        question: String,
        selectType: SelectType,
        maxSelectCount: Int,
        options: [DiagnosisOption]
    ) {
        self.step = step
        self.field = field
        self.question = question
        self.selectType = selectType
        self.maxSelectCount = maxSelectCount
        self.options = options
    }
}

public struct DiagnosisOption: Equatable, Sendable {
    public let id: String
    public let title: String

    public init(
        id: String,
        title: String
    ) {
        self.id = id
        self.title = title
    }
}

public enum DiagnosisFlowResult: Equatable, Sendable {
    case nextQuestion(Diagnosis)
    case restart
    case terminated
    case completed(diagnosisID: Int)
}
