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

    nonisolated static func resolve(key: String, language: AppLanguage, fallback: String? = nil) -> String {
        let catalogBundle = KohereLocalizationBundle.value
        guard let path = catalogBundle.path(forResource: language.apiCode, ofType: "lproj"), let bundle = Bundle(path: path) else {
            return catalogBundle.localizedString(forKey: key, value: fallback ?? key, table: nil)
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
