// swift-tools-version: 6.0
import PackageDescription

#if TUIST
import ProjectDescription

let packageSettings = PackageSettings(
    productTypes: [
        // TCA 계열: Domain·Data·앱이 같은 의존성 저장소를 써야 함
        "ComposableArchitecture": .framework,
        "Dependencies": .framework,
        "Clocks": .framework,
        "ConcurrencyExtras": .framework,
        "CombineSchedulers": .framework,
        "IssueReporting": .framework,
        "XCTestDynamicOverlay": .framework,
        // Firebase 계열: 앱과 Data가 같은 Firebase 인스턴스를 써야 함
        "FirebaseMessaging": .framework,
        "FirebaseCore": .framework,
        "FirebaseCoreInternal": .framework,
        "FirebaseInstallations": .framework,
        "FBLPromises": .framework,
        "GoogleUtilities-Environment": .framework,
        "GoogleUtilities-Logger": .framework,
        "GoogleUtilities-NSData": .framework,
        "GoogleUtilities-UserDefaults": .framework,
        "third-party-IsAppEncrypted": .framework,
    ]
)
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
