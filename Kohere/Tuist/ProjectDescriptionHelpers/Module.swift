import ProjectDescription

public extension Target {
    static func module(
        name: String,
        resources: ResourceFileElements? = nil,
        scripts: [TargetScript] = [],
        dependencies: [TargetDependency] = [],
        settings: SettingsDictionary = [:]
    ) -> Target {
        .target(
            name: name,
            destinations: .iOS,
            product: .staticFramework,
            bundleId: "com.kohere.\(name)",
            deploymentTargets: .iOS("17.0"),
            sources: ["\(name)/**/*.swift"],
            resources: resources,
            scripts: scripts,
            dependencies: dependencies,
            settings: .settings(base: [
                "SWIFT_VERSION": "5.0",
                "SWIFT_DEFAULT_ACTOR_ISOLATION": "MainActor",
                "SWIFT_APPROACHABLE_CONCURRENCY": "YES",
                "SWIFT_UPCOMING_FEATURE_MEMBER_IMPORT_VISIBILITY": "YES",
                "DEVELOPMENT_TEAM": "2YTVA7GW5S"
            ].merging(settings) { _, new in new })
        )
    }
}
