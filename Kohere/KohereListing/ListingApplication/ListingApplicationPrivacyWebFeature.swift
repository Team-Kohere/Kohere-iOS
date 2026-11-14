//
//  ListingApplicationPrivacyWebFeature.swift
//  Kohere
//
//  Created by Codex on 7/9/26.
//

import ComposableArchitecture
import Foundation
import KohereCore

@Reducer
public struct ListingApplicationPrivacyWebFeature {
    public init() {}

    @ObservableState
    public struct State: Equatable {
        let title: String
        let url: URL
        var isLoading: Bool

        public init(
            section: ListingApplicationPrivacySection,
            appLanguage: AppLanguage = .english,
            isLoading: Bool = true
        ) {
            title = section.title(language: appLanguage)
            url = section.url
            self.isLoading = isLoading
        }
    }

    public enum Action: Equatable {
        case backButtonTapped
        case loadingStarted
        case loadingFinished
    }

    public var body: some Reducer<State, Action> {
        Reduce { state, action in
            switch action {
            case .backButtonTapped:
                return .none

            case .loadingStarted:
                state.isLoading = true
                return .none

            case .loadingFinished:
                state.isLoading = false
                return .none
            }
        }
    }
}
