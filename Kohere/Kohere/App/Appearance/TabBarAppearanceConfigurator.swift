//
//  TabBarAppearanceConfigurator.swift
//  Kohere
//
//  Created by Codex on 6/26/26.
//

import KohereDesignSystem
import UIKit

enum TabBarAppearanceConfigurator {
    static func configure() {
        let selectedColor = UIColor.primary50
        let normalColor = UIColor.coolNeutral50
        let backgroundColor = UIColor.backgroundNormalNormal

        let appearance = UITabBarAppearance()

        if #available(iOS 26.0, *) {
            appearance.configureWithTransparentBackground()
            appearance.backgroundColor = .clear
            appearance.backgroundEffect = nil
        } else {
            appearance.configureWithDefaultBackground()
            appearance.backgroundColor = backgroundColor
        }
        appearance.shadowColor = .clear

        configureItemAppearance(
            appearance.stackedLayoutAppearance,
            selectedColor: selectedColor,
            normalColor: normalColor
        )
        configureItemAppearance(
            appearance.inlineLayoutAppearance,
            selectedColor: selectedColor,
            normalColor: normalColor
        )
        configureItemAppearance(
            appearance.compactInlineLayoutAppearance,
            selectedColor: selectedColor,
            normalColor: normalColor
        )

        let tabBar = UITabBar.appearance()
        tabBar.tintColor = selectedColor
        tabBar.unselectedItemTintColor = normalColor
        tabBar.isTranslucent = true
        tabBar.standardAppearance = appearance
        tabBar.scrollEdgeAppearance = appearance
    }

    private static func configureItemAppearance(
        _ appearance: UITabBarItemAppearance,
        selectedColor: UIColor,
        normalColor: UIColor
    ) {
        appearance.selected.iconColor = selectedColor
        appearance.normal.iconColor = normalColor
    }

}
