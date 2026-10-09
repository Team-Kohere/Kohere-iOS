//
//  AuthInterface.swift
//  Kohere
//
//  Created by soomin on 6/30/26.
//

import ComposableArchitecture

public protocol AuthInterface {
    func socialLogin(credential: SocialLoginCredential) async throws -> Auth
    func reissue(refreshToken: String) async throws -> AuthToken
    func logout() async throws
    func sendPhoneVerificationCode(phoneNumber: String) async throws -> PhoneVerificationCode
    func verifyPhone(phoneNumber: String, code: String) async throws -> PhoneVerification
    func sendEmailVerificationCode(email: String) async throws -> EmailVerificationCode
    func verifyEmail(email: String, code: String) async throws -> EmailVerification
    func agreeTerms(termsOfServiceAgreed: Bool, privacyPolicyAgreed: Bool, marketingAgreed: Bool) async throws -> TermsAgreement
    func completeOnboarding(profile: AuthOnboardingProfile) async throws -> Auth
    func completeLandlordOnboarding(profile: LandlordOnboardingProfile) async throws -> Auth
}

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
}

extension AuthClient {
    public init(repository: any AuthInterface) {
        self.init(
            socialLogin: { credential in
                try await repository.socialLogin(credential: credential)
            },
            reissue: { refreshToken in
                try await repository.reissue(refreshToken: refreshToken)
            },
            logout: {
                try await repository.logout()
            },
            sendPhoneVerificationCode: { phoneNumber in
                try await repository.sendPhoneVerificationCode(phoneNumber: phoneNumber)
            },
            verifyPhone: { phoneNumber, code in
                try await repository.verifyPhone(phoneNumber: phoneNumber, code: code)
            },
            sendEmailVerificationCode: { email in
                try await repository.sendEmailVerificationCode(email: email)
            },
            verifyEmail: { email, code in
                try await repository.verifyEmail(email: email, code: code)
            },
            agreeTerms: { termsOfServiceAgreed, privacyPolicyAgreed, marketingAgreed in
                try await repository.agreeTerms(
                    termsOfServiceAgreed: termsOfServiceAgreed,
                    privacyPolicyAgreed: privacyPolicyAgreed,
                    marketingAgreed: marketingAgreed
                )
            },
            completeOnboarding: { profile in
                try await repository.completeOnboarding(profile: profile)
            },
            completeLandlordOnboarding: { profile in
                try await repository.completeLandlordOnboarding(profile: profile)
            }
        )
    }
}

extension AuthClient: DependencyKey {
    public static let liveValue = AuthClient(
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
