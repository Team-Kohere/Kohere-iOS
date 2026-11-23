//
//  AppTab.swift
//  Kohere
//
//  Created by Codex on 6/18/26.
//

import KohereDesignSystem
import SwiftUI

enum AppTab: Hashable {
    case home
    case map
    case chat
    case more

    var icon: ImageResource {
        switch self {
        case .home:
            .homeFill24
        case .map:
            .locationFill24
        case .chat:
            .messageFill24
        case .more:
            .circleMoreFill24
        }
    }

    var accessibilityLabel: String {
        switch self {
        case .home:
            "홈"
        case .map:
            "지도"
        case .chat:
            "채팅"
        case .more:
            "더보기"
        }
    }
}
