//
//  LocalizedStringResource+Locale.swift
//  KohereDesignSystem
//

import Foundation

extension LocalizedStringResource {
    /// 컴포넌트 고유 문구를 화면의 locale로 꺼낸다. 문구는 KohereDesignSystem의 Localizable.xcstrings에 있다.
    nonisolated func resolved(in locale: Locale) -> String {
        var resource = self
        resource.locale = locale
        return String(localized: resource)
    }
}
