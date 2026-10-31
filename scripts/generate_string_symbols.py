#!/usr/bin/env python3
"""문자열 카탈로그의 키를 public 접근자로 생성한다.

Xcode 26도 문자열 카탈로그 심볼을 만들어 주지만 internal이라,
KohereLocalization 밖(앱·화면 모듈)에서 `Text(.commonClose)`처럼 쓰려면 public 접근자가 따로 필요하다.
이름 규칙은 Xcode 생성 심볼과 같다 (`common.close` → `commonClose`).

Tuist의 문자열 합성기는 .strings/.stringsdict만 읽고 .xcstrings는 읽지 못해서 이 스크립트를 남겼다.
에셋 접근자는 Tuist가 Tuist/ResourceSynthesizers/Assets.stencil로 만든다.

사용법:
    python3 scripts/generate_string_symbols.py

KohereLocalization 타깃의 "Generate String Symbols" 빌드 단계가 컴파일 전에 자동으로 실행한다.
직접 실행해도 되고, 결과 파일은 저장소에 커밋한다.
"""

import json
import re
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
STRINGS_CATALOG = ROOT / "Kohere/KohereLocalization/Resources/Localizable.xcstrings"
STRINGS_OUTPUT = ROOT / "Kohere/KohereLocalization/Resources/GeneratedStringSymbols.swift"

SWIFT_KEYWORDS = {
    "class", "struct", "enum", "protocol", "extension", "func", "var", "let", "import",
    "init", "self", "Self", "super", "default", "static", "public", "private", "internal",
    "true", "false", "nil", "is", "as", "in", "for", "while", "if", "else", "switch",
    "case", "return", "throw", "throws", "try", "catch", "where", "any", "some",
}


def identifier(name: str) -> str:
    """Xcode의 심볼 이름 규칙을 따른다."""
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


def write_if_changed(path: Path, content: str) -> None:
    if path.exists() and path.read_text(encoding="utf-8") == content:
        return
    path.write_text(content, encoding="utf-8")


FORMAT_SPECIFIER = re.compile(r"%(?:(\d+)\$)?([@d])")
SPECIFIER_TYPES = {"@": "String", "d": "Int32"}


def string_arguments(value: str) -> list[tuple[int, str]]:
    """소스 언어 값에서 포맷 인자를 (번호, 타입) 순서로 뽑는다. `%1$@`처럼 번호가 있으면 그 번호를 쓴다."""
    args: dict[int, str] = {}
    for index, match in enumerate(FORMAT_SPECIFIER.finditer(value), start=1):
        position = int(match.group(1)) if match.group(1) else index
        args[position] = SPECIFIER_TYPES[match.group(2)]
    return sorted(args.items())


def default_value(value: str) -> str:
    """Xcode와 같은 defaultValue 문자열 보간으로 바꾼다."""
    counter = 0

    def repl(match: re.Match) -> str:
        nonlocal counter
        counter += 1
        position = int(match.group(1)) if match.group(1) else counter
        if match.group(2) == "d":
            return f'\\(arg{position}, specifier: "%d")'
        return f"\\(arg{position})"

    escaped = value.replace("\\", "\\\\").replace('"', '\\"').replace("\n", "\\n")
    return FORMAT_SPECIFIER.sub(repl, escaped)


def generate_strings() -> None:
    catalog = json.loads(STRINGS_CATALOG.read_text(encoding="utf-8"))
    source_language = catalog["sourceLanguage"]
    table = STRINGS_CATALOG.stem
    seen: dict[str, str] = {}
    lines = [
        "// 이 파일은 scripts/generate_string_symbols.py가 만든다. 직접 수정하지 않는다.",
        "",
        "import Foundation",
        "",
        "// Bundle.module은 Tuist가 만든다. 정적 프레임워크에서도 리소스 번들을 정확히 가리킨다.",
        "private let resourceBundleDescription = LocalizedStringResource.BundleDescription.atURL(Bundle.module.bundleURL)",
        "",
        "/// 문자열 카탈로그가 들어 있는 번들. 키를 문자열로만 아는 경우에 쓴다.",
        "public enum KohereLocalizationBundle {",
        "    public static let value = Bundle.module",
        "}",
        "",
        "extension LocalizedStringResource {",
    ]
    for key in sorted(catalog["strings"], key=str.lower):
        if not key:
            continue
        localizations = catalog["strings"][key].get("localizations", {})
        source = localizations.get(source_language, {}).get("stringUnit", {}).get("value", key)
        ident = identifier(key)
        if ident in seen:
            raise ValueError(f"문자열 심볼 이름 충돌: {seen[ident]!r} / {key!r} → {ident}")
        seen[ident] = key
        args = string_arguments(source)
        lines.append(f'    /// Localized string for key "{key}" in table "{table}.xcstrings".')
        if args:
            params = ", ".join(f"_ arg{position}: {type_name}" for position, type_name in args)
            lines += [
                f"    nonisolated public static func {ident}({params}) -> LocalizedStringResource {{",
                f'        LocalizedStringResource("{key}", defaultValue: "{default_value(source)}", table: "{table}", bundle: resourceBundleDescription)',
                "    }",
            ]
        else:
            lines += [
                f"    nonisolated public static var {ident}: LocalizedStringResource {{",
                f'        LocalizedStringResource("{key}", table: "{table}", bundle: resourceBundleDescription)',
                "    }",
            ]
        lines.append("")
    lines += ["}", ""]
    write_if_changed(STRINGS_OUTPUT, "\n".join(lines))
    print(f"문자열 {len(seen)}개 → {STRINGS_OUTPUT.relative_to(ROOT)}")


if __name__ == "__main__":
    generate_strings()
