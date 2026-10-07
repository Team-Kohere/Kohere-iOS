//
//  AppLanguage.swift
//  Kohere
//
//  Created by soomin on 8/9/26.
//

import Foundation

nonisolated public enum AppLanguage: CaseIterable, Codable, Equatable, Sendable {
    case korean
    case english

    public var apiCode: String {
        switch self {
        case .korean:
            "ko"
        case .english:
            "en"
        }
    }

    var localeIdentifier: String {
        switch self {
        case .korean:
            "ko-KR"
        case .english:
            "en-US"
        }
    }

    public var locale: Locale {
        Locale(identifier: localeIdentifier)
    }

    public var nativeDisplayName: String {
        switch self {
        case .korean:
            "한국어"
        case .english:
            "English"
        }
    }

    public init?(apiCode: String) {
        switch apiCode.lowercased() {
        case "ko":
            self = .korean
        case "en":
            self = .english
        default:
            return nil
        }
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let apiCode = try container.decode(String.self)

        guard let language = Self(apiCode: apiCode) else {
            throw DecodingError.dataCorruptedError(in: container, debugDescription: "Unsupported app language code: \(apiCode)")
        }

        self = language
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(apiCode)
    }
}
