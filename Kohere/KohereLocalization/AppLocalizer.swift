//
//  AppLocalizer.swift
//  Kohere
//
//  Created by soomin on 8/9/26.
//

import Foundation
import KohereCore

nonisolated enum AppLocalizer {
    nonisolated static func resolve(_ resource: LocalizedStringResource, language: AppLanguage) -> String {
        var resource = resource
        resource.locale = language.locale
        return String(localized: resource)
    }

    // 문자열 카탈로그가 아직 앱 타깃에 있어서 앱 번들(Bundle.main)에서 찾는다.
    // 카탈로그를 이 모듈로 옮길 때 이 모듈의 번들로 바꿔야 한다.
    nonisolated static func resolve(key: String, language: AppLanguage, fallback: String? = nil) -> String {
        guard let path = Bundle.main.path(forResource: language.apiCode, ofType: "lproj"), let bundle = Bundle(path: path) else {
            return Bundle.main.localizedString(forKey: key, value: fallback ?? key, table: nil)
        }

        return bundle.localizedString(forKey: key, value: fallback ?? key, table: nil)
    }
}

extension AppLanguage {
    nonisolated public func localized(_ resource: LocalizedStringResource) -> String {
        AppLocalizer.resolve(resource, language: self)
    }

    nonisolated public func localizedString(forKey key: String, fallback: String? = nil) -> String {
        AppLocalizer.resolve(key: key, language: self, fallback: fallback)
    }
}
