//
//  PromoteRoomWebFeature.swift
//  Kohere
//
//  Created by Codex on 7/2/26.
//

import ComposableArchitecture
import Foundation

@Reducer
public struct PromoteRoomWebFeature {
    @ObservableState
    public struct State: Equatable {
        let url: URL
        var isLoading: Bool

        init(
            url: URL = URL(string: "https://forms.gle/1aZdZgBLeHd4b1zr7")!,
            isLoading: Bool = true
        ) {
            self.url = url
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
