//
//  ResourceSymbolsTests.swift
//  KohereTests
//
//  생성된 리소스 접근자가 실제 카탈로그와 맞는지 확인한다.
//  이름이 틀리면 컴파일은 되지만 실행 때 빈 색·빈 이미지·키 문자열이 그대로 보이므로 테스트로 막는다.
//

import KohereCore
import KohereDesignSystem
import KohereLocalization
import UIKit
import XCTest

final class ResourceSymbolsTests: XCTestCase {
    /// Kohere/KohereTests/ResourceSymbolsTests.swift → 저장소 루트
    private static let repositoryRoot = URL(fileURLWithPath: #filePath)
        .deletingLastPathComponent()
        .deletingLastPathComponent()
        .deletingLastPathComponent()

    private static let assetCatalog = repositoryRoot
        .appendingPathComponent("Kohere/KohereDesignSystem/Resources/Assets.xcassets")
    private static let stringCatalog = repositoryRoot
        .appendingPathComponent("Kohere/KohereLocalization/Resources/Localizable.xcstrings")

    // MARK: - 에셋

    func testEveryColorInCatalogLoadsFromDesignSystemBundle() throws {
        let bundle = KohereDesignSystemResources.bundle
        let names = try Self.catalogEntryNames(suffix: "colorset")
        XCTAssertGreaterThan(names.count, 100)

        let missing = names.filter { UIColor(named: $0, in: bundle, compatibleWith: nil) == nil }
        XCTAssertEqual(missing, [], "DesignSystem 번들에서 찾지 못한 색")
    }

    func testEveryImageInCatalogLoadsFromDesignSystemBundle() throws {
        let bundle = KohereDesignSystemResources.bundle
        let names = try Self.catalogEntryNames(suffix: "imageset")
        XCTAssertGreaterThan(names.count, 100)

        let missing = names.filter { UIImage(named: $0, in: bundle, with: nil) == nil }
        XCTAssertEqual(missing, [], "DesignSystem 번들에서 찾지 못한 이미지")
    }

    func testGeneratedAssetSymbolsResolve() {
        XCTAssertNotNil(UIColor.primary50.cgColor)
        XCTAssertNotNil(UIImage.typoLogo.cgImage)
    }

    // MARK: - 문자열

    func testEveryTranslatedKeyResolvesFromLocalizationBundle() throws {
        let catalog = try Self.loadStringCatalog()
        let bundle = KohereLocalizationBundle.value

        for language in AppLanguage.allCases {
            let path = try XCTUnwrap(bundle.path(forResource: language.apiCode, ofType: "lproj"), "\(language.apiCode).lproj 없음")
            let languageBundle = try XCTUnwrap(Bundle(path: path))
            let keys = catalog.filter { $0.value[language.apiCode] != nil }.map(\.key)
            XCTAssertGreaterThan(keys.count, 300)

            let unresolved = keys.filter { key in
                languageBundle.localizedString(forKey: key, value: "\u{0}", table: nil) == "\u{0}"
            }
            XCTAssertEqual(unresolved, [], "\(language.apiCode)에서 번역을 찾지 못한 키")
        }
    }

    func testGeneratedStringSymbolsFollowSelectedLanguage() {
        XCTAssertEqual(AppLanguage.korean.localized(.commonClose), "닫기")
        XCTAssertEqual(AppLanguage.english.localized(.commonClose), "Close")
        XCTAssertEqual(AppLanguage.korean.localizedString(forKey: "common.close"), "닫기")
        XCTAssertEqual(AppLanguage.english.localizedString(forKey: "common.close"), "Close")
    }

    func testDynamicKeyLookupUsesLocalizationBundle() {
        let resolved = String(localized: "common.close", bundle: KohereLocalizationBundle.value)
        XCTAssertNotEqual(resolved, "common.close")
    }

    // MARK: - Helpers

    private static func catalogEntryNames(suffix: String) throws -> [String] {
        let enumerator = try XCTUnwrap(FileManager.default.enumerator(at: assetCatalog, includingPropertiesForKeys: nil))
        return enumerator
            .compactMap { $0 as? URL }
            .filter { $0.pathExtension == suffix }
            .map { $0.deletingPathExtension().lastPathComponent }
    }

    /// key → (언어 코드 → 번역 값)
    private static func loadStringCatalog() throws -> [String: [String: String]] {
        let data = try Data(contentsOf: stringCatalog)
        let root = try XCTUnwrap(JSONSerialization.jsonObject(with: data) as? [String: Any])
        let strings = try XCTUnwrap(root["strings"] as? [String: Any])

        var result: [String: [String: String]] = [:]
        for (key, entry) in strings where !key.isEmpty {
            guard let localizations = (entry as? [String: Any])?["localizations"] as? [String: Any] else { continue }
            var values: [String: String] = [:]
            for (language, unit) in localizations {
                if let value = ((unit as? [String: Any])?["stringUnit"] as? [String: Any])?["value"] as? String {
                    values[language] = value
                }
            }
            result[key] = values
        }
        return result
    }
}
