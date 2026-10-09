//
//  FetchKRWToUSDExchangeRateUseCase.swift
//  Kohere
//
//  Created by Codex on 7/6/26.
//

import ComposableArchitecture

public struct FetchKRWToUSDExchangeRateUseCase {
    public var execute: @Sendable () async throws -> KRWToUSDExchangeRate

    public init(execute: @escaping @Sendable () async throws -> KRWToUSDExchangeRate) {
        self.execute = execute
    }
}

extension FetchKRWToUSDExchangeRateUseCase: DependencyKey {
    public static let liveValue: FetchKRWToUSDExchangeRateUseCase = {
        @Dependency(\.currencyClient)
        var currencyClient

        return FetchKRWToUSDExchangeRateUseCase {
            try await currencyClient.fetchKRWToUSDExchangeRate()
        }
    }()
}

public extension DependencyValues {
    var fetchKRWToUSDExchangeRateUseCase: FetchKRWToUSDExchangeRateUseCase {
        get { self[FetchKRWToUSDExchangeRateUseCase.self] }
        set { self[FetchKRWToUSDExchangeRateUseCase.self] = newValue }
    }
}
