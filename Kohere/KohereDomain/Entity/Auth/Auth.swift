//
//  Auth.swift
//  Kohere
//
//  Created by soomin on 6/18/26.
//

import Foundation

public nonisolated struct Auth: Equatable, Codable, Sendable {
    public let onboardingRequired: Bool
    public let status: AuthStatus
    public let tokenType: String
    public let accessToken: String
    public let refreshToken: String?
    public let expiresIn: Int
    public let expiresAt: Date?
    public let email: String?
    public let name: String?

    public init(
        onboardingRequired: Bool,
        status: AuthStatus,
        tokenType: String,
        accessToken: String,
        refreshToken: String?,
        expiresIn: Int,
        expiresAt: Date? = nil,
        email: String? = nil,
        name: String? = nil
    ) {
        self.onboardingRequired = onboardingRequired
        self.status = status
        self.tokenType = tokenType
        self.accessToken = accessToken
        self.refreshToken = refreshToken
        self.expiresIn = expiresIn
        self.expiresAt = expiresAt
        self.email = email
        self.name = name
    }
}

public nonisolated struct AuthToken: Equatable, Codable, Sendable {
    public let tokenType: String
    public let accessToken: String
    public let refreshToken: String
    public let expiresIn: Int

    public init(
        tokenType: String,
        accessToken: String,
        refreshToken: String,
        expiresIn: Int
    ) {
        self.tokenType = tokenType
        self.accessToken = accessToken
        self.refreshToken = refreshToken
        self.expiresIn = expiresIn
    }
}

public nonisolated enum AuthStatus: String, Equatable, Codable, Sendable {
    case pending = "PENDING"
    case active = "ACTIVE"
    case unknown
}

public enum SocialLoginCredential: Equatable, Sendable {
    case google(idToken: String, email: String?, name: String?)
    case apple(
        authorizationCode: String,
        email: String?,
        name: String?
    )
}

public struct PhoneVerificationCode: Equatable, Sendable {
    public let message: String?
    public let phoneNumber: String?
    public let expiresIn: Int

    public init(
        message: String?,
        phoneNumber: String?,
        expiresIn: Int
    ) {
        self.message = message
        self.phoneNumber = phoneNumber
        self.expiresIn = expiresIn
    }
}

public struct PhoneVerification: Equatable, Sendable {
    public let phoneNumber: String
    public let verified: Bool

    public init(
        phoneNumber: String,
        verified: Bool
    ) {
        self.phoneNumber = phoneNumber
        self.verified = verified
    }
}

public struct EmailVerificationCode: Equatable, Sendable {
    public let message: String?
    public let email: String
    public let expiresIn: Int

    public init(
        message: String?,
        email: String,
        expiresIn: Int
    ) {
        self.message = message
        self.email = email
        self.expiresIn = expiresIn
    }
}

public struct EmailVerification: Equatable, Sendable {
    public let email: String
    public let verified: Bool

    public init(
        email: String,
        verified: Bool
    ) {
        self.email = email
        self.verified = verified
    }
}

public struct TermsAgreement: Equatable, Sendable {
    public let status: String
    public let termsOfServiceAgreed: Bool
    public let privacyPolicyAgreed: Bool
    public let marketingAgreed: Bool
    public let agreedAt: String

    public init(
        status: String,
        termsOfServiceAgreed: Bool,
        privacyPolicyAgreed: Bool,
        marketingAgreed: Bool,
        agreedAt: String
    ) {
        self.status = status
        self.termsOfServiceAgreed = termsOfServiceAgreed
        self.privacyPolicyAgreed = privacyPolicyAgreed
        self.marketingAgreed = marketingAgreed
        self.agreedAt = agreedAt
    }
}

public struct AuthOnboardingProfile: Equatable, Sendable {
    public let gender: Gender
    public let birthDate: String
    public let country: String
    public let visaType: VisaType
    public let lang: String

    public init(
        gender: Gender,
        birthDate: String,
        country: String,
        visaType: VisaType,
        lang: String
    ) {
        self.gender = gender
        self.birthDate = birthDate
        self.country = country
        self.visaType = visaType
        self.lang = lang
    }
}

public struct LandlordOnboardingProfile: Equatable, Sendable {
    public let phoneNumber: String
    public let birthDate: String

    public init(
        phoneNumber: String,
        birthDate: String
    ) {
        self.phoneNumber = phoneNumber
        self.birthDate = birthDate
    }
}

extension Auth {
    public static func expirationDate(
        expiresIn: Int,
        issuedAt: Date = Date()
    ) -> Date {
        issuedAt.addingTimeInterval(TimeInterval(expiresIn))
    }

    public func shouldRefresh(
        now: Date = Date(),
        buffer: TimeInterval = 60
    ) -> Bool {
        guard let expiresAt else { return true }

        return expiresAt <= now.addingTimeInterval(buffer)
    }

    public func updating(with token: AuthToken, issuedAt: Date = Date()) -> Auth {
        Auth(
            onboardingRequired: onboardingRequired,
            status: status,
            tokenType: token.tokenType,
            accessToken: token.accessToken,
            refreshToken: token.refreshToken,
            expiresIn: token.expiresIn,
            expiresAt: Self.expirationDate(
                expiresIn: token.expiresIn,
                issuedAt: issuedAt
            ),
            email: email,
            name: name
        )
    }
}
