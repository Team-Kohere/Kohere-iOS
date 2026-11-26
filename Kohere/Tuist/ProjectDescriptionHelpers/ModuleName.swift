import ProjectDescription

/// Kohere 모듈 이름. `Project.swift`에서 모듈을 선언하거나 참조할 때 문자열 대신 쓴다.
public enum Module: String, CaseIterable {
    // 기반
    case core = "KohereCore"
    case localization = "KohereLocalization"
    case designSystem = "KohereDesignSystem"
    case domain = "KohereDomain"
    case data = "KohereData"

    // 공용 화면
    case listing = "KohereListing"
    case mapEntry = "KohereMapEntry"
    case profileForm = "KohereProfileForm"

    // 화면
    case home = "KohereHome"
    case map = "KohereMap"
    case chat = "KohereChat"
    case chatBot = "KohereChatBot"
    case more = "KohereMore"
    case onboarding = "KohereOnboarding"
    case login = "KohereLogin"
    case livingGuide = "KohereLivingGuide"
}

/// `Tuist/Package.swift`로 받는 외부 라이브러리 이름.
public enum External: String, CaseIterable {
    case alamofire = "Alamofire"
    case composableArchitecture = "ComposableArchitecture"
    case dependencies = "Dependencies"
    case firebaseMessaging = "FirebaseMessaging"
    case googleSignIn = "GoogleSignIn"
    case kingfisher = "Kingfisher"
    case nMapsMap = "NMapsMap"
    case swiftStomp = "SwiftStomp"
}

public extension TargetDependency {
    static func target(_ module: Module) -> TargetDependency {
        .target(name: module.rawValue)
    }

    static func external(_ library: External) -> TargetDependency {
        .external(name: library.rawValue)
    }
}
