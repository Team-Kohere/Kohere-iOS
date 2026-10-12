#!/usr/bin/env python3
"""에셋 카탈로그의 색·이미지를 public 접근자로 생성한다.

Xcode는 카탈로그 심볼을 타깃 안에서만 보이는 internal로 만들기 때문에,
KohereDesignSystem 밖(앱·화면 모듈)에서 `.coolNeutral70` 같은 이름을 쓰려면
public 접근자가 따로 필요하다. 이름 규칙은 Xcode 생성 심볼과 같다
(`typo_logo` → `typoLogo`, `StatusRed50` → `statusRed50`).

사용법:
    python3 scripts/generate_asset_symbols.py

에셋을 추가·삭제·이름 변경한 뒤 실행하고 결과 파일을 함께 커밋한다.
Tuist 도입 후 리소스 접근자 생성을 Tuist에 맡기면 이 스크립트와 결과 파일을 지운다.
"""

import re
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
CATALOG = ROOT / "Kohere/KohereDesignSystem/Resources/Assets.xcassets"
OUTPUT = ROOT / "Kohere/KohereDesignSystem/Resources/GeneratedAssetSymbols.swift"

SWIFT_KEYWORDS = {
    "class", "struct", "enum", "protocol", "extension", "func", "var", "let", "import",
    "init", "self", "Self", "super", "default", "static", "public", "private", "internal",
    "true", "false", "nil", "is", "as", "in", "for", "while", "if", "else", "switch",
    "case", "return", "throw", "throws", "try", "catch", "where", "any", "some",
}


def identifier(name: str) -> str:
    """Xcode의 에셋 심볼 이름 규칙을 따른다."""
    words = [w for w in re.split(r"[^A-Za-z0-9]+", name) if w]
    if not words:
        raise ValueError(f"식별자를 만들 수 없는 에셋 이름: {name!r}")
    parts = []
    for i, word in enumerate(words):
        if i == 0:
            # 앞쪽 연속 대문자는 통째로 소문자로 (예: "URLIcon" → "urlIcon", "StatusRed50" → "statusRed50")
            m = re.match(r"^([A-Z]+)(?=[A-Z][a-z]|[^A-Za-z]|$)", word)
            if m and len(m.group(1)) > 1:
                parts.append(m.group(1).lower() + word[len(m.group(1)):])
            else:
                parts.append(word[0].lower() + word[1:])
        else:
            parts.append(word[0].upper() + word[1:])
    ident = "".join(parts)
    if ident[0].isdigit():
        ident = "_" + ident
    if ident in SWIFT_KEYWORDS:
        ident = f"`{ident}`"
    return ident


def collect(kind: str) -> list[tuple[str, str]]:
    sets = sorted(CATALOG.rglob(f"*.{kind}"), key=lambda p: p.stem.lower())
    result = []
    seen: dict[str, Path] = {}
    # Xcode는 이미지 이름 끝의 "Image", 색 이름 끝의 "Color"를 식별자에서 뗀다 (예: chatProfileImage → chatProfile)
    suffix = "Image" if kind == "imageset" else "Color"
    for path in sets:
        name = path.stem
        base = name[: -len(suffix)] if name.endswith(suffix) and len(name) > len(suffix) else name
        ident = identifier(base)
        if ident in seen:
            raise ValueError(f"심볼 이름 충돌: {seen[ident]} / {path} → {ident}")
        seen[ident] = path
        result.append((ident, name))
    return result


def main() -> None:
    colors = collect("colorset")
    images = collect("imageset")

    lines = [
        "// 이 파일은 scripts/generate_asset_symbols.py가 만든다. 직접 수정하지 않는다.",
        "",
        "import DeveloperToolsSupport",
        "import Foundation",
        "import SwiftUI",
        "import UIKit",
        "",
        "private final class ResourceBundleToken {}",
        "private let resourceBundle = Bundle(for: ResourceBundleToken.self)",
        "",
        "// MARK: - Color Symbols -",
        "",
        "extension ColorResource {",
    ]
    for ident, name in colors:
        lines += [
            f'    /// The "{name}" asset catalog color resource.',
            f'    nonisolated public static let {ident} = ColorResource(name: "{name}", bundle: resourceBundle)',
            "",
        ]
    lines += ["}", "", "// MARK: - Image Symbols -", "", "extension ImageResource {"]
    for ident, name in images:
        lines += [
            f'    /// The "{name}" asset catalog image resource.',
            f'    nonisolated public static let {ident} = ImageResource(name: "{name}", bundle: resourceBundle)',
            "",
        ]
    lines += ["}", "", "// MARK: - Color Symbol Extensions -", "", "extension Color {"]
    for ident, name in colors:
        lines += [
            f'    /// The "{name}" asset catalog color.',
            f"    nonisolated public static var {ident}: Color {{ Color(ColorResource.{ident}) }}",
            "",
        ]
    lines += ["}", "", "extension ShapeStyle where Self == Color {"]
    for ident, name in colors:
        lines += [
            f'    /// The "{name}" asset catalog color.',
            f"    nonisolated public static var {ident}: Color {{ Color(ColorResource.{ident}) }}",
            "",
        ]
    lines += ["}", "", "extension UIColor {"]
    for ident, name in colors:
        lines += [
            f'    /// The "{name}" asset catalog color.',
            f"    nonisolated public static var {ident}: UIColor {{ UIColor(resource: ColorResource.{ident}) }}",
            "",
        ]
    lines += ["}", "", "// MARK: - Image Symbol Extensions -", "", "extension UIImage {"]
    for ident, name in images:
        lines += [
            f'    /// The "{name}" asset catalog image.',
            f"    nonisolated public static var {ident}: UIImage {{ UIImage(resource: ImageResource.{ident}) }}",
            "",
        ]
    lines += ["}", ""]

    OUTPUT.parent.mkdir(parents=True, exist_ok=True)
    OUTPUT.write_text("\n".join(lines), encoding="utf-8")
    print(f"색 {len(colors)}개, 이미지 {len(images)}개 → {OUTPUT.relative_to(ROOT)}")


if __name__ == "__main__":
    main()
