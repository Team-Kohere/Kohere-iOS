//
//  AdvanceDiagnosisFlowUseCase.swift
//  Kohere
//
//  Created by soomin on 7/18/26.
//

import ComposableArchitecture

public struct AdvanceDiagnosisFlowUseCase {
    public var execute: @Sendable (DiagnosisAnswer) async throws -> DiagnosisFlowResult

    public init(execute: @escaping @Sendable (DiagnosisAnswer) async throws -> DiagnosisFlowResult) {
        self.execute = execute
    }
}

extension AdvanceDiagnosisFlowUseCase: DependencyKey {
    public static let liveValue: AdvanceDiagnosisFlowUseCase = {
        @Dependency(\.diagnosisClient)
        var diagnosisClient

        return AdvanceDiagnosisFlowUseCase { answer in
            try await diagnosisClient.advanceFlow(answer)
        }
    }()
}

public extension DependencyValues {
    var advanceDiagnosisFlowUseCase: AdvanceDiagnosisFlowUseCase {
        get { self[AdvanceDiagnosisFlowUseCase.self] }
        set { self[AdvanceDiagnosisFlowUseCase.self] = newValue }
    }
}
