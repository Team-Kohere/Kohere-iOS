//
//  AuthClient.swift
//  Kohere
//
//  Created by soomin on 6/30/26.
//

import Dependencies

public struct AuthClient: Sendable {
    public var socialLogin: @Sendable (_ credential: SocialLoginCredential) async throws -> Auth
    public var reissue: @Sendable (_ refreshToken: String) async throws -> AuthToken
    public var logout: @Sendable () async throws -> Void
    public var sendPhoneVerificationCode: @Sendable (_ phoneNumber: String) async throws -> PhoneVerificationCode
    public var verifyPhone: @Sendable (_ phoneNumber: String, _ code: String) async throws -> PhoneVerification
    public var sendEmailVerificationCode: @Sendable (_ email: String) async throws -> EmailVerificationCode
    public var verifyEmail: @Sendable (_ email: String, _ code: String) async throws -> EmailVerification
    public var agreeTerms: @Sendable (_ termsOfServiceAgreed: Bool, _ privacyPolicyAgreed: Bool, _ marketingAgreed: Bool) async throws -> TermsAgreement
    public var completeOnboarding: @Sendable (_ profile: AuthOnboardingProfile) async throws -> Auth
    public var completeLandlordOnboarding: @Sendable (_ profile: LandlordOnboardingProfile) async throws -> Auth

    public init(
        socialLogin: @escaping @Sendable (_ credential: SocialLoginCredential) async throws -> Auth,
        reissue: @escaping @Sendable (_ refreshToken: String) async throws -> AuthToken,
        logout: @escaping @Sendable () async throws -> Void,
        sendPhoneVerificationCode: @escaping @Sendable (_ phoneNumber: String) async throws -> PhoneVerificationCode,
        verifyPhone: @escaping @Sendable (_ phoneNumber: String, _ code: String) async throws -> PhoneVerification,
        sendEmailVerificationCode: @escaping @Sendable (_ email: String) async throws -> EmailVerificationCode,
        verifyEmail: @escaping @Sendable (_ email: String, _ code: String) async throws -> EmailVerification,
        agreeTerms: @escaping @Sendable (_ termsOfServiceAgreed: Bool, _ privacyPolicyAgreed: Bool, _ marketingAgreed: Bool) async throws -> TermsAgreement,
        completeOnboarding: @escaping @Sendable (_ profile: AuthOnboardingProfile) async throws -> Auth,
        completeLandlordOnboarding: @escaping @Sendable (_ profile: LandlordOnboardingProfile) async throws -> Auth
    ) {
        self.socialLogin = socialLogin
        self.reissue = reissue
        self.logout = logout
        self.sendPhoneVerificationCode = sendPhoneVerificationCode
        self.verifyPhone = verifyPhone
        self.sendEmailVerificationCode = sendEmailVerificationCode
        self.verifyEmail = verifyEmail
        self.agreeTerms = agreeTerms
        self.completeOnboarding = completeOnboarding
        self.completeLandlordOnboarding = completeLandlordOnboarding
    }
}

extension AuthClient: TestDependencyKey {
    public static let testValue = AuthClient(
        socialLogin: { _ in throw CancellationError() },
        reissue: { _ in throw CancellationError() },
        logout: { },
        sendPhoneVerificationCode: { _ in throw CancellationError() },
        verifyPhone: { _, _ in throw CancellationError() },
        sendEmailVerificationCode: { _ in throw CancellationError() },
        verifyEmail: { _, _ in throw CancellationError() },
        agreeTerms: { _, _, _ in throw CancellationError() },
        completeOnboarding: { _ in throw CancellationError() },
        completeLandlordOnboarding: { _ in throw CancellationError() }
    )
}

extension DependencyValues {
    public var authClient: AuthClient {
        get { self[AuthClient.self] }
        set { self[AuthClient.self] = newValue }
    }
}
