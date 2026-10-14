//
//  KohereEmptyView.swift
//  Kohere
//
//  Created by soomin on 6/24/26.
//

import SwiftUI

public struct KohereEmptyView: View {
    
    // MARK: - Property
    
    let title: String
    var fontStyle: KohereTextStyle = .body2Regular
    var fontColor: Color = .labelNeutral

    // MARK: - Init

    public init(
        title: String,
        fontStyle: KohereTextStyle = .body2Regular,
        fontColor: Color = .labelNeutral
    ) {
        self.title = title
        self.fontStyle = fontStyle
        self.fontColor = fontColor
    }
    
    // MARK: - Body
    
    public var body: some View {
        VStack(alignment: .center, spacing: 12) {
            Image(.typoLogo)
                .resizable()
                .frame(width: 107, height: 28)
                .opacity(0.5)
            
            Text(title)
                .kohereTextStyle(fontStyle)
                .foregroundColor(fontColor)
                .multilineTextAlignment(.center)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}
