//
//  MapFilterState.swift
//  Kohere
//
//  Created by Codex on 6/25/26.
//

import Foundation
import KohereCore
import KohereDesignSystem
import KohereDomain
import KohereLocalization

public struct MapFilterState: Equatable, Sendable {
    public var selectedOptions: Set<RoomCondition> = []

    public var monthlyRentRange = MapFilterPriceRange.defaultMonthlyRent
    public var depositRange = MapFilterPriceRange.defaultDeposit

    public var selectedPropertyTypes: Set<MapPropertyType> = []

    public init() {}
}

extension MapFilterState {
    public var isDefault: Bool {
        self == MapFilterState()
    }

    public var hasSelectedOptions: Bool {
        !selectedOptions.isEmpty
    }

    public var hasSelectedPriceRange: Bool {
        monthlyRentRange != MapFilterPriceRange.defaultMonthlyRent
            || depositRange != MapFilterPriceRange.defaultDeposit
    }

    public var hasSelectedPropertyTypes: Bool {
        !selectedPropertyTypes.isEmpty
    }

    public mutating func toggleOption(_ option: RoomCondition) {
        if selectedOptions.contains(option) {
            selectedOptions.remove(option)
        } else {
            selectedOptions.insert(option)
        }
    }

    public mutating func togglePropertyType(_ propertyType: MapPropertyType) {
        if selectedPropertyTypes.contains(propertyType) {
            selectedPropertyTypes.remove(propertyType)
        } else {
            selectedPropertyTypes = [propertyType]
        }
    }

    public mutating func updateMonthlyRentMinimum(_ minimum: Int) {
        monthlyRentRange.updateMinimum(minimum, bounds: MapFilterPriceRange.monthlyRent)
    }

    public mutating func updateMonthlyRentMaximum(_ maximum: Int) {
        monthlyRentRange.updateMaximum(maximum, bounds: MapFilterPriceRange.monthlyRent)
    }

    public mutating func updateDepositMinimum(_ minimum: Int) {
        depositRange.updateMinimum(minimum, bounds: MapFilterPriceRange.deposit)
    }

    public mutating func updateDepositMaximum(_ maximum: Int) {
        depositRange.updateMaximum(maximum, bounds: MapFilterPriceRange.deposit)
    }
}

public enum MapFilterPriceRange {
    public static let monthlyRent = 0...100
    public static let deposit = 0...300

    // 기본값은 전체다. 슬라이더 양끝은 각각 하한 없음과 상한 없음을 의미한다.
    public static let defaultMonthlyRent = RangeSliderValue(
        minimum: monthlyRent.lowerBound,
        maximum: monthlyRent.upperBound,
        bounds: monthlyRent
    )
    public static let defaultDeposit = RangeSliderValue(
        minimum: deposit.lowerBound,
        maximum: deposit.upperBound,
        bounds: deposit
    )
}

public enum MapPropertyType: CaseIterable, Hashable, Sendable {
    case goshiwon
    case coLiving
    case shareHouse

    public func displayTitle(locale: Locale) -> String {
        let language = AppLanguage(locale: locale)
        return switch self {
        case .goshiwon:
            language.localized(.mapPropertyTypeGoshiwon)
        case .coLiving:
            language.localized(.mapPropertyTypeCoLiving)
        case .shareHouse:
            language.localized(.mapPropertyTypeShareHouse)
        }
    }
}

extension RoomCondition {
    public static let mapListingFilterCases = allCases.filter { $0 != .noARCRequired }

    public func mapFilterDisplayTitle(locale: Locale) -> String {
        let language = AppLanguage(locale: locale)
        return switch self {
        case .moveInNow:
            language.localized(.mapFilterOptionMoveInNow)
        case .femaleOnly:
            language.localized(.mapFilterOptionFemaleOnly)
        case .mealsIncluded:
            language.localized(.mapFilterOptionMealsIncluded)
        case .doubleRoom:
            language.localized(.mapFilterOptionDoubleRoom)
        case .privateBathroom:
            language.localized(.mapFilterOptionPrivateBathroom)
        case .englishSupport:
            language.localized(.mapFilterOptionEnglishSupport)
        case .addressRegistration:
            language.localized(.mapFilterOptionAddressRegistration)
        case .noMaintenanceFee:
            language.localized(.mapFilterOptionNoMaintenanceFee)
        case .noARCRequired:
            language.localized(.mapFilterOptionNoARCRequired)
        }
    }
}
