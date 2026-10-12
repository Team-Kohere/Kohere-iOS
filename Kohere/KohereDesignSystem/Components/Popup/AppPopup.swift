//
//  AppPopup.swift
//  Kohere
//
//  Created by soomin on 7/8/26.
//

import KohereCore

public enum AppPopup: Equatable {
    case notice(Notice)
    case action(Action)

    public struct Notice: Equatable {
        public let message: String
        public let confirmTitle: String
        public var confirmRoute: Route?
        public var confirmStyle: ConfirmStyle = .neutral

        public init(
            message: String,
            confirmTitle: String,
            confirmRoute: Route? = nil,
            confirmStyle: ConfirmStyle = .neutral
        ) {
            self.message = message
            self.confirmTitle = confirmTitle
            self.confirmRoute = confirmRoute
            self.confirmStyle = confirmStyle
        }
    }

    public enum ConfirmStyle: Equatable {
        case neutral, primary
    }

    public struct Action: Equatable {
        public let message: String
        public let primaryTitle: String
        public let secondaryTitle: String
        public var primaryRoute: Route?
        public var secondaryRoute: Route?

        public init(
            message: String,
            primaryTitle: String,
            secondaryTitle: String,
            primaryRoute: Route? = nil,
            secondaryRoute: Route? = nil
        ) {
            self.message = message
            self.primaryTitle = primaryTitle
            self.secondaryTitle = secondaryTitle
            self.primaryRoute = primaryRoute
            self.secondaryRoute = secondaryRoute
        }

        public init(
            message: String,
            primaryTitle: String,
            secondaryTitle: String,
            route: Route
        ) {
            self.init(
                message: message,
                primaryTitle: primaryTitle,
                secondaryTitle: secondaryTitle,
                primaryRoute: route
            )
        }
    }

    public enum Route: Equatable {
        case signIn
        case home
        case logout
        case deleteAccount
        case reportBooking(Int)
        case blockBooking(Int)
        case deleteBooking(Int)
        case dismissListingDetail
        case confirmLanguageChange(AppLanguage)
        case dismissNotificationSettings
        case openNotificationSettings
    }
}
