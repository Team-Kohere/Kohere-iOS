//
//  KRWToUSDExchangeRate.swift
//  Kohere
//
//  Created by Codex on 7/6/26.
//

import Foundation

public struct KRWToUSDExchangeRate: Equatable, Sendable {
    public let usdPerKRW: Decimal

    public init(
        usdPerKRW: Decimal
    ) {
        self.usdPerKRW = usdPerKRW
    }
}

public enum CurrencyError: Error, Equatable, Sendable {
    case exchangeRateUnavailable
}

extension CurrencyError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .exchangeRateUnavailable:
            "환율 정보를 가져올 수 없습니다."
        }
    }
}
