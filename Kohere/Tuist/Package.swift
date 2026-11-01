// swift-tools-version: 6.0
import PackageDescription

#if TUIST
import ProjectDescription

let packageSettings = PackageSettings()
#endif

let package = Package(
    name: "Kohere",
    dependencies: [
        .package(url: "https://github.com/Alamofire/Alamofire", exact: "5.12.0"),
        .package(url: "https://github.com/firebase/firebase-ios-sdk", exact: "12.18.0"),
        .package(url: "https://github.com/google/GoogleSignIn-iOS", exact: "9.2.0"),
        .package(url: "https://github.com/onevcat/Kingfisher.git", exact: "8.10.0"),
        .package(url: "https://github.com/navermaps/SPM-NMapsMap", exact: "3.23.2"),
        .package(url: "https://github.com/pointfreeco/swift-composable-architecture", exact: "1.26.0"),
        .package(url: "https://github.com/Romixery/SwiftStomp.git", exact: "1.2.1"),
    ]
)
