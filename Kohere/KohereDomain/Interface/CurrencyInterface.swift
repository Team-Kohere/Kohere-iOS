//
//  CurrencyInterface.swift
//  Kohere
//
//  Created by Codex on 7/6/26.
//

import ComposableArchitecture

public protocol CurrencyInterface: Sendable {
    func fetchKRWToUSDExchangeRate() async throws -> KRWToUSDExchangeRate
}

public struct CurrencyClient: Sendable {
    public var fetchKRWToUSDExchangeRate: @Sendable () async throws -> KRWToUSDExchangeRate
}

extension CurrencyClient {
    public init(repository: any CurrencyInterface) {
        self.init(
            fetchKRWToUSDExchangeRate: {
                try await repository.fetchKRWToUSDExchangeRate()
            }
        )
    }
}

extension CurrencyClient: DependencyKey {
    public static let liveValue = CurrencyClient(
        fetchKRWToUSDExchangeRate: { throw CancellationError() }
    )

    public static let testValue = CurrencyClient(
        fetchKRWToUSDExchangeRate: { throw CancellationError() }
    )
}

extension DependencyValues {
    public var currencyClient: CurrencyClient {
        get { self[CurrencyClient.self] }
        set { self[CurrencyClient.self] = newValue }
    }
}
