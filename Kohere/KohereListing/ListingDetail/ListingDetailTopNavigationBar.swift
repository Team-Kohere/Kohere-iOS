//
//  ListingDetailTopNavigationBar.swift
//  Kohere
//
//  Created by Codex on 6/30/26.
//

import KohereDesignSystem
import KohereLocalization
import SwiftUI

struct ListingDetailTopNavigationBar: View {
    let progress: CGFloat
    let height: CGFloat
    let onBackTap: () -> Void

    var body: some View {
        HStack {
            chromeButton(
                image: .chevronLeft24,
                accessibilityLabel: String(localized: .commonAccessibilityBack),
                action: onBackTap
            )

            Spacer()
        }
        .padding(.horizontal, 10)
        .padding(.top, 56)
        .frame(maxWidth: .infinity)
        .frame(height: height, alignment: .bottom)
        .background(.common0.opacity(progress))
    }

    private func chromeButton(
        image: ImageResource,
        accessibilityLabel: String,
        action: @escaping () -> Void
    ) -> some View {
        Button(action: action) {
            ZStack {
                Image(image)
                    .renderingMode(.template)
                    .resizable()
                    .frame(width: 24, height: 24)
                    .foregroundStyle(.common0)
                    .opacity(1 - progress)

                Image(image)
                    .renderingMode(.template)
                    .resizable()
                    .frame(width: 24, height: 24)
                    .foregroundStyle(.labelAlternative)
                    .opacity(progress)
            }
            .frame(width: 44, height: 44)
        }
        .buttonStyle(.plain)
        .accessibilityLabel(Text(accessibilityLabel))
    }
}
