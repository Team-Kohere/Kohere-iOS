//
//  NotificationSettingError.swift
//  Kohere
//

public nonisolated enum NotificationSettingError: Error, Equatable {
    case invalidInput
    case malformedRequest
    case unauthenticated
    case tokenExpired
    case onboardingRequired
    case requestFailed(DataError)

    public static func from(_ error: Error) -> Self {
        if let error = error as? Self {
            return error
        }

        let dataError = DataError.from(error)

        guard case let .serverError(code, _) = dataError else {
            return .requestFailed(dataError)
        }

        switch code {
        case "INVALID_INPUT":
            return .invalidInput

        case "MALFORMED_REQUEST":
            return .malformedRequest

        case "UNAUTHENTICATED":
            return .unauthenticated

        case "TOKEN_EXPIRED":
            return .tokenExpired

        case "AUTH_ONBOARDING_REQUIRED":
            return .onboardingRequired

        default:
            return .requestFailed(dataError)
        }
    }
}
