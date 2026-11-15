//
//  AnnouncementsFeature.swift
//  Kohere
//
//  Created by Codex on 7/18/26.
//

import ComposableArchitecture

@Reducer
public struct AnnouncementsFeature {
    @ObservableState
    public struct State: Equatable {}

    public enum Action: Equatable {
        case backButtonTapped
    }

    public var body: some Reducer<State, Action> {
        Reduce { _, action in
            switch action {
            case .backButtonTapped:
                return .none
            }
        }
    }
}
