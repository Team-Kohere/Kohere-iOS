//
//  CurrencyClient.swift
//  Kohere
//
//  Created by Codex on 7/6/26.
//

import Dependencies

public struct CurrencyClient: Sendable {
    public var fetchKRWToUSDExchangeRate: @Sendable () async throws -> KRWToUSDExchangeRate

    public init(
        fetchKRWToUSDExchangeRate: @escaping @Sendable () async throws -> KRWToUSDExchangeRate
    ) {
        self.fetchKRWToUSDExchangeRate = fetchKRWToUSDExchangeRate
    }
}

extension CurrencyClient: TestDependencyKey {
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
