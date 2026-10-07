//
//  CommunityView.swift
//  Kohere
//
//  Created by Codex on 6/18/26.
//

import ComposableArchitecture
import KohereCore
import KohereLocalization
import SwiftUI

struct CommunityView: View {
    let store: StoreOf<CommunityFeature>
    @Environment(\.locale)
    private var locale

    var body: some View {
        PlaceholderTabView(title: AppLanguage(locale: locale).localized(.tabCommunity))
    }
}
