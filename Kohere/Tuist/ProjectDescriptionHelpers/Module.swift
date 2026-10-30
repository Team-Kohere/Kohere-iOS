import ProjectDescription

public extension Target {
    static func module(
        name: String,
        resources: ResourceFileElements? = nil,
        dependencies: [TargetDependency] = [],
        settings: SettingsDictionary = [:]
    ) -> Target {
        .target(
            name: name,
            destinations: .iOS,
            product: .framework,
            bundleId: "com.kohere.\(name)",
            deploymentTargets: .iOS("17.0"),
            sources: ["\(name)/**/*.swift"],
            resources: resources,
            dependencies: dependencies,
            settings: .settings(base: settings)
        )
    }
}
