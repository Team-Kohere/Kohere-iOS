import ComposableArchitecture
import KohereChat
import KohereCore
import KohereDesignSystem
import KohereDomain
import KohereHome
import KohereLogin
import KohereMap
import KohereMore
import KohereOnboarding

extension RootFeature {
    @ObservableState
    struct State: Equatable {
        var authInfo: Auth?
        var currentUser: UserProfile?
        var appLanguage: AppLanguage = .english
        var isAuthLoading = true
        var isSplashMinimumDurationElapsed = false
        var isCurrentUserLoading = false
        var isLogoutRequesting = false
        var isDeleteAccountRequesting = false
        var isAuthenticationFlowPresented = false
        var login = LoginFeature.State()
        var onboarding = OnboardingFeature.State()
        var selectedTab: AppTab = .home
        var popup: AppPopup?
        var home = HomeFeature.State()
        var map = MapFeature.State()
        var chat = ChatFeature.State()
        var more = MoreFeature.State()

        var isSplashPresented: Bool { isAuthLoading || !isSplashMinimumDurationElapsed }
    }
}
