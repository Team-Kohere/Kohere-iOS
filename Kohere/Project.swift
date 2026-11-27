import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
    name: "Kohere",
    targets: [
        .target(
            name: "Kohere",
            destinations: [.iPhone],
            product: .app,
            bundleId: "com.kohere.Kohere",
            deploymentTargets: .iOS("17.0"),
            infoPlist: .file(path: "Kohere/Resource/Info.plist"),
            sources: ["Kohere/**/*.swift"],
            resources: [
                "Kohere/Resource/Assets.xcassets",
                "Kohere/Resource/Fonts/*.otf",
                "Kohere/Resource/GoogleService-Info.plist"
            ],
            entitlements: .file(path: "Kohere/Kohere.entitlements"),
            scripts: [
                .post(
                    script: """
                            if [[ "$(uname -m)" == arm64 ]]; then
                                export PATH="/opt/homebrew/bin:$PATH"
                            fi
                            if which swiftlint > /dev/null; then
                              swiftlint
                            else
                              echo "warning: SwiftLint not installed"
                            fi
                            """,
                    name: "SwiftLint",
                    basedOnDependencyAnalysis: false
                )
            ],
            dependencies: [
                .target(.core),
                .target(.localization),
                .target(.designSystem),
                .target(.domain),
                .target(.data),
                .target(.livingGuide),
                .target(.mapEntry),
                .target(.chatBot),
                .target(.chat),
                .target(.listing),
                .target(.profileForm),
                .target(.onboarding),
                .target(.login),
                .target(.more),
                .target(.map),
                .target(.home),
                .external(.composableArchitecture),
                .external(.googleSignIn),
                .external(.nMapsMap),
                .external(.firebaseMessaging)
            ],
            settings: .settings(
                base: [
                    "SWIFT_VERSION": "5.0",
                    "SWIFT_DEFAULT_ACTOR_ISOLATION": "MainActor",
                    "SWIFT_APPROACHABLE_CONCURRENCY": "YES",
                    "SWIFT_UPCOMING_FEATURE_MEMBER_IMPORT_VISIBILITY": "YES",
                    "DEVELOPMENT_TEAM": "2YTVA7GW5S",
                    "MARKETING_VERSION": "1.0.3",
                    "CURRENT_PROJECT_VERSION": "1",
                    "ASSETCATALOG_COMPILER_APPICON_NAME": "AppIcon",
                    "ASSETCATALOG_COMPILER_GLOBAL_ACCENT_COLOR_NAME": "AccentColor",
                    "OTHER_LDFLAGS": [
                        "$(inherited)",
                        "-force_load",
                        "$(BUILT_PRODUCTS_DIR)/KohereData.framework/KohereData",
                        // Keep the iOS authorization category used by Google Sign-In.
                        "-force_load",
                        "$(BUILT_PRODUCTS_DIR)/AppAuth.framework/AppAuth",
                        // Keep the NSData gzip category used by Firebase heartbeats.
                        "-force_load",
                        "$(BUILT_PRODUCTS_DIR)/GoogleUtilities_NSData.framework/GoogleUtilities_NSData"
                    ]
                ],
                configurations: [
                    .debug(name: .debug, xcconfig: "Config/Base.xcconfig"),
                    .release(name: .release, xcconfig: "Config/Base.xcconfig")
                ]
            )
        ),
        .module(.core),
        .module(
            .localization,
            resources: ["KohereLocalization/Resources/Localizable.xcstrings"],
            scripts: [
                .pre(
                    script: "python3 \"$SRCROOT/../scripts/generate_string_symbols.py\"",
                    name: "Generate String Symbols",
                    inputPaths: [
                        "$(SRCROOT)/KohereLocalization/Resources/Localizable.xcstrings",
                        "$(SRCROOT)/../scripts/generate_string_symbols.py"
                    ],
                    outputPaths: ["$(SRCROOT)/KohereLocalization/Resources/GeneratedStringSymbols.swift"]
                )
            ],
            dependencies: [.target(.core)],
            settings: ["STRING_CATALOG_GENERATE_SYMBOLS": "NO"]
        ),
        .module(
            .domain,
            dependencies: [
                .target(.core),
                .external(.dependencies)
            ],
            settings: ["SWIFT_DEFAULT_ACTOR_ISOLATION": "nonisolated"]
        ),
        .module(
            .designSystem,
            resources: ["KohereDesignSystem/Resources/Assets.xcassets"],
            dependencies: [
                .target(.core),
                .target(.localization),
                .external(.kingfisher)
            ],
            settings: ["ASSETCATALOG_COMPILER_GENERATE_ASSET_SYMBOLS": "NO"]
        ),
        .module(
            .data,
            dependencies: [
                .target(.core),
                .target(.domain),
                .external(.alamofire),
                .external(.dependencies),
                .external(.firebaseMessaging),
                .external(.swiftStomp)
            ],
            settings: ["SWIFT_DEFAULT_ACTOR_ISOLATION": "nonisolated"]
        ),
        .module(
            .livingGuide,
            dependencies: [
                .target(.data),
                .target(.designSystem),
                .target(.domain),
                .target(.localization),
                .external(.composableArchitecture)
            ]
        ),
        .module(
            .mapEntry,
            dependencies: [
                .target(.core),
                .target(.designSystem),
                .target(.domain),
                .target(.localization)
            ]
        ),
        .module(
            .listing,
            dependencies: [
                .target(.core),
                .target(.data),
                .target(.designSystem),
                .target(.domain),
                .target(.localization),
                .external(.composableArchitecture),
                .external(.nMapsMap)
            ]
        ),
        .module(
            .profileForm,
            dependencies: [
                .target(.core),
                .target(.designSystem),
                .target(.domain),
                .target(.localization)
            ]
        ),
        .module(
            .onboarding,
            dependencies: [
                .target(.core),
                .target(.data),
                .target(.designSystem),
                .target(.domain),
                .target(.localization),
                .target(.profileForm),
                .external(.composableArchitecture)
            ]
        ),
        .module(
            .login,
            dependencies: [
                .target(.core),
                .target(.data),
                .target(.designSystem),
                .target(.domain),
                .target(.localization),
                .target(.onboarding),
                .external(.composableArchitecture),
                .external(.googleSignIn)
            ]
        ),
        .module(
            .more,
            dependencies: [
                .target(.core),
                .target(.data),
                .target(.designSystem),
                .target(.domain),
                .target(.listing),
                .target(.livingGuide),
                .target(.localization),
                .target(.profileForm),
                .external(.composableArchitecture)
            ]
        ),
        .module(
            .chatBot,
            dependencies: [
                .target(.core),
                .target(.data),
                .target(.designSystem),
                .target(.domain),
                .target(.localization),
                .target(.mapEntry),
                .external(.composableArchitecture)
            ]
        ),
        .module(
            .chat,
            dependencies: [
                .target(.chatBot),
                .target(.core),
                .target(.data),
                .target(.designSystem),
                .target(.domain),
                .target(.listing),
                .target(.localization),
                .target(.mapEntry),
                .external(.composableArchitecture)
            ]
        ),
        .module(
            .map,
            dependencies: [
                .target(.chatBot),
                .target(.core),
                .target(.data),
                .target(.designSystem),
                .target(.domain),
                .target(.listing),
                .target(.localization),
                .target(.mapEntry),
                .external(.composableArchitecture),
                .external(.nMapsMap)
            ]
        ),
        .module(
            .home,
            dependencies: [
                .target(.core),
                .target(.data),
                .target(.designSystem),
                .target(.domain),
                .target(.localization),
                .target(.listing),
                .target(.livingGuide),
                .target(.chatBot),
                .target(.mapEntry),
                .external(.composableArchitecture)
            ]
        ),
        .target(
            name: "KohereTests",
            destinations: [.iPhone],
            product: .unitTests,
            bundleId: "com.kohere.KohereTests",
            deploymentTargets: .iOS("26.2"),
            sources: ["KohereTests/**/*.swift"],
            dependencies: [
                .target(name: "Kohere"),
                .target(.core),
                .target(.localization),
                .target(.designSystem),
                .target(.domain),
                .target(.data),
                .target(.livingGuide),
                .target(.mapEntry),
                .target(.chatBot),
                .target(.chat),
                .target(.listing),
                .target(.profileForm),
                .target(.onboarding),
                .target(.login),
                .target(.more),
                .target(.map),
                .target(.home),
                .external(.composableArchitecture),
                .external(.alamofire)
            ],
            settings: .settings(base: [
                "SWIFT_VERSION": "5.0",
                "SWIFT_APPROACHABLE_CONCURRENCY": "YES",
                "SWIFT_UPCOMING_FEATURE_MEMBER_IMPORT_VISIBILITY": "YES",
                "DEVELOPMENT_TEAM": "2YTVA7GW5S"
            ])
        )
    ],
    resourceSynthesizers: [.assets()]
)
