//
//  ChatFlowView.swift
//  Kohere
//
//  Created by soomin on 6/18/26.
//

import ComposableArchitecture
import KohereChatBot
import KohereListing
import SwiftUI

public struct ChatFlowView: View {
    
    // MARK: - Property
    
    @Bindable private var store: StoreOf<ChatFeature>
    
    // MARK: - Body

    public init(store: StoreOf<ChatFeature>) {
        self.store = store
    }

    public var body: some View {
        NavigationStack(path: $store.scope(state: \ChatFeature.State.path, action: \.path)) {
            ChatView(store: store)
        } destination: { store in
            switch store.case {
            case let .chatDetail(detailStore):
                ChatDetailView(store: detailStore)
                    .navigationBarHidden(true)

            case let .chatBot(chatBotStore):
                ChatBotView(store: chatBotStore)
                    .navigationBarHidden(true)

            case let .listingDetail(listingDetailStore):
                ListingDetailView(store: listingDetailStore)
                    .navigationBarHidden(true)

            case let .listingApplication(listingApplicationStore):
                ListingApplicationView(store: listingApplicationStore)
                    .navigationBarHidden(true)

            case let .listingApplicationPrivacyWeb(privacyWebStore):
                ListingApplicationPrivacyWebView(store: privacyWebStore)
                    .navigationBarHidden(true)

            case let .report(reportStore):
                ChatReportView(store: reportStore)
                    .navigationBarHidden(true)
            }
        }
        .toolbar(store.path.isEmpty ? .visible : .hidden, for: .tabBar)
    }
}
