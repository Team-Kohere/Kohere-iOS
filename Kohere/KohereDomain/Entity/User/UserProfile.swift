//
//  UserProfile.swift
//  Kohere
//
//  Created by Codex on 7/8/26.
//

import Foundation
import KohereCore

public struct UserProfile: Equatable, Sendable {
    public let id: Int
    public let userType: UserType
    public let name: String?
    public let nickname: String
    public let gender: String?
    public let birthDate: String?
    public let country: String?
    public let countryName: String?
    public let countryFlag: URL?
    public let occupation: String?
    public let email: String?
    public let visaType: String?
    public let phoneNumber: String?
    public let businessRegistrationNumber: String?
    public let status: AuthStatus
    public let termsOfServiceAgreed: Bool
    public let privacyPolicyAgreed: Bool
    public let marketingAgreed: Bool
    public let lang: String?
    public let createdAt: String

    public var appLanguage: AppLanguage? {
        lang.flatMap(AppLanguage.init(apiCode:))
    }

    public init(
        id: Int,
        userType: UserType,
        name: String?,
        nickname: String,
        gender: String?,
        birthDate: String?,
        country: String?,
        countryName: String?,
        countryFlag: URL?,
        occupation: String?,
        email: String?,
        visaType: String?,
        phoneNumber: String?,
        businessRegistrationNumber: String?,
        status: AuthStatus,
        termsOfServiceAgreed: Bool,
        privacyPolicyAgreed: Bool,
        marketingAgreed: Bool,
        lang: String?,
        createdAt: String
    ) {
        self.id = id
        self.userType = userType
        self.name = name
        self.nickname = nickname
        self.gender = gender
        self.birthDate = birthDate
        self.country = country
        self.countryName = countryName
        self.countryFlag = countryFlag
        self.occupation = occupation
        self.email = email
        self.visaType = visaType
        self.phoneNumber = phoneNumber
        self.businessRegistrationNumber = businessRegistrationNumber
        self.status = status
        self.termsOfServiceAgreed = termsOfServiceAgreed
        self.privacyPolicyAgreed = privacyPolicyAgreed
        self.marketingAgreed = marketingAgreed
        self.lang = lang
        self.createdAt = createdAt
    }
}

public struct UserProfileUpdate: Equatable, Sendable {
    public let gender: Gender?
    public let birthDate: String?
    public let country: String?
    public let occupation: Occupation?
    public let visaType: VisaType?
    public let name: String?
    public let phoneNumber: String?
    public let marketingAgreed: Bool?
    public let lang: String?

    public init(
        gender: Gender? = nil,
        birthDate: String? = nil,
        country: String? = nil,
        occupation: Occupation? = nil,
        visaType: VisaType? = nil,
        name: String? = nil,
        phoneNumber: String? = nil,
        marketingAgreed: Bool? = nil,
        lang: String? = nil
    ) {
        self.gender = gender
        self.birthDate = birthDate
        self.country = country
        self.occupation = occupation
        self.visaType = visaType
        self.name = name
        self.phoneNumber = phoneNumber
        self.marketingAgreed = marketingAgreed
        self.lang = lang
    }
}

public enum UserType: String, Equatable, Sendable {
    case tenant = "TENANT"
    case landlord = "LANDLORD"
    case unknown
}
