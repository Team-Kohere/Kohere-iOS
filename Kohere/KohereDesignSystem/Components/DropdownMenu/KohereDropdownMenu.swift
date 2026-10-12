//
//  KohereDropdownMenu.swift
//  Kohere
//
//  Created by Codex on 6/27/26.
//

import SwiftUI

/// 드롭다운에 들어가는 선택지. 표시 문구는 선택지 쪽이 locale에 맞게 만든다.
public protocol KohereDropdownMenuOption: Identifiable, Equatable {
    func localizedTitle(locale: Locale) -> String
}

public struct KohereDropdownMenu<Field: Hashable, Option: KohereDropdownMenuOption>: View {
    @Environment(\.locale)
    private var locale

    // MARK: - Properties

    @Binding var selectedOption: Option?
    @Binding var activeField: Field?

    let equals: Field
    let options: [Option]
    let listHeight: CGFloat
    var backgroundColor: Color = .backgroundNormalNormal
    var onExpand: (() -> Void)?

    public init(
        selectedOption: Binding<Option?>,
        activeField: Binding<Field?>,
        equals: Field,
        options: [Option],
        listHeight: CGFloat,
        backgroundColor: Color = .backgroundNormalNormal,
        onExpand: (() -> Void)? = nil
    ) {
        self._selectedOption = selectedOption
        self._activeField = activeField
        self.equals = equals
        self.options = options
        self.listHeight = listHeight
        self.backgroundColor = backgroundColor
        self.onExpand = onExpand
    }

    private var isOptionsPresented: Bool {
        activeField == equals
    }

    // MARK: - Body

    public var body: some View {
        Button {
            withAnimation(.easeInOut(duration: 0.2)) {
                if isOptionsPresented {
                    activeField = nil
                } else {
                    onExpand?()
                    activeField = equals
                }
            }
        } label: {
            HStack {
                Text(
                    selectedOption?.localizedTitle(locale: locale)
                        ?? LocalizedStringResource.commonSelect.resolved(in: locale)
                )
                    .kohereTextStyle(.label2Medium)
                    .foregroundColor(
                        selectedOption == nil
                        ? .labelAssistive
                        : .labelNeutral
                    )

                Spacer()

                Image(isOptionsPresented ? .chevronUp16 : .chevronDown16)
                    .renderingMode(.template)
                    .foregroundColor(.coolNeutral20)
            }
        }
        .padding(.horizontal, 16)
        .frame(height: 40)
        .background(backgroundColor)
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .overlay {
            RoundedRectangle(cornerRadius: 12)
                .stroke(
                    isOptionsPresented
                    ? .labelNormal
                    : .lineAlternative,
                    lineWidth: 1
                )
        }
        .overlay(alignment: .top) {
            if isOptionsPresented {
                KohereDropdownMenuList(
                    options: options,
                    listHeight: listHeight
                ) { option in
                    selectedOption = option
                    activeField = nil
                }
                .offset(y: 46)
                .zIndex(999)
            }
        }
    }
}
