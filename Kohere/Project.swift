import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
    name: "Kohere",
    targets: [
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
                .external(name: "Dependencies")
            ],
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
            ]
        ),
    ]
)
