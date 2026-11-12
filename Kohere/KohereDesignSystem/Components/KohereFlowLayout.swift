//
//  KohereFlowLayout.swift
//  Kohere
//
//  Created by Codex on 6/26/26.
//

import SwiftUI

/// 자식 뷰를 가로로 채우다가 넘치면 다음 줄로 넘겨 배치한다. 필터 칩, 옵션 태그처럼 개수가 바뀌는 칩 목록에 쓴다.
public struct KohereFlowLayout: Layout {
    public var spacing: CGFloat
    public var rowSpacing: CGFloat

    public init(spacing: CGFloat, rowSpacing: CGFloat) {
        self.spacing = spacing
        self.rowSpacing = rowSpacing
    }

    public func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout Void) -> CGSize {
        let containerWidth = proposal.width ?? 0
        var currentX: CGFloat = 0
        var currentRowHeight: CGFloat = 0
        var totalHeight: CGFloat = 0

        for subview in subviews {
            let size = subview.sizeThatFits(.unspecified)
            let nextX = currentX + (currentX > 0 ? spacing : 0) + size.width

            if currentX > 0, nextX > containerWidth {
                totalHeight += currentRowHeight + rowSpacing
                currentX = size.width
                currentRowHeight = size.height
            } else {
                currentX = nextX
                currentRowHeight = max(currentRowHeight, size.height)
            }
        }
        return CGSize(width: containerWidth, height: totalHeight + currentRowHeight)
    }

    public func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout Void) {
        var currentX = bounds.minX
        var currentY = bounds.minY
        var currentRowHeight: CGFloat = 0

        for subview in subviews {
            let size = subview.sizeThatFits(.unspecified)
            if currentX > bounds.minX, currentX + size.width > bounds.maxX {
                currentX = bounds.minX
                currentY += currentRowHeight + rowSpacing
                currentRowHeight = 0
            }
            subview.place(at: CGPoint(x: currentX, y: currentY), proposal: ProposedViewSize(size))
            currentX += size.width + spacing
            currentRowHeight = max(currentRowHeight, size.height)
        }
    }
}
