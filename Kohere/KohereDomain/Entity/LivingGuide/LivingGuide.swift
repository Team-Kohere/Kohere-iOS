//
//  LivingGuide.swift
//  Kohere
//
//  Created by soomin on 6/25/26.
//

public struct LivingGuide: Equatable, Identifiable, Sendable {
    public let id: Int
    public let code: String
    public let title: String
    public let shortDescription: String
    public let longDescription: String
    public let iconName: String
    public let theme: LivingGuideTheme
    public var tips: [LivingGuideTip]

    public init(
        id: Int,
        code: String,
        title: String,
        shortDescription: String,
        longDescription: String,
        iconName: String,
        theme: LivingGuideTheme,
        tips: [LivingGuideTip]
    ) {
        self.id = id
        self.code = code
        self.title = title
        self.shortDescription = shortDescription
        self.longDescription = longDescription
        self.iconName = iconName
        self.theme = theme
        self.tips = tips
    }
}

public struct LivingGuideTip: Equatable, Identifiable, Sendable {
    public let id: String
    public let title: String
    public let content: String
    public let imageURL: String?

    public init(
        id: String,
        title: String,
        content: String,
        imageURL: String?
    ) {
        self.id = id
        self.title = title
        self.content = content
        self.imageURL = imageURL
    }
}

public enum LivingGuideTheme: Equatable, Sendable {
    case housingScams
    case bankAccount
    case publicTransit
    case healthInsurance
}

extension LivingGuide {
    public init(
        id: Int,
        code: String,
        name: String,
        shortDescription: String,
        longDescription: String,
        iconName: String,
        theme: LivingGuideTheme,
        tips: [LivingGuideTip] = []
    ) {
        self.id = id
        self.code = code
        self.title = name
        self.shortDescription = shortDescription
        self.longDescription = longDescription
        self.iconName = iconName
        self.theme = theme
        self.tips = tips
    }
}
