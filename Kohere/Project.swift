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
                "Kohere/Resource/GoogleService-Info.plist",
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
                ),
            ],
            dependencies: [
                .target(name: "KohereCore"),
                .target(name: "KohereLocalization"),
                .target(name: "KohereDesignSystem"),
                .target(name: "KohereDomain"),
                .target(name: "KohereData"),
                .external(name: "ComposableArchitecture"),
                .external(name: "GoogleSignIn"),
                .external(name: "NMapsMap"),
                .external(name: "FirebaseMessaging"),
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
                ],
                configurations: [
                    .debug(name: .debug, xcconfig: "Config/Base.xcconfig"),
                    .release(name: .release, xcconfig: "Config/Base.xcconfig")
                ]
            )
        ),
        .module(name: "KohereCore"),
        .module(
            name: "KohereLocalization",
            resources: ["KohereLocalization/Resources/Localizable.xcstrings"],
            dependencies: [.target(name: "KohereCore")],
            settings: ["STRING_CATALOG_GENERATE_SYMBOLS": "NO"]
        ),
        .module(
            name: "KohereDomain",
            dependencies: [
                .target(name: "KohereCore"),
                .external(name: "Dependencies"),
            ],
            settings: ["SWIFT_DEFAULT_ACTOR_ISOLATION": "nonisolated"]
        ),
        .module(
            name: "KohereDesignSystem",
            resources: ["KohereDesignSystem/Resources/Assets.xcassets"],
            dependencies: [
                .target(name: "KohereCore"),
                .target(name: "KohereLocalization"),
                .external(name: "Kingfisher"),
            ],
            settings: ["ASSETCATALOG_COMPILER_GENERATE_ASSET_SYMBOLS": "NO"]
        ),
        .module(
            name: "KohereData",
            dependencies: [
                .target(name: "KohereCore"),
                .target(name: "KohereDomain"),
                .external(name: "Alamofire"),
                .external(name: "Dependencies"),
                .external(name: "FirebaseMessaging"),
                .external(name: "SwiftStomp"),
            ],
            settings: ["SWIFT_DEFAULT_ACTOR_ISOLATION": "nonisolated"]
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
                .target(name: "KohereCore"),
                .target(name: "KohereLocalization"),
                .target(name: "KohereDesignSystem"),
                .target(name: "KohereDomain"),
                .target(name: "KohereData"),
                .external(name: "ComposableArchitecture"),
                .external(name: "Alamofire"),
            ],
            settings: .settings(base: [
                "SWIFT_VERSION": "5.0",
                "SWIFT_APPROACHABLE_CONCURRENCY": "YES",
                "SWIFT_UPCOMING_FEATURE_MEMBER_IMPORT_VISIBILITY": "YES",
                "DEVELOPMENT_TEAM": "2YTVA7GW5S",
            ])
        ),
    ]
)
