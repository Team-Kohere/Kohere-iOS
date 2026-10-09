//
//  ConvertMonthlyRentCurrencyUseCase.swift
//  Kohere
//
//  Created by Codex on 7/6/26.
//

import ComposableArchitecture
import Foundation

public struct ConvertMonthlyRentCurrencyUseCase: Sendable {
    public var execute: @Sendable (_ monthlyRent: Int, _ exchangeRate: KRWToUSDExchangeRate) -> Decimal

    public init(execute: @escaping @Sendable (_ monthlyRent: Int, _ exchangeRate: KRWToUSDExchangeRate) -> Decimal) {
        self.execute = execute
    }
}

extension ConvertMonthlyRentCurrencyUseCase: DependencyKey {
    public static let liveValue = ConvertMonthlyRentCurrencyUseCase(
        execute: { monthlyRent, exchangeRate in
            Decimal(monthlyRent) * exchangeRate.usdPerKRW
        }
    )
}

public extension DependencyValues {
    var convertMonthlyRentCurrencyUseCase: ConvertMonthlyRentCurrencyUseCase {
        get { self[ConvertMonthlyRentCurrencyUseCase.self] }
        set { self[ConvertMonthlyRentCurrencyUseCase.self] = newValue }
    }
}
