//
//  PlaceholderTabView.swift
//  Kohere
//
//  Created by Codex on 6/18/26.
//

import SwiftUI

public struct PlaceholderTabView: View {
    let title: String

    public init(title: String) {
        self.title = title
    }

    public var body: some View {
        ZStack {
            Color.backgroundNormalAlternative
                .ignoresSafeArea()

            Text(title)
                .kohereTextStyle(.heading1Bold)
                .foregroundStyle(.labelNormal)
        }
    }
}
