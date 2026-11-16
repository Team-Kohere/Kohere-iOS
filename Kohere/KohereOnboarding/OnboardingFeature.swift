//
//  OnboardingFeature.swift
//  Kohere
//
//  Created by soomin on 6/21/26.
//

import ComposableArchitecture
import Foundation
import KohereCore
import KohereDesignSystem
import KohereDomain

public enum OnboardingUserType: String, Equatable {
    case tenant
    case landlord
}

@Reducer
public struct OnboardingFeature {

    // MARK: - State

    @ObservableState
    public struct State: Equatable {
        public let userType: OnboardingUserType
        var tenant: TenantOnboardingFeature.State?
        var landlord: LandlordOnboardingFeature.State?

        public init(
            userType: OnboardingUserType = .tenant,
            appLanguage: AppLanguage = .english,
            socialName: String? = nil
        ) {
            self.userType = userType

            switch userType {
            case .tenant:
                self.tenant = TenantOnboardingFeature.State(appLanguage: appLanguage, name: socialName ?? "")
                self.landlord = nil
            case .landlord:
                self.tenant = nil
                self.landlord = LandlordOnboardingFeature.State(
                    appLanguage: appLanguage,
                    name: socialName ?? ""
                )
            }
        }

        public mutating func updateAppLanguage(_ language: AppLanguage) {
            tenant?.appLanguage = language
        }
    }

    // MARK: - Action

    public enum Delegate: Equatable {
        case completed(Auth)
        case popupRequested(AppPopup)
    }

    public enum Action: Equatable {
        case tenant(TenantOnboardingFeature.Action)
        case landlord(LandlordOnboardingFeature.Action)
        case delegate(Delegate)
    }

    public init() {}

    // MARK: - Reducer Body

    public var body: some Reducer<State, Action> {
        Reduce { _, action in
            switch action {
            case let .tenant(.delegate(.completed(auth))):
                return .send(.delegate(.completed(auth)))

            case let .landlord(.delegate(.completed(auth))):
                return .send(.delegate(.completed(auth)))

            case let .tenant(.popupRequested(popup)),
                 let .landlord(.popupRequested(popup)):
                return .send(.delegate(.popupRequested(popup)))

            case .tenant, .landlord, .delegate:
                return .none
            }
        }
        .ifLet(\.tenant, action: \.tenant) {
            TenantOnboardingFeature()
        }
        .ifLet(\.landlord, action: \.landlord) {
            LandlordOnboardingFeature()
        }
    }
}
