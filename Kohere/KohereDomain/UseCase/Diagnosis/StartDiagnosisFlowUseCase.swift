//
//  StartDiagnosisFlowUseCase.swift
//  Kohere
//
//  Created by soomin on 7/18/26.
//

import ComposableArchitecture

public struct StartDiagnosisFlowUseCase {
    public var execute: @Sendable () async throws -> DiagnosisFlowResult

    public init(execute: @escaping @Sendable () async throws -> DiagnosisFlowResult) {
        self.execute = execute
    }
}

extension StartDiagnosisFlowUseCase: DependencyKey {
    public static let liveValue: StartDiagnosisFlowUseCase = {
        @Dependency(\.diagnosisClient)
        var diagnosisClient

        return StartDiagnosisFlowUseCase {
            try await diagnosisClient.startFlow()
        }
    }()
}

public extension DependencyValues {
    var startDiagnosisFlowUseCase: StartDiagnosisFlowUseCase {
        get { self[StartDiagnosisFlowUseCase.self] }
        set { self[StartDiagnosisFlowUseCase.self] = newValue }
    }
}
