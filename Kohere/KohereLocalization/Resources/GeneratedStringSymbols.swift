// 이 파일은 scripts/generate_asset_symbols.py가 만든다. 직접 수정하지 않는다.

import Foundation

private final class ResourceBundleToken {}
private let resourceBundleDescription = LocalizedStringResource.BundleDescription.forClass(ResourceBundleToken.self)

/// 문자열 카탈로그가 들어 있는 번들. 키를 문자열로만 아는 경우에 쓴다.
public enum KohereLocalizationBundle {
    public static let value = Bundle(for: ResourceBundleToken.self)
}

extension LocalizedStringResource {
    /// Localized string for key "account.dateOfBirth.title" in table "Localizable.xcstrings".
    nonisolated public static var accountDateOfBirthTitle: LocalizedStringResource {
        LocalizedStringResource("account.dateOfBirth.title", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "account.deleteAccount.title" in table "Localizable.xcstrings".
    nonisolated public static var accountDeleteAccountTitle: LocalizedStringResource {
        LocalizedStringResource("account.deleteAccount.title", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "account.gender.female" in table "Localizable.xcstrings".
    nonisolated public static var accountGenderFemale: LocalizedStringResource {
        LocalizedStringResource("account.gender.female", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "account.gender.male" in table "Localizable.xcstrings".
    nonisolated public static var accountGenderMale: LocalizedStringResource {
        LocalizedStringResource("account.gender.male", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "account.gender.title" in table "Localizable.xcstrings".
    nonisolated public static var accountGenderTitle: LocalizedStringResource {
        LocalizedStringResource("account.gender.title", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "account.linkedEmail.title" in table "Localizable.xcstrings".
    nonisolated public static var accountLinkedEmailTitle: LocalizedStringResource {
        LocalizedStringResource("account.linkedEmail.title", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "announcements.empty.title" in table "Localizable.xcstrings".
    nonisolated public static var announcementsEmptyTitle: LocalizedStringResource {
        LocalizedStringResource("announcements.empty.title", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "authGate.message" in table "Localizable.xcstrings".
    nonisolated public static var authGateMessage: LocalizedStringResource {
        LocalizedStringResource("authGate.message", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "authGate.notNow" in table "Localizable.xcstrings".
    nonisolated public static var authGateNotNow: LocalizedStringResource {
        LocalizedStringResource("authGate.notNow", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "authGate.signIn" in table "Localizable.xcstrings".
    nonisolated public static var authGateSignIn: LocalizedStringResource {
        LocalizedStringResource("authGate.signIn", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "chat.action.block" in table "Localizable.xcstrings".
    nonisolated public static var chatActionBlock: LocalizedStringResource {
        LocalizedStringResource("chat.action.block", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "chat.action.delete" in table "Localizable.xcstrings".
    nonisolated public static var chatActionDelete: LocalizedStringResource {
        LocalizedStringResource("chat.action.delete", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "chat.action.report" in table "Localizable.xcstrings".
    nonisolated public static var chatActionReport: LocalizedStringResource {
        LocalizedStringResource("chat.action.report", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "chat.applicationCard.accessibility.copyEmail" in table "Localizable.xcstrings".
    nonisolated public static var chatApplicationCardAccessibilityCopyEmail: LocalizedStringResource {
        LocalizedStringResource("chat.applicationCard.accessibility.copyEmail", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "chat.applicationCard.accessibility.emailCopied" in table "Localizable.xcstrings".
    nonisolated public static var chatApplicationCardAccessibilityEmailCopied: LocalizedStringResource {
        LocalizedStringResource("chat.applicationCard.accessibility.emailCopied", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "chat.applicationCard.field.applicant" in table "Localizable.xcstrings".
    nonisolated public static var chatApplicationCardFieldApplicant: LocalizedStringResource {
        LocalizedStringResource("chat.applicationCard.field.applicant", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "chat.applicationCard.field.deposit" in table "Localizable.xcstrings".
    nonisolated public static var chatApplicationCardFieldDeposit: LocalizedStringResource {
        LocalizedStringResource("chat.applicationCard.field.deposit", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "chat.applicationCard.field.email" in table "Localizable.xcstrings".
    nonisolated public static var chatApplicationCardFieldEmail: LocalizedStringResource {
        LocalizedStringResource("chat.applicationCard.field.email", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "chat.applicationCard.field.gender" in table "Localizable.xcstrings".
    nonisolated public static var chatApplicationCardFieldGender: LocalizedStringResource {
        LocalizedStringResource("chat.applicationCard.field.gender", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "chat.applicationCard.field.leaseTerm" in table "Localizable.xcstrings".
    nonisolated public static var chatApplicationCardFieldLeaseTerm: LocalizedStringResource {
        LocalizedStringResource("chat.applicationCard.field.leaseTerm", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "chat.applicationCard.field.moveInDate" in table "Localizable.xcstrings".
    nonisolated public static var chatApplicationCardFieldMoveInDate: LocalizedStringResource {
        LocalizedStringResource("chat.applicationCard.field.moveInDate", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "chat.applicationCard.field.nationality" in table "Localizable.xcstrings".
    nonisolated public static var chatApplicationCardFieldNationality: LocalizedStringResource {
        LocalizedStringResource("chat.applicationCard.field.nationality", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "chat.applicationCard.field.roomType" in table "Localizable.xcstrings".
    nonisolated public static var chatApplicationCardFieldRoomType: LocalizedStringResource {
        LocalizedStringResource("chat.applicationCard.field.roomType", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "chat.applicationCard.field.totalCost" in table "Localizable.xcstrings".
    nonisolated public static var chatApplicationCardFieldTotalCost: LocalizedStringResource {
        LocalizedStringResource("chat.applicationCard.field.totalCost", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "chat.applicationCard.value.gender.female" in table "Localizable.xcstrings".
    nonisolated public static var chatApplicationCardValueGenderFemale: LocalizedStringResource {
        LocalizedStringResource("chat.applicationCard.value.gender.female", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "chat.applicationCard.value.gender.male" in table "Localizable.xcstrings".
    nonisolated public static var chatApplicationCardValueGenderMale: LocalizedStringResource {
        LocalizedStringResource("chat.applicationCard.value.gender.male", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "chat.applicationCard.value.leaseTerm" in table "Localizable.xcstrings".
    nonisolated public static func chatApplicationCardValueLeaseTerm(_ arg1: Int32) -> LocalizedStringResource {
        LocalizedStringResource("chat.applicationCard.value.leaseTerm", defaultValue: "\(arg1, specifier: "%d")-month", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "chat.applicationCard.value.monthlyPrice" in table "Localizable.xcstrings".
    nonisolated public static func chatApplicationCardValueMonthlyPrice(_ arg1: String) -> LocalizedStringResource {
        LocalizedStringResource("chat.applicationCard.value.monthlyPrice", defaultValue: "\(arg1)/mo", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "chat.applicationCard.value.notAvailable" in table "Localizable.xcstrings".
    nonisolated public static var chatApplicationCardValueNotAvailable: LocalizedStringResource {
        LocalizedStringResource("chat.applicationCard.value.notAvailable", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "chat.applicationReceived.message" in table "Localizable.xcstrings".
    nonisolated public static var chatApplicationReceivedMessage: LocalizedStringResource {
        LocalizedStringResource("chat.applicationReceived.message", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "chat.applicationReceived.title" in table "Localizable.xcstrings".
    nonisolated public static var chatApplicationReceivedTitle: LocalizedStringResource {
        LocalizedStringResource("chat.applicationReceived.title", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "chat.applicationSent.message" in table "Localizable.xcstrings".
    nonisolated public static var chatApplicationSentMessage: LocalizedStringResource {
        LocalizedStringResource("chat.applicationSent.message", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "chat.applicationSent.title" in table "Localizable.xcstrings".
    nonisolated public static var chatApplicationSentTitle: LocalizedStringResource {
        LocalizedStringResource("chat.applicationSent.title", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "chat.detail.applicationBanner" in table "Localizable.xcstrings".
    nonisolated public static var chatDetailApplicationBanner: LocalizedStringResource {
        LocalizedStringResource("chat.detail.applicationBanner", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "chat.detail.keyword.availability" in table "Localizable.xcstrings".
    nonisolated public static var chatDetailKeywordAvailability: LocalizedStringResource {
        LocalizedStringResource("chat.detail.keyword.availability", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "chat.detail.keyword.depositReturn" in table "Localizable.xcstrings".
    nonisolated public static var chatDetailKeywordDepositReturn: LocalizedStringResource {
        LocalizedStringResource("chat.detail.keyword.depositReturn", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "chat.detail.keyword.earlyTermination" in table "Localizable.xcstrings".
    nonisolated public static var chatDetailKeywordEarlyTermination: LocalizedStringResource {
        LocalizedStringResource("chat.detail.keyword.earlyTermination", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "chat.detail.keyword.payment" in table "Localizable.xcstrings".
    nonisolated public static var chatDetailKeywordPayment: LocalizedStringResource {
        LocalizedStringResource("chat.detail.keyword.payment", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "chat.detail.keyword.weeklyPrice" in table "Localizable.xcstrings".
    nonisolated public static var chatDetailKeywordWeeklyPrice: LocalizedStringResource {
        LocalizedStringResource("chat.detail.keyword.weeklyPrice", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "chat.detail.messagePlaceholder" in table "Localizable.xcstrings".
    nonisolated public static var chatDetailMessagePlaceholder: LocalizedStringResource {
        LocalizedStringResource("chat.detail.messagePlaceholder", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "chat.detail.viewDetails" in table "Localizable.xcstrings".
    nonisolated public static var chatDetailViewDetails: LocalizedStringResource {
        LocalizedStringResource("chat.detail.viewDetails", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "chat.empty.title" in table "Localizable.xcstrings".
    nonisolated public static var chatEmptyTitle: LocalizedStringResource {
        LocalizedStringResource("chat.empty.title", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "chat.failedMessage.action.delete" in table "Localizable.xcstrings".
    nonisolated public static var chatFailedMessageActionDelete: LocalizedStringResource {
        LocalizedStringResource("chat.failedMessage.action.delete", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "chat.failedMessage.action.resend" in table "Localizable.xcstrings".
    nonisolated public static var chatFailedMessageActionResend: LocalizedStringResource {
        LocalizedStringResource("chat.failedMessage.action.resend", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "chat.failedMessage.dialog.title" in table "Localizable.xcstrings".
    nonisolated public static var chatFailedMessageDialogTitle: LocalizedStringResource {
        LocalizedStringResource("chat.failedMessage.dialog.title", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "chat.inquiryCard.preview.received" in table "Localizable.xcstrings".
    nonisolated public static var chatInquiryCardPreviewReceived: LocalizedStringResource {
        LocalizedStringResource("chat.inquiryCard.preview.received", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "chat.inquiryCard.preview.sent" in table "Localizable.xcstrings".
    nonisolated public static var chatInquiryCardPreviewSent: LocalizedStringResource {
        LocalizedStringResource("chat.inquiryCard.preview.sent", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "chat.inquiryCard.unavailable" in table "Localizable.xcstrings".
    nonisolated public static var chatInquiryCardUnavailable: LocalizedStringResource {
        LocalizedStringResource("chat.inquiryCard.unavailable", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "chat.inquiryReceived.message" in table "Localizable.xcstrings".
    nonisolated public static var chatInquiryReceivedMessage: LocalizedStringResource {
        LocalizedStringResource("chat.inquiryReceived.message", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "chat.inquiryReceived.title" in table "Localizable.xcstrings".
    nonisolated public static var chatInquiryReceivedTitle: LocalizedStringResource {
        LocalizedStringResource("chat.inquiryReceived.title", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "chat.popup.action.failure" in table "Localizable.xcstrings".
    nonisolated public static var chatPopupActionFailure: LocalizedStringResource {
        LocalizedStringResource("chat.popup.action.failure", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "chat.popup.block.message" in table "Localizable.xcstrings".
    nonisolated public static var chatPopupBlockMessage: LocalizedStringResource {
        LocalizedStringResource("chat.popup.block.message", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "chat.popup.block.primary" in table "Localizable.xcstrings".
    nonisolated public static var chatPopupBlockPrimary: LocalizedStringResource {
        LocalizedStringResource("chat.popup.block.primary", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "chat.popup.block.success" in table "Localizable.xcstrings".
    nonisolated public static var chatPopupBlockSuccess: LocalizedStringResource {
        LocalizedStringResource("chat.popup.block.success", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "chat.popup.delete.message" in table "Localizable.xcstrings".
    nonisolated public static var chatPopupDeleteMessage: LocalizedStringResource {
        LocalizedStringResource("chat.popup.delete.message", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "chat.popup.delete.primary" in table "Localizable.xcstrings".
    nonisolated public static var chatPopupDeletePrimary: LocalizedStringResource {
        LocalizedStringResource("chat.popup.delete.primary", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "chat.popup.delete.success" in table "Localizable.xcstrings".
    nonisolated public static var chatPopupDeleteSuccess: LocalizedStringResource {
        LocalizedStringResource("chat.popup.delete.success", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "chat.popup.report.message" in table "Localizable.xcstrings".
    nonisolated public static var chatPopupReportMessage: LocalizedStringResource {
        LocalizedStringResource("chat.popup.report.message", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "chat.popup.report.primary" in table "Localizable.xcstrings".
    nonisolated public static var chatPopupReportPrimary: LocalizedStringResource {
        LocalizedStringResource("chat.popup.report.primary", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "chat.popup.report.success" in table "Localizable.xcstrings".
    nonisolated public static var chatPopupReportSuccess: LocalizedStringResource {
        LocalizedStringResource("chat.popup.report.success", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "chat.report.action" in table "Localizable.xcstrings".
    nonisolated public static var chatReportAction: LocalizedStringResource {
        LocalizedStringResource("chat.report.action", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "chat.report.privacy-notice" in table "Localizable.xcstrings".
    nonisolated public static var chatReportPrivacyNotice: LocalizedStringResource {
        LocalizedStringResource("chat.report.privacy-notice", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "chat.report.reason.abuse" in table "Localizable.xcstrings".
    nonisolated public static var chatReportReasonAbuse: LocalizedStringResource {
        LocalizedStringResource("chat.report.reason.abuse", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "chat.report.reason.illegal-information" in table "Localizable.xcstrings".
    nonisolated public static var chatReportReasonIllegalInformation: LocalizedStringResource {
        LocalizedStringResource("chat.report.reason.illegal-information", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "chat.report.reason.other" in table "Localizable.xcstrings".
    nonisolated public static var chatReportReasonOther: LocalizedStringResource {
        LocalizedStringResource("chat.report.reason.other", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "chat.report.reason.personal-information" in table "Localizable.xcstrings".
    nonisolated public static var chatReportReasonPersonalInformation: LocalizedStringResource {
        LocalizedStringResource("chat.report.reason.personal-information", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "chat.report.reason.sexual-content" in table "Localizable.xcstrings".
    nonisolated public static var chatReportReasonSexualContent: LocalizedStringResource {
        LocalizedStringResource("chat.report.reason.sexual-content", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "chat.report.reason.spam" in table "Localizable.xcstrings".
    nonisolated public static var chatReportReasonSpam: LocalizedStringResource {
        LocalizedStringResource("chat.report.reason.spam", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "chat.report.title" in table "Localizable.xcstrings".
    nonisolated public static var chatReportTitle: LocalizedStringResource {
        LocalizedStringResource("chat.report.title", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "chat.title" in table "Localizable.xcstrings".
    nonisolated public static var chatTitle: LocalizedStringResource {
        LocalizedStringResource("chat.title", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "chatBot.action.find" in table "Localizable.xcstrings".
    nonisolated public static var chatBotActionFind: LocalizedStringResource {
        LocalizedStringResource("chatBot.action.find", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "chatBot.budget.any" in table "Localizable.xcstrings".
    nonisolated public static var chatBotBudgetAny: LocalizedStringResource {
        LocalizedStringResource("chatBot.budget.any", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "chatBot.budget.range" in table "Localizable.xcstrings".
    nonisolated public static func chatBotBudgetRange(_ arg1: String, _ arg2: String) -> LocalizedStringResource {
        LocalizedStringResource("chatBot.budget.range", defaultValue: "\(arg1) ~ \(arg2)", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "chatBot.budget.sliderMaximum" in table "Localizable.xcstrings".
    nonisolated public static var chatBotBudgetSliderMaximum: LocalizedStringResource {
        LocalizedStringResource("chatBot.budget.sliderMaximum", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "chatBot.budget.sliderMidpoint" in table "Localizable.xcstrings".
    nonisolated public static var chatBotBudgetSliderMidpoint: LocalizedStringResource {
        LocalizedStringResource("chatBot.budget.sliderMidpoint", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "chatBot.budget.under" in table "Localizable.xcstrings".
    nonisolated public static func chatBotBudgetUnder(_ arg1: String) -> LocalizedStringResource {
        LocalizedStringResource("chatBot.budget.under", defaultValue: "Under \(arg1)", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "chatBot.budget.upperOnly" in table "Localizable.xcstrings".
    nonisolated public static func chatBotBudgetUpperOnly(_ arg1: String) -> LocalizedStringResource {
        LocalizedStringResource("chatBot.budget.upperOnly", defaultValue: "\(arg1)+", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "chatBot.title" in table "Localizable.xcstrings".
    nonisolated public static var chatBotTitle: LocalizedStringResource {
        LocalizedStringResource("chatBot.title", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "common.accessibility.back" in table "Localizable.xcstrings".
    nonisolated public static var commonAccessibilityBack: LocalizedStringResource {
        LocalizedStringResource("common.accessibility.back", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "common.accessibility.changeLanguage" in table "Localizable.xcstrings".
    nonisolated public static var commonAccessibilityChangeLanguage: LocalizedStringResource {
        LocalizedStringResource("common.accessibility.changeLanguage", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "common.accessibility.search" in table "Localizable.xcstrings".
    nonisolated public static var commonAccessibilitySearch: LocalizedStringResource {
        LocalizedStringResource("common.accessibility.search", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "common.agree" in table "Localizable.xcstrings".
    nonisolated public static var commonAgree: LocalizedStringResource {
        LocalizedStringResource("common.agree", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "common.apply" in table "Localizable.xcstrings".
    nonisolated public static var commonApply: LocalizedStringResource {
        LocalizedStringResource("common.apply", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "common.browseListings" in table "Localizable.xcstrings".
    nonisolated public static var commonBrowseListings: LocalizedStringResource {
        LocalizedStringResource("common.browseListings", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "common.cancel" in table "Localizable.xcstrings".
    nonisolated public static var commonCancel: LocalizedStringResource {
        LocalizedStringResource("common.cancel", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "common.close" in table "Localizable.xcstrings".
    nonisolated public static var commonClose: LocalizedStringResource {
        LocalizedStringResource("common.close", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "common.confirm" in table "Localizable.xcstrings".
    nonisolated public static var commonConfirm: LocalizedStringResource {
        LocalizedStringResource("common.confirm", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "common.loading" in table "Localizable.xcstrings".
    nonisolated public static var commonLoading: LocalizedStringResource {
        LocalizedStringResource("common.loading", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "common.next" in table "Localizable.xcstrings".
    nonisolated public static var commonNext: LocalizedStringResource {
        LocalizedStringResource("common.next", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "common.reset" in table "Localizable.xcstrings".
    nonisolated public static var commonReset: LocalizedStringResource {
        LocalizedStringResource("common.reset", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "common.roomFinderBanner.accessibility" in table "Localizable.xcstrings".
    nonisolated public static var commonRoomFinderBannerAccessibility: LocalizedStringResource {
        LocalizedStringResource("common.roomFinderBanner.accessibility", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "common.roomFinderBanner.title" in table "Localizable.xcstrings".
    nonisolated public static var commonRoomFinderBannerTitle: LocalizedStringResource {
        LocalizedStringResource("common.roomFinderBanner.title", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "common.seeAll" in table "Localizable.xcstrings".
    nonisolated public static var commonSeeAll: LocalizedStringResource {
        LocalizedStringResource("common.seeAll", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "common.select" in table "Localizable.xcstrings".
    nonisolated public static var commonSelect: LocalizedStringResource {
        LocalizedStringResource("common.select", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "common.skip" in table "Localizable.xcstrings".
    nonisolated public static var commonSkip: LocalizedStringResource {
        LocalizedStringResource("common.skip", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "common.start" in table "Localizable.xcstrings".
    nonisolated public static var commonStart: LocalizedStringResource {
        LocalizedStringResource("common.start", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "home.livingGuide.bankAccount.title" in table "Localizable.xcstrings".
    nonisolated public static var homeLivingGuideBankAccountTitle: LocalizedStringResource {
        LocalizedStringResource("home.livingGuide.bankAccount.title", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "home.livingGuide.fraud.title" in table "Localizable.xcstrings".
    nonisolated public static var homeLivingGuideFraudTitle: LocalizedStringResource {
        LocalizedStringResource("home.livingGuide.fraud.title", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "home.livingGuide.healthInsurance.title" in table "Localizable.xcstrings".
    nonisolated public static var homeLivingGuideHealthInsuranceTitle: LocalizedStringResource {
        LocalizedStringResource("home.livingGuide.healthInsurance.title", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "home.livingGuide.title" in table "Localizable.xcstrings".
    nonisolated public static var homeLivingGuideTitle: LocalizedStringResource {
        LocalizedStringResource("home.livingGuide.title", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "home.livingGuide.transportation.title" in table "Localizable.xcstrings".
    nonisolated public static var homeLivingGuideTransportationTitle: LocalizedStringResource {
        LocalizedStringResource("home.livingGuide.transportation.title", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "home.quiz.title" in table "Localizable.xcstrings".
    nonisolated public static var homeQuizTitle: LocalizedStringResource {
        LocalizedStringResource("home.quiz.title", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "home.recentListings.empty.message" in table "Localizable.xcstrings".
    nonisolated public static var homeRecentListingsEmptyMessage: LocalizedStringResource {
        LocalizedStringResource("home.recentListings.empty.message", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "home.recentListings.title" in table "Localizable.xcstrings".
    nonisolated public static var homeRecentListingsTitle: LocalizedStringResource {
        LocalizedStringResource("home.recentListings.title", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "home.roomFinder.button" in table "Localizable.xcstrings".
    nonisolated public static var homeRoomFinderButton: LocalizedStringResource {
        LocalizedStringResource("home.roomFinder.button", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "home.roomFinder.subtitle" in table "Localizable.xcstrings".
    nonisolated public static var homeRoomFinderSubtitle: LocalizedStringResource {
        LocalizedStringResource("home.roomFinder.subtitle", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "language.change.cancel" in table "Localizable.xcstrings".
    nonisolated public static var languageChangeCancel: LocalizedStringResource {
        LocalizedStringResource("language.change.cancel", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "language.change.confirm" in table "Localizable.xcstrings".
    nonisolated public static var languageChangeConfirm: LocalizedStringResource {
        LocalizedStringResource("language.change.confirm", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "language.change.failure" in table "Localizable.xcstrings".
    nonisolated public static var languageChangeFailure: LocalizedStringResource {
        LocalizedStringResource("language.change.failure", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "language.change.resetNotice" in table "Localizable.xcstrings".
    nonisolated public static var languageChangeResetNotice: LocalizedStringResource {
        LocalizedStringResource("language.change.resetNotice", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "language.current" in table "Localizable.xcstrings".
    nonisolated public static var languageCurrent: LocalizedStringResource {
        LocalizedStringResource("language.current", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "listingApplication.action.apply" in table "Localizable.xcstrings".
    nonisolated public static var listingApplicationActionApply: LocalizedStringResource {
        LocalizedStringResource("listingApplication.action.apply", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "listingApplication.action.back" in table "Localizable.xcstrings".
    nonisolated public static var listingApplicationActionBack: LocalizedStringResource {
        LocalizedStringResource("listingApplication.action.back", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "listingApplication.action.close" in table "Localizable.xcstrings".
    nonisolated public static var listingApplicationActionClose: LocalizedStringResource {
        LocalizedStringResource("listingApplication.action.close", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "listingApplication.action.submit" in table "Localizable.xcstrings".
    nonisolated public static var listingApplicationActionSubmit: LocalizedStringResource {
        LocalizedStringResource("listingApplication.action.submit", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "listingApplication.action.view" in table "Localizable.xcstrings".
    nonisolated public static var listingApplicationActionView: LocalizedStringResource {
        LocalizedStringResource("listingApplication.action.view", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "listingApplication.applicant.gender.female" in table "Localizable.xcstrings".
    nonisolated public static var listingApplicationApplicantGenderFemale: LocalizedStringResource {
        LocalizedStringResource("listingApplication.applicant.gender.female", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "listingApplication.applicant.gender.male" in table "Localizable.xcstrings".
    nonisolated public static var listingApplicationApplicantGenderMale: LocalizedStringResource {
        LocalizedStringResource("listingApplication.applicant.gender.male", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "listingApplication.applicant.phone.placeholder" in table "Localizable.xcstrings".
    nonisolated public static var listingApplicationApplicantPhonePlaceholder: LocalizedStringResource {
        LocalizedStringResource("listingApplication.applicant.phone.placeholder", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "listingApplication.applicant.phone.required" in table "Localizable.xcstrings".
    nonisolated public static var listingApplicationApplicantPhoneRequired: LocalizedStringResource {
        LocalizedStringResource("listingApplication.applicant.phone.required", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "listingApplication.applicant.profile.loadFailed" in table "Localizable.xcstrings".
    nonisolated public static var listingApplicationApplicantProfileLoadFailed: LocalizedStringResource {
        LocalizedStringResource("listingApplication.applicant.profile.loadFailed", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "listingApplication.applicant.title" in table "Localizable.xcstrings".
    nonisolated public static var listingApplicationApplicantTitle: LocalizedStringResource {
        LocalizedStringResource("listingApplication.applicant.title", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "listingApplication.completion.message" in table "Localizable.xcstrings".
    nonisolated public static var listingApplicationCompletionMessage: LocalizedStringResource {
        LocalizedStringResource("listingApplication.completion.message", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "listingApplication.completion.summaryTitle" in table "Localizable.xcstrings".
    nonisolated public static var listingApplicationCompletionSummaryTitle: LocalizedStringResource {
        LocalizedStringResource("listingApplication.completion.summaryTitle", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "listingApplication.completion.title" in table "Localizable.xcstrings".
    nonisolated public static var listingApplicationCompletionTitle: LocalizedStringResource {
        LocalizedStringResource("listingApplication.completion.title", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "listingApplication.dateSelection.subtitle" in table "Localizable.xcstrings".
    nonisolated public static var listingApplicationDateSelectionSubtitle: LocalizedStringResource {
        LocalizedStringResource("listingApplication.dateSelection.subtitle", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "listingApplication.dateSelection.title" in table "Localizable.xcstrings".
    nonisolated public static var listingApplicationDateSelectionTitle: LocalizedStringResource {
        LocalizedStringResource("listingApplication.dateSelection.title", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "listingApplication.field.contractPeriod" in table "Localizable.xcstrings".
    nonisolated public static var listingApplicationFieldContractPeriod: LocalizedStringResource {
        LocalizedStringResource("listingApplication.field.contractPeriod", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "listingApplication.field.moveInDate" in table "Localizable.xcstrings".
    nonisolated public static var listingApplicationFieldMoveInDate: LocalizedStringResource {
        LocalizedStringResource("listingApplication.field.moveInDate", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "listingApplication.field.moveOutDate" in table "Localizable.xcstrings".
    nonisolated public static var listingApplicationFieldMoveOutDate: LocalizedStringResource {
        LocalizedStringResource("listingApplication.field.moveOutDate", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "listingApplication.format.applicationTitle" in table "Localizable.xcstrings".
    nonisolated public static func listingApplicationFormatApplicationTitle(_ arg1: String) -> LocalizedStringResource {
        LocalizedStringResource("listingApplication.format.applicationTitle", defaultValue: "\(arg1) Application", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "listingApplication.format.month" in table "Localizable.xcstrings".
    nonisolated public static func listingApplicationFormatMonth(_ arg1: String) -> LocalizedStringResource {
        LocalizedStringResource("listingApplication.format.month", defaultValue: "\(arg1)", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "listingApplication.format.rentalPeriod.one" in table "Localizable.xcstrings".
    nonisolated public static func listingApplicationFormatRentalPeriodOne(_ arg1: String) -> LocalizedStringResource {
        LocalizedStringResource("listingApplication.format.rentalPeriod.one", defaultValue: "\(arg1) month", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "listingApplication.format.rentalPeriod.other" in table "Localizable.xcstrings".
    nonisolated public static func listingApplicationFormatRentalPeriodOther(_ arg1: String) -> LocalizedStringResource {
        LocalizedStringResource("listingApplication.format.rentalPeriod.other", defaultValue: "\(arg1) months", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "listingApplication.format.year" in table "Localizable.xcstrings".
    nonisolated public static func listingApplicationFormatYear(_ arg1: String) -> LocalizedStringResource {
        LocalizedStringResource("listingApplication.format.year", defaultValue: "\(arg1)", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "listingApplication.navigation.dateSelection" in table "Localizable.xcstrings".
    nonisolated public static var listingApplicationNavigationDateSelection: LocalizedStringResource {
        LocalizedStringResource("listingApplication.navigation.dateSelection", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "listingApplication.navigation.review" in table "Localizable.xcstrings".
    nonisolated public static var listingApplicationNavigationReview: LocalizedStringResource {
        LocalizedStringResource("listingApplication.navigation.review", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "listingApplication.notice.message" in table "Localizable.xcstrings".
    nonisolated public static var listingApplicationNoticeMessage: LocalizedStringResource {
        LocalizedStringResource("listingApplication.notice.message", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "listingApplication.notice.title" in table "Localizable.xcstrings".
    nonisolated public static var listingApplicationNoticeTitle: LocalizedStringResource {
        LocalizedStringResource("listingApplication.notice.title", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "listingApplication.privacy.collection.title" in table "Localizable.xcstrings".
    nonisolated public static var listingApplicationPrivacyCollectionTitle: LocalizedStringResource {
        LocalizedStringResource("listingApplication.privacy.collection.title", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "listingApplication.privacy.thirdParty.agreement" in table "Localizable.xcstrings".
    nonisolated public static var listingApplicationPrivacyThirdPartyAgreement: LocalizedStringResource {
        LocalizedStringResource("listingApplication.privacy.thirdParty.agreement", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "listingApplication.privacy.thirdParty.title" in table "Localizable.xcstrings".
    nonisolated public static var listingApplicationPrivacyThirdPartyTitle: LocalizedStringResource {
        LocalizedStringResource("listingApplication.privacy.thirdParty.title", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "listingApplication.review.field.cost" in table "Localizable.xcstrings".
    nonisolated public static var listingApplicationReviewFieldCost: LocalizedStringResource {
        LocalizedStringResource("listingApplication.review.field.cost", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "listingApplication.review.field.leaseTerm" in table "Localizable.xcstrings".
    nonisolated public static var listingApplicationReviewFieldLeaseTerm: LocalizedStringResource {
        LocalizedStringResource("listingApplication.review.field.leaseTerm", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "listingApplication.review.field.moveInDate" in table "Localizable.xcstrings".
    nonisolated public static var listingApplicationReviewFieldMoveInDate: LocalizedStringResource {
        LocalizedStringResource("listingApplication.review.field.moveInDate", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "listingApplication.review.field.moveOutDate" in table "Localizable.xcstrings".
    nonisolated public static var listingApplicationReviewFieldMoveOutDate: LocalizedStringResource {
        LocalizedStringResource("listingApplication.review.field.moveOutDate", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "listingApplication.review.field.roomType" in table "Localizable.xcstrings".
    nonisolated public static var listingApplicationReviewFieldRoomType: LocalizedStringResource {
        LocalizedStringResource("listingApplication.review.field.roomType", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "listingApplication.review.prompt" in table "Localizable.xcstrings".
    nonisolated public static var listingApplicationReviewPrompt: LocalizedStringResource {
        LocalizedStringResource("listingApplication.review.prompt", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "listingDetail.action.apply" in table "Localizable.xcstrings".
    nonisolated public static var listingDetailActionApply: LocalizedStringResource {
        LocalizedStringResource("listingDetail.action.apply", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "listingDetail.action.contact" in table "Localizable.xcstrings".
    nonisolated public static var listingDetailActionContact: LocalizedStringResource {
        LocalizedStringResource("listingDetail.action.contact", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "listingDetail.error.loadFailed" in table "Localizable.xcstrings".
    nonisolated public static var listingDetailErrorLoadFailed: LocalizedStringResource {
        LocalizedStringResource("listingDetail.error.loadFailed", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "listingDetail.field.buildingType" in table "Localizable.xcstrings".
    nonisolated public static var listingDetailFieldBuildingType: LocalizedStringResource {
        LocalizedStringResource("listingDetail.field.buildingType", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "listingDetail.field.deposit" in table "Localizable.xcstrings".
    nonisolated public static var listingDetailFieldDeposit: LocalizedStringResource {
        LocalizedStringResource("listingDetail.field.deposit", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "listingDetail.field.elevator" in table "Localizable.xcstrings".
    nonisolated public static var listingDetailFieldElevator: LocalizedStringResource {
        LocalizedStringResource("listingDetail.field.elevator", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "listingDetail.field.floor" in table "Localizable.xcstrings".
    nonisolated public static var listingDetailFieldFloor: LocalizedStringResource {
        LocalizedStringResource("listingDetail.field.floor", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "listingDetail.field.genderPolicy" in table "Localizable.xcstrings".
    nonisolated public static var listingDetailFieldGenderPolicy: LocalizedStringResource {
        LocalizedStringResource("listingDetail.field.genderPolicy", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "listingDetail.field.heatingFacility" in table "Localizable.xcstrings".
    nonisolated public static var listingDetailFieldHeatingFacility: LocalizedStringResource {
        LocalizedStringResource("listingDetail.field.heatingFacility", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "listingDetail.field.kitchenFacility" in table "Localizable.xcstrings".
    nonisolated public static var listingDetailFieldKitchenFacility: LocalizedStringResource {
        LocalizedStringResource("listingDetail.field.kitchenFacility", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "listingDetail.field.laundryFacility" in table "Localizable.xcstrings".
    nonisolated public static var listingDetailFieldLaundryFacility: LocalizedStringResource {
        LocalizedStringResource("listingDetail.field.laundryFacility", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "listingDetail.field.livingFacility" in table "Localizable.xcstrings".
    nonisolated public static var listingDetailFieldLivingFacility: LocalizedStringResource {
        LocalizedStringResource("listingDetail.field.livingFacility", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "listingDetail.field.maintenanceFee" in table "Localizable.xcstrings".
    nonisolated public static var listingDetailFieldMaintenanceFee: LocalizedStringResource {
        LocalizedStringResource("listingDetail.field.maintenanceFee", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "listingDetail.field.monthlyRent" in table "Localizable.xcstrings".
    nonisolated public static var listingDetailFieldMonthlyRent: LocalizedStringResource {
        LocalizedStringResource("listingDetail.field.monthlyRent", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "listingDetail.field.nearbyAmenities" in table "Localizable.xcstrings".
    nonisolated public static var listingDetailFieldNearbyAmenities: LocalizedStringResource {
        LocalizedStringResource("listingDetail.field.nearbyAmenities", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "listingDetail.field.otherDetails" in table "Localizable.xcstrings".
    nonisolated public static var listingDetailFieldOtherDetails: LocalizedStringResource {
        LocalizedStringResource("listingDetail.field.otherDetails", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "listingDetail.field.parking" in table "Localizable.xcstrings".
    nonisolated public static var listingDetailFieldParking: LocalizedStringResource {
        LocalizedStringResource("listingDetail.field.parking", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "listingDetail.field.providedSupplies" in table "Localizable.xcstrings".
    nonisolated public static var listingDetailFieldProvidedSupplies: LocalizedStringResource {
        LocalizedStringResource("listingDetail.field.providedSupplies", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "listingDetail.field.refundPolicy" in table "Localizable.xcstrings".
    nonisolated public static var listingDetailFieldRefundPolicy: LocalizedStringResource {
        LocalizedStringResource("listingDetail.field.refundPolicy", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "listingDetail.field.rentType" in table "Localizable.xcstrings".
    nonisolated public static var listingDetailFieldRentType: LocalizedStringResource {
        LocalizedStringResource("listingDetail.field.rentType", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "listingDetail.field.roomType" in table "Localizable.xcstrings".
    nonisolated public static var listingDetailFieldRoomType: LocalizedStringResource {
        LocalizedStringResource("listingDetail.field.roomType", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "listingDetail.field.safetyFacility" in table "Localizable.xcstrings".
    nonisolated public static var listingDetailFieldSafetyFacility: LocalizedStringResource {
        LocalizedStringResource("listingDetail.field.safetyFacility", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "listingDetail.field.spaceFacility" in table "Localizable.xcstrings".
    nonisolated public static var listingDetailFieldSpaceFacility: LocalizedStringResource {
        LocalizedStringResource("listingDetail.field.spaceFacility", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "listingDetail.field.usagePeriod" in table "Localizable.xcstrings".
    nonisolated public static var listingDetailFieldUsagePeriod: LocalizedStringResource {
        LocalizedStringResource("listingDetail.field.usagePeriod", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "listingDetail.format.commonSpace.count" in table "Localizable.xcstrings".
    nonisolated public static func listingDetailFormatCommonSpaceCount(_ arg1: String, _ arg2: String) -> LocalizedStringResource {
        LocalizedStringResource("listingDetail.format.commonSpace.count", defaultValue: "\(arg1) (\(arg2))", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "listingDetail.format.deposit.overview" in table "Localizable.xcstrings".
    nonisolated public static func listingDetailFormatDepositOverview(_ arg1: String) -> LocalizedStringResource {
        LocalizedStringResource("listingDetail.format.deposit.overview", defaultValue: "Dep. \(arg1)", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "listingDetail.format.deposit.roomOffer" in table "Localizable.xcstrings".
    nonisolated public static func listingDetailFormatDepositRoomOffer(_ arg1: String) -> LocalizedStringResource {
        LocalizedStringResource("listingDetail.format.deposit.roomOffer", defaultValue: "\(arg1) deposit", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "listingDetail.format.floor.equal" in table "Localizable.xcstrings".
    nonisolated public static func listingDetailFormatFloorEqual(_ arg1: String) -> LocalizedStringResource {
        LocalizedStringResource("listingDetail.format.floor.equal", defaultValue: "Floor \(arg1)", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "listingDetail.format.floor.equalOfTotal" in table "Localizable.xcstrings".
    nonisolated public static func listingDetailFormatFloorEqualOfTotal(_ arg1: String, _ arg2: String) -> LocalizedStringResource {
        LocalizedStringResource("listingDetail.format.floor.equalOfTotal", defaultValue: "Floor \(arg1) of \(arg2)", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "listingDetail.format.floor.maximum" in table "Localizable.xcstrings".
    nonisolated public static func listingDetailFormatFloorMaximum(_ arg1: String) -> LocalizedStringResource {
        LocalizedStringResource("listingDetail.format.floor.maximum", defaultValue: "Up to floor \(arg1)", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "listingDetail.format.floor.maximumOfTotal" in table "Localizable.xcstrings".
    nonisolated public static func listingDetailFormatFloorMaximumOfTotal(_ arg1: String, _ arg2: String) -> LocalizedStringResource {
        LocalizedStringResource("listingDetail.format.floor.maximumOfTotal", defaultValue: "Up to floor \(arg1) of \(arg2)", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "listingDetail.format.floor.minimum" in table "Localizable.xcstrings".
    nonisolated public static func listingDetailFormatFloorMinimum(_ arg1: String) -> LocalizedStringResource {
        LocalizedStringResource("listingDetail.format.floor.minimum", defaultValue: "Floor \(arg1) and above", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "listingDetail.format.floor.minimumOfTotal" in table "Localizable.xcstrings".
    nonisolated public static func listingDetailFormatFloorMinimumOfTotal(_ arg1: String, _ arg2: String) -> LocalizedStringResource {
        LocalizedStringResource("listingDetail.format.floor.minimumOfTotal", defaultValue: "Floor \(arg1) and above of \(arg2)", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "listingDetail.format.floor.range" in table "Localizable.xcstrings".
    nonisolated public static func listingDetailFormatFloorRange(_ arg1: String, _ arg2: String) -> LocalizedStringResource {
        LocalizedStringResource("listingDetail.format.floor.range", defaultValue: "Floors \(arg1)–\(arg2)", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "listingDetail.format.floor.rangeOfTotal" in table "Localizable.xcstrings".
    nonisolated public static func listingDetailFormatFloorRangeOfTotal(_ arg1: String, _ arg2: String, _ arg3: String) -> LocalizedStringResource {
        LocalizedStringResource("listingDetail.format.floor.rangeOfTotal", defaultValue: "Floors \(arg1)–\(arg2) of \(arg3)", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "listingDetail.format.floor.totalOnly" in table "Localizable.xcstrings".
    nonisolated public static func listingDetailFormatFloorTotalOnly(_ arg1: String) -> LocalizedStringResource {
        LocalizedStringResource("listingDetail.format.floor.totalOnly", defaultValue: "\(arg1) floors total", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "listingDetail.format.maintenanceFee.overview" in table "Localizable.xcstrings".
    nonisolated public static func listingDetailFormatMaintenanceFeeOverview(_ arg1: String) -> LocalizedStringResource {
        LocalizedStringResource("listingDetail.format.maintenanceFee.overview", defaultValue: "Maint. \(arg1)", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "listingDetail.format.monthlyRent" in table "Localizable.xcstrings".
    nonisolated public static func listingDetailFormatMonthlyRent(_ arg1: String) -> LocalizedStringResource {
        LocalizedStringResource("listingDetail.format.monthlyRent", defaultValue: "\(arg1)/mo", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "listingDetail.format.stay.equal" in table "Localizable.xcstrings".
    nonisolated public static func listingDetailFormatStayEqual(_ arg1: String) -> LocalizedStringResource {
        LocalizedStringResource("listingDetail.format.stay.equal", defaultValue: "\(arg1) months", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "listingDetail.format.stay.maximum" in table "Localizable.xcstrings".
    nonisolated public static func listingDetailFormatStayMaximum(_ arg1: String) -> LocalizedStringResource {
        LocalizedStringResource("listingDetail.format.stay.maximum", defaultValue: "\(arg1) mo max", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "listingDetail.format.stay.minimum" in table "Localizable.xcstrings".
    nonisolated public static func listingDetailFormatStayMinimum(_ arg1: String) -> LocalizedStringResource {
        LocalizedStringResource("listingDetail.format.stay.minimum", defaultValue: "\(arg1) mo min", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "listingDetail.format.stay.range" in table "Localizable.xcstrings".
    nonisolated public static func listingDetailFormatStayRange(_ arg1: String, _ arg2: String) -> LocalizedStringResource {
        LocalizedStringResource("listingDetail.format.stay.range", defaultValue: "\(arg1)–\(arg2) months", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "listingDetail.format.transit.location" in table "Localizable.xcstrings".
    nonisolated public static func listingDetailFormatTransitLocation(_ arg1: String, _ arg2: String) -> LocalizedStringResource {
        LocalizedStringResource("listingDetail.format.transit.location", defaultValue: "\(arg1)-min walk from \(arg2)", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "listingDetail.format.transit.overview" in table "Localizable.xcstrings".
    nonisolated public static func listingDetailFormatTransitOverview(_ arg1: String, _ arg2: String) -> LocalizedStringResource {
        LocalizedStringResource("listingDetail.format.transit.overview", defaultValue: "\(arg1)-min walk \(arg2)", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "listingDetail.like.accessibility.liked" in table "Localizable.xcstrings".
    nonisolated public static var listingDetailLikeAccessibilityLiked: LocalizedStringResource {
        LocalizedStringResource("listingDetail.like.accessibility.liked", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "listingDetail.like.accessibility.notLiked" in table "Localizable.xcstrings".
    nonisolated public static var listingDetailLikeAccessibilityNotLiked: LocalizedStringResource {
        LocalizedStringResource("listingDetail.like.accessibility.notLiked", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "listingDetail.like.action.like" in table "Localizable.xcstrings".
    nonisolated public static var listingDetailLikeActionLike: LocalizedStringResource {
        LocalizedStringResource("listingDetail.like.action.like", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "listingDetail.like.action.unlike" in table "Localizable.xcstrings".
    nonisolated public static var listingDetailLikeActionUnlike: LocalizedStringResource {
        LocalizedStringResource("listingDetail.like.action.unlike", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "listingDetail.map.accessibility.open" in table "Localizable.xcstrings".
    nonisolated public static var listingDetailMapAccessibilityOpen: LocalizedStringResource {
        LocalizedStringResource("listingDetail.map.accessibility.open", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "listingDetail.review.empty" in table "Localizable.xcstrings".
    nonisolated public static var listingDetailReviewEmpty: LocalizedStringResource {
        LocalizedStringResource("listingDetail.review.empty", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "listingDetail.review.prompt" in table "Localizable.xcstrings".
    nonisolated public static var listingDetailReviewPrompt: LocalizedStringResource {
        LocalizedStringResource("listingDetail.review.prompt", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "listingDetail.section.locationAndNearby" in table "Localizable.xcstrings".
    nonisolated public static var listingDetailSectionLocationAndNearby: LocalizedStringResource {
        LocalizedStringResource("listingDetail.section.locationAndNearby", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "listingDetail.tab.building" in table "Localizable.xcstrings".
    nonisolated public static var listingDetailTabBuilding: LocalizedStringResource {
        LocalizedStringResource("listingDetail.tab.building", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "listingDetail.tab.facility" in table "Localizable.xcstrings".
    nonisolated public static var listingDetailTabFacility: LocalizedStringResource {
        LocalizedStringResource("listingDetail.tab.facility", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "listingDetail.tab.location" in table "Localizable.xcstrings".
    nonisolated public static var listingDetailTabLocation: LocalizedStringResource {
        LocalizedStringResource("listingDetail.tab.location", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "listingDetail.tab.price" in table "Localizable.xcstrings".
    nonisolated public static var listingDetailTabPrice: LocalizedStringResource {
        LocalizedStringResource("listingDetail.tab.price", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "listingDetail.tab.property" in table "Localizable.xcstrings".
    nonisolated public static var listingDetailTabProperty: LocalizedStringResource {
        LocalizedStringResource("listingDetail.tab.property", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "listingDetail.tab.review" in table "Localizable.xcstrings".
    nonisolated public static var listingDetailTabReview: LocalizedStringResource {
        LocalizedStringResource("listingDetail.tab.review", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "listingDetail.tab.roomOffers" in table "Localizable.xcstrings".
    nonisolated public static var listingDetailTabRoomOffers: LocalizedStringResource {
        LocalizedStringResource("listingDetail.tab.roomOffers", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "listingDetail.validation.roomTypeRequired" in table "Localizable.xcstrings".
    nonisolated public static var listingDetailValidationRoomTypeRequired: LocalizedStringResource {
        LocalizedStringResource("listingDetail.validation.roomTypeRequired", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "listingDetail.value.elevatorAvailable" in table "Localizable.xcstrings".
    nonisolated public static var listingDetailValueElevatorAvailable: LocalizedStringResource {
        LocalizedStringResource("listingDetail.value.elevatorAvailable", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "listingDetail.value.maintenanceFeeNotApplicable" in table "Localizable.xcstrings".
    nonisolated public static var listingDetailValueMaintenanceFeeNotApplicable: LocalizedStringResource {
        LocalizedStringResource("listingDetail.value.maintenanceFeeNotApplicable", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "listingDetail.value.noAddressInfo" in table "Localizable.xcstrings".
    nonisolated public static var listingDetailValueNoAddressInfo: LocalizedStringResource {
        LocalizedStringResource("listingDetail.value.noAddressInfo", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "listingDetail.value.noDepositInfo" in table "Localizable.xcstrings".
    nonisolated public static var listingDetailValueNoDepositInfo: LocalizedStringResource {
        LocalizedStringResource("listingDetail.value.noDepositInfo", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "listingDetail.value.noElevator" in table "Localizable.xcstrings".
    nonisolated public static var listingDetailValueNoElevator: LocalizedStringResource {
        LocalizedStringResource("listingDetail.value.noElevator", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "listingDetail.value.noInfo" in table "Localizable.xcstrings".
    nonisolated public static var listingDetailValueNoInfo: LocalizedStringResource {
        LocalizedStringResource("listingDetail.value.noInfo", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "listingDetail.value.noMaintenanceFee" in table "Localizable.xcstrings".
    nonisolated public static var listingDetailValueNoMaintenanceFee: LocalizedStringResource {
        LocalizedStringResource("listingDetail.value.noMaintenanceFee", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "listingDetail.value.noMaintenanceFeeInfo" in table "Localizable.xcstrings".
    nonisolated public static var listingDetailValueNoMaintenanceFeeInfo: LocalizedStringResource {
        LocalizedStringResource("listingDetail.value.noMaintenanceFeeInfo", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "listingDetail.value.noNearbyAmenities" in table "Localizable.xcstrings".
    nonisolated public static var listingDetailValueNoNearbyAmenities: LocalizedStringResource {
        LocalizedStringResource("listingDetail.value.noNearbyAmenities", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "listingDetail.value.noParking" in table "Localizable.xcstrings".
    nonisolated public static var listingDetailValueNoParking: LocalizedStringResource {
        LocalizedStringResource("listingDetail.value.noParking", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "listingDetail.value.noPriceInfo" in table "Localizable.xcstrings".
    nonisolated public static var listingDetailValueNoPriceInfo: LocalizedStringResource {
        LocalizedStringResource("listingDetail.value.noPriceInfo", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "listingDetail.value.noRentalTypeInfo" in table "Localizable.xcstrings".
    nonisolated public static var listingDetailValueNoRentalTypeInfo: LocalizedStringResource {
        LocalizedStringResource("listingDetail.value.noRentalTypeInfo", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "listingDetail.value.noTransitInfo" in table "Localizable.xcstrings".
    nonisolated public static var listingDetailValueNoTransitInfo: LocalizedStringResource {
        LocalizedStringResource("listingDetail.value.noTransitInfo", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "listingDetail.value.parkingAvailable" in table "Localizable.xcstrings".
    nonisolated public static var listingDetailValueParkingAvailable: LocalizedStringResource {
        LocalizedStringResource("listingDetail.value.parkingAvailable", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "login.appleButton" in table "Localizable.xcstrings".
    nonisolated public static var loginAppleButton: LocalizedStringResource {
        LocalizedStringResource("login.appleButton", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "login.googleButton" in table "Localizable.xcstrings".
    nonisolated public static var loginGoogleButton: LocalizedStringResource {
        LocalizedStringResource("login.googleButton", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "login.notification.allowButton" in table "Localizable.xcstrings".
    nonisolated public static var loginNotificationAllowButton: LocalizedStringResource {
        LocalizedStringResource("login.notification.allowButton", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "login.notification.description" in table "Localizable.xcstrings".
    nonisolated public static var loginNotificationDescription: LocalizedStringResource {
        LocalizedStringResource("login.notification.description", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "login.notification.title" in table "Localizable.xcstrings".
    nonisolated public static var loginNotificationTitle: LocalizedStringResource {
        LocalizedStringResource("login.notification.title", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "login.quickStartBadge" in table "Localizable.xcstrings".
    nonisolated public static var loginQuickStartBadge: LocalizedStringResource {
        LocalizedStringResource("login.quickStartBadge", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "login.tagline" in table "Localizable.xcstrings".
    nonisolated public static var loginTagline: LocalizedStringResource {
        LocalizedStringResource("login.tagline", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "login.terms.agreeAllRequired" in table "Localizable.xcstrings".
    nonisolated public static var loginTermsAgreeAllRequired: LocalizedStringResource {
        LocalizedStringResource("login.terms.agreeAllRequired", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "login.terms.marketing.title" in table "Localizable.xcstrings".
    nonisolated public static var loginTermsMarketingTitle: LocalizedStringResource {
        LocalizedStringResource("login.terms.marketing.title", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "login.terms.marketingOptional.title" in table "Localizable.xcstrings".
    nonisolated public static var loginTermsMarketingOptionalTitle: LocalizedStringResource {
        LocalizedStringResource("login.terms.marketingOptional.title", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "login.terms.privacy.title" in table "Localizable.xcstrings".
    nonisolated public static var loginTermsPrivacyTitle: LocalizedStringResource {
        LocalizedStringResource("login.terms.privacy.title", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "login.terms.privacyRequired.title" in table "Localizable.xcstrings".
    nonisolated public static var loginTermsPrivacyRequiredTitle: LocalizedStringResource {
        LocalizedStringResource("login.terms.privacyRequired.title", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "login.terms.requiredSectionTitle" in table "Localizable.xcstrings".
    nonisolated public static var loginTermsRequiredSectionTitle: LocalizedStringResource {
        LocalizedStringResource("login.terms.requiredSectionTitle", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "login.terms.service.title" in table "Localizable.xcstrings".
    nonisolated public static var loginTermsServiceTitle: LocalizedStringResource {
        LocalizedStringResource("login.terms.service.title", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "login.terms.serviceRequired.title" in table "Localizable.xcstrings".
    nonisolated public static var loginTermsServiceRequiredTitle: LocalizedStringResource {
        LocalizedStringResource("login.terms.serviceRequired.title", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "login.terms.startButton" in table "Localizable.xcstrings".
    nonisolated public static var loginTermsStartButton: LocalizedStringResource {
        LocalizedStringResource("login.terms.startButton", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "login.terms.title" in table "Localizable.xcstrings".
    nonisolated public static var loginTermsTitle: LocalizedStringResource {
        LocalizedStringResource("login.terms.title", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "login.userType.subtitle" in table "Localizable.xcstrings".
    nonisolated public static var loginUserTypeSubtitle: LocalizedStringResource {
        LocalizedStringResource("login.userType.subtitle", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "login.userType.title" in table "Localizable.xcstrings".
    nonisolated public static var loginUserTypeTitle: LocalizedStringResource {
        LocalizedStringResource("login.userType.title", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "map.diagnosis.accessibility.collapsed" in table "Localizable.xcstrings".
    nonisolated public static var mapDiagnosisAccessibilityCollapsed: LocalizedStringResource {
        LocalizedStringResource("map.diagnosis.accessibility.collapsed", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "map.diagnosis.accessibility.expandedClose" in table "Localizable.xcstrings".
    nonisolated public static var mapDiagnosisAccessibilityExpandedClose: LocalizedStringResource {
        LocalizedStringResource("map.diagnosis.accessibility.expandedClose", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "map.diagnosis.accessibility.results" in table "Localizable.xcstrings".
    nonisolated public static var mapDiagnosisAccessibilityResults: LocalizedStringResource {
        LocalizedStringResource("map.diagnosis.accessibility.results", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "map.diagnosis.badge" in table "Localizable.xcstrings".
    nonisolated public static var mapDiagnosisBadge: LocalizedStringResource {
        LocalizedStringResource("map.diagnosis.badge", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "map.diagnosis.matchesTitle" in table "Localizable.xcstrings".
    nonisolated public static var mapDiagnosisMatchesTitle: LocalizedStringResource {
        LocalizedStringResource("map.diagnosis.matchesTitle", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "map.diagnosis.startButton" in table "Localizable.xcstrings".
    nonisolated public static var mapDiagnosisStartButton: LocalizedStringResource {
        LocalizedStringResource("map.diagnosis.startButton", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "map.diagnosis.title" in table "Localizable.xcstrings".
    nonisolated public static var mapDiagnosisTitle: LocalizedStringResource {
        LocalizedStringResource("map.diagnosis.title", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "map.diagnosis.tryAgain" in table "Localizable.xcstrings".
    nonisolated public static var mapDiagnosisTryAgain: LocalizedStringResource {
        LocalizedStringResource("map.diagnosis.tryAgain", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "map.filter.accessibility.open" in table "Localizable.xcstrings".
    nonisolated public static var mapFilterAccessibilityOpen: LocalizedStringResource {
        LocalizedStringResource("map.filter.accessibility.open", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "map.filter.any" in table "Localizable.xcstrings".
    nonisolated public static var mapFilterAny: LocalizedStringResource {
        LocalizedStringResource("map.filter.any", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "map.filter.deposit" in table "Localizable.xcstrings".
    nonisolated public static var mapFilterDeposit: LocalizedStringResource {
        LocalizedStringResource("map.filter.deposit", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "map.filter.monthlyRent" in table "Localizable.xcstrings".
    nonisolated public static var mapFilterMonthlyRent: LocalizedStringResource {
        LocalizedStringResource("map.filter.monthlyRent", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "map.filter.option.addressRegistration" in table "Localizable.xcstrings".
    nonisolated public static var mapFilterOptionAddressRegistration: LocalizedStringResource {
        LocalizedStringResource("map.filter.option.addressRegistration", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "map.filter.option.doubleRoom" in table "Localizable.xcstrings".
    nonisolated public static var mapFilterOptionDoubleRoom: LocalizedStringResource {
        LocalizedStringResource("map.filter.option.doubleRoom", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "map.filter.option.englishSupport" in table "Localizable.xcstrings".
    nonisolated public static var mapFilterOptionEnglishSupport: LocalizedStringResource {
        LocalizedStringResource("map.filter.option.englishSupport", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "map.filter.option.femaleOnly" in table "Localizable.xcstrings".
    nonisolated public static var mapFilterOptionFemaleOnly: LocalizedStringResource {
        LocalizedStringResource("map.filter.option.femaleOnly", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "map.filter.option.mealsIncluded" in table "Localizable.xcstrings".
    nonisolated public static var mapFilterOptionMealsIncluded: LocalizedStringResource {
        LocalizedStringResource("map.filter.option.mealsIncluded", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "map.filter.option.moveInNow" in table "Localizable.xcstrings".
    nonisolated public static var mapFilterOptionMoveInNow: LocalizedStringResource {
        LocalizedStringResource("map.filter.option.moveInNow", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "map.filter.option.noARCRequired" in table "Localizable.xcstrings".
    nonisolated public static var mapFilterOptionNoARCRequired: LocalizedStringResource {
        LocalizedStringResource("map.filter.option.noARCRequired", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "map.filter.option.noMaintenanceFee" in table "Localizable.xcstrings".
    nonisolated public static var mapFilterOptionNoMaintenanceFee: LocalizedStringResource {
        LocalizedStringResource("map.filter.option.noMaintenanceFee", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "map.filter.option.privateBathroom" in table "Localizable.xcstrings".
    nonisolated public static var mapFilterOptionPrivateBathroom: LocalizedStringResource {
        LocalizedStringResource("map.filter.option.privateBathroom", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "map.filter.price.rangeFormat" in table "Localizable.xcstrings".
    nonisolated public static func mapFilterPriceRangeFormat(_ arg1: String, _ arg2: String) -> LocalizedStringResource {
        LocalizedStringResource("map.filter.price.rangeFormat", defaultValue: "\(arg1) ~ \(arg2)", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "map.filter.price.underFormat" in table "Localizable.xcstrings".
    nonisolated public static func mapFilterPriceUnderFormat(_ arg1: String) -> LocalizedStringResource {
        LocalizedStringResource("map.filter.price.underFormat", defaultValue: "Under \(arg1)", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "map.filter.price.upperOnlyFormat" in table "Localizable.xcstrings".
    nonisolated public static func mapFilterPriceUpperOnlyFormat(_ arg1: String) -> LocalizedStringResource {
        LocalizedStringResource("map.filter.price.upperOnlyFormat", defaultValue: "\(arg1)+", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "map.filter.section.options" in table "Localizable.xcstrings".
    nonisolated public static var mapFilterSectionOptions: LocalizedStringResource {
        LocalizedStringResource("map.filter.section.options", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "map.filter.section.price" in table "Localizable.xcstrings".
    nonisolated public static var mapFilterSectionPrice: LocalizedStringResource {
        LocalizedStringResource("map.filter.section.price", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "map.filter.section.propertyType" in table "Localizable.xcstrings".
    nonisolated public static var mapFilterSectionPropertyType: LocalizedStringResource {
        LocalizedStringResource("map.filter.section.propertyType", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "map.filter.title" in table "Localizable.xcstrings".
    nonisolated public static var mapFilterTitle: LocalizedStringResource {
        LocalizedStringResource("map.filter.title", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "map.listing.empty.diagnosis" in table "Localizable.xcstrings".
    nonisolated public static var mapListingEmptyDiagnosis: LocalizedStringResource {
        LocalizedStringResource("map.listing.empty.diagnosis", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "map.listing.empty.location" in table "Localizable.xcstrings".
    nonisolated public static var mapListingEmptyLocation: LocalizedStringResource {
        LocalizedStringResource("map.listing.empty.location", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "map.propertyType.coLiving" in table "Localizable.xcstrings".
    nonisolated public static var mapPropertyTypeCoLiving: LocalizedStringResource {
        LocalizedStringResource("map.propertyType.coLiving", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "map.propertyType.goshiwon" in table "Localizable.xcstrings".
    nonisolated public static var mapPropertyTypeGoshiwon: LocalizedStringResource {
        LocalizedStringResource("map.propertyType.goshiwon", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "map.propertyType.shareHouse" in table "Localizable.xcstrings".
    nonisolated public static var mapPropertyTypeShareHouse: LocalizedStringResource {
        LocalizedStringResource("map.propertyType.shareHouse", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "map.researchAreaButton" in table "Localizable.xcstrings".
    nonisolated public static var mapResearchAreaButton: LocalizedStringResource {
        LocalizedStringResource("map.researchAreaButton", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "map.search.accessibility" in table "Localizable.xcstrings".
    nonisolated public static var mapSearchAccessibility: LocalizedStringResource {
        LocalizedStringResource("map.search.accessibility", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "map.search.clear" in table "Localizable.xcstrings".
    nonisolated public static var mapSearchClear: LocalizedStringResource {
        LocalizedStringResource("map.search.clear", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "more.activity.recentlyViewed" in table "Localizable.xcstrings".
    nonisolated public static var moreActivityRecentlyViewed: LocalizedStringResource {
        LocalizedStringResource("more.activity.recentlyViewed", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "more.activity.savedListings" in table "Localizable.xcstrings".
    nonisolated public static var moreActivitySavedListings: LocalizedStringResource {
        LocalizedStringResource("more.activity.savedListings", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "more.activity.title" in table "Localizable.xcstrings".
    nonisolated public static var moreActivityTitle: LocalizedStringResource {
        LocalizedStringResource("more.activity.title", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "more.landlordService.promoteRoom" in table "Localizable.xcstrings".
    nonisolated public static var moreLandlordServicePromoteRoom: LocalizedStringResource {
        LocalizedStringResource("more.landlordService.promoteRoom", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "more.landlordService.promoteRoomSubtitle" in table "Localizable.xcstrings".
    nonisolated public static var moreLandlordServicePromoteRoomSubtitle: LocalizedStringResource {
        LocalizedStringResource("more.landlordService.promoteRoomSubtitle", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "more.landlordService.title" in table "Localizable.xcstrings".
    nonisolated public static var moreLandlordServiceTitle: LocalizedStringResource {
        LocalizedStringResource("more.landlordService.title", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "more.profile.landlordNamePlaceholder" in table "Localizable.xcstrings".
    nonisolated public static var moreProfileLandlordNamePlaceholder: LocalizedStringResource {
        LocalizedStringResource("more.profile.landlordNamePlaceholder", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "more.profile.nicknamePlaceholder" in table "Localizable.xcstrings".
    nonisolated public static var moreProfileNicknamePlaceholder: LocalizedStringResource {
        LocalizedStringResource("more.profile.nicknamePlaceholder", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "more.support.announcements" in table "Localizable.xcstrings".
    nonisolated public static var moreSupportAnnouncements: LocalizedStringResource {
        LocalizedStringResource("more.support.announcements", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "more.support.collaborationMailBody" in table "Localizable.xcstrings".
    nonisolated public static var moreSupportCollaborationMailBody: LocalizedStringResource {
        LocalizedStringResource("more.support.collaborationMailBody", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "more.support.feedback" in table "Localizable.xcstrings".
    nonisolated public static var moreSupportFeedback: LocalizedStringResource {
        LocalizedStringResource("more.support.feedback", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "more.support.feedbackMailBody" in table "Localizable.xcstrings".
    nonisolated public static var moreSupportFeedbackMailBody: LocalizedStringResource {
        LocalizedStringResource("more.support.feedbackMailBody", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "more.support.partner" in table "Localizable.xcstrings".
    nonisolated public static var moreSupportPartner: LocalizedStringResource {
        LocalizedStringResource("more.support.partner", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "more.support.title" in table "Localizable.xcstrings".
    nonisolated public static var moreSupportTitle: LocalizedStringResource {
        LocalizedStringResource("more.support.title", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "more.title" in table "Localizable.xcstrings".
    nonisolated public static var moreTitle: LocalizedStringResource {
        LocalizedStringResource("more.title", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "notifications.empty.title" in table "Localizable.xcstrings".
    nonisolated public static var notificationsEmptyTitle: LocalizedStringResource {
        LocalizedStringResource("notifications.empty.title", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "notifications.title" in table "Localizable.xcstrings".
    nonisolated public static var notificationsTitle: LocalizedStringResource {
        LocalizedStringResource("notifications.title", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "onboarding.error.completeProfile" in table "Localizable.xcstrings".
    nonisolated public static var onboardingErrorCompleteProfile: LocalizedStringResource {
        LocalizedStringResource("onboarding.error.completeProfile", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "onboarding.error.saveAuthentication" in table "Localizable.xcstrings".
    nonisolated public static var onboardingErrorSaveAuthentication: LocalizedStringResource {
        LocalizedStringResource("onboarding.error.saveAuthentication", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "onboarding.error.sendPhoneVerificationCode" in table "Localizable.xcstrings".
    nonisolated public static var onboardingErrorSendPhoneVerificationCode: LocalizedStringResource {
        LocalizedStringResource("onboarding.error.sendPhoneVerificationCode", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "onboarding.error.verifyPhone" in table "Localizable.xcstrings".
    nonisolated public static var onboardingErrorVerifyPhone: LocalizedStringResource {
        LocalizedStringResource("onboarding.error.verifyPhone", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "onboarding.landlord.identity.title" in table "Localizable.xcstrings".
    nonisolated public static var onboardingLandlordIdentityTitle: LocalizedStringResource {
        LocalizedStringResource("onboarding.landlord.identity.title", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "onboarding.landlord.phoneVerification.title" in table "Localizable.xcstrings".
    nonisolated public static var onboardingLandlordPhoneVerificationTitle: LocalizedStringResource {
        LocalizedStringResource("onboarding.landlord.phoneVerification.title", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "onboarding.option.visa.diplomaticOfficialAndOthers" in table "Localizable.xcstrings".
    nonisolated public static var onboardingOptionVisaDiplomaticOfficialAndOthers: LocalizedStringResource {
        LocalizedStringResource("onboarding.option.visa.diplomaticOfficialAndOthers", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "onboarding.option.visa.etc" in table "Localizable.xcstrings".
    nonisolated public static var onboardingOptionVisaEtc: LocalizedStringResource {
        LocalizedStringResource("onboarding.option.visa.etc", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "onboarding.option.visa.familyMarriageMigrants" in table "Localizable.xcstrings".
    nonisolated public static var onboardingOptionVisaFamilyMarriageMigrants: LocalizedStringResource {
        LocalizedStringResource("onboarding.option.visa.familyMarriageMigrants", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "onboarding.option.visa.nonProfessionalWorkers" in table "Localizable.xcstrings".
    nonisolated public static var onboardingOptionVisaNonProfessionalWorkers: LocalizedStringResource {
        LocalizedStringResource("onboarding.option.visa.nonProfessionalWorkers", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "onboarding.option.visa.overseasKoreans" in table "Localizable.xcstrings".
    nonisolated public static var onboardingOptionVisaOverseasKoreans: LocalizedStringResource {
        LocalizedStringResource("onboarding.option.visa.overseasKoreans", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "onboarding.option.visa.permanentResidents" in table "Localizable.xcstrings".
    nonisolated public static var onboardingOptionVisaPermanentResidents: LocalizedStringResource {
        LocalizedStringResource("onboarding.option.visa.permanentResidents", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "onboarding.option.visa.professionals" in table "Localizable.xcstrings".
    nonisolated public static var onboardingOptionVisaProfessionals: LocalizedStringResource {
        LocalizedStringResource("onboarding.option.visa.professionals", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "onboarding.option.visa.shortTermVisit" in table "Localizable.xcstrings".
    nonisolated public static var onboardingOptionVisaShortTermVisit: LocalizedStringResource {
        LocalizedStringResource("onboarding.option.visa.shortTermVisit", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "onboarding.option.visa.studentsTrainees" in table "Localizable.xcstrings".
    nonisolated public static var onboardingOptionVisaStudentsTrainees: LocalizedStringResource {
        LocalizedStringResource("onboarding.option.visa.studentsTrainees", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "onboarding.option.visa.workingHolidayWorkAndVisit" in table "Localizable.xcstrings".
    nonisolated public static var onboardingOptionVisaWorkingHolidayWorkAndVisit: LocalizedStringResource {
        LocalizedStringResource("onboarding.option.visa.workingHolidayWorkAndVisit", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "onboarding.phoneVerification.code.invalid" in table "Localizable.xcstrings".
    nonisolated public static var onboardingPhoneVerificationCodeInvalid: LocalizedStringResource {
        LocalizedStringResource("onboarding.phoneVerification.code.invalid", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "onboarding.phoneVerification.code.invalidOrExpired" in table "Localizable.xcstrings".
    nonisolated public static var onboardingPhoneVerificationCodeInvalidOrExpired: LocalizedStringResource {
        LocalizedStringResource("onboarding.phoneVerification.code.invalidOrExpired", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "onboarding.phoneVerification.code.placeholder" in table "Localizable.xcstrings".
    nonisolated public static var onboardingPhoneVerificationCodePlaceholder: LocalizedStringResource {
        LocalizedStringResource("onboarding.phoneVerification.code.placeholder", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "onboarding.phoneVerification.code.sent" in table "Localizable.xcstrings".
    nonisolated public static var onboardingPhoneVerificationCodeSent: LocalizedStringResource {
        LocalizedStringResource("onboarding.phoneVerification.code.sent", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "onboarding.phoneVerification.resend" in table "Localizable.xcstrings".
    nonisolated public static var onboardingPhoneVerificationResend: LocalizedStringResource {
        LocalizedStringResource("onboarding.phoneVerification.resend", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "onboarding.phoneVerification.verified" in table "Localizable.xcstrings".
    nonisolated public static var onboardingPhoneVerificationVerified: LocalizedStringResource {
        LocalizedStringResource("onboarding.phoneVerification.verified", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "onboarding.phoneVerification.verify" in table "Localizable.xcstrings".
    nonisolated public static var onboardingPhoneVerificationVerify: LocalizedStringResource {
        LocalizedStringResource("onboarding.phoneVerification.verify", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "onboarding.profile.birthDate" in table "Localizable.xcstrings".
    nonisolated public static var onboardingProfileBirthDate: LocalizedStringResource {
        LocalizedStringResource("onboarding.profile.birthDate", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "onboarding.profile.fullName" in table "Localizable.xcstrings".
    nonisolated public static var onboardingProfileFullName: LocalizedStringResource {
        LocalizedStringResource("onboarding.profile.fullName", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "onboarding.profile.gender" in table "Localizable.xcstrings".
    nonisolated public static var onboardingProfileGender: LocalizedStringResource {
        LocalizedStringResource("onboarding.profile.gender", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "onboarding.profile.nationality" in table "Localizable.xcstrings".
    nonisolated public static var onboardingProfileNationality: LocalizedStringResource {
        LocalizedStringResource("onboarding.profile.nationality", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "onboarding.profile.phoneNumber" in table "Localizable.xcstrings".
    nonisolated public static var onboardingProfilePhoneNumber: LocalizedStringResource {
        LocalizedStringResource("onboarding.profile.phoneNumber", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "onboarding.profile.phoneNumber.placeholder" in table "Localizable.xcstrings".
    nonisolated public static var onboardingProfilePhoneNumberPlaceholder: LocalizedStringResource {
        LocalizedStringResource("onboarding.profile.phoneNumber.placeholder", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "onboarding.profile.visaStatus" in table "Localizable.xcstrings".
    nonisolated public static var onboardingProfileVisaStatus: LocalizedStringResource {
        LocalizedStringResource("onboarding.profile.visaStatus", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "onboarding.tenant.details.title" in table "Localizable.xcstrings".
    nonisolated public static var onboardingTenantDetailsTitle: LocalizedStringResource {
        LocalizedStringResource("onboarding.tenant.details.title", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "onboarding.tenant.name.title" in table "Localizable.xcstrings".
    nonisolated public static var onboardingTenantNameTitle: LocalizedStringResource {
        LocalizedStringResource("onboarding.tenant.name.title", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "profileEdit.navigation.save.accessibilityHint" in table "Localizable.xcstrings".
    nonisolated public static var profileEditNavigationSaveAccessibilityHint: LocalizedStringResource {
        LocalizedStringResource("profileEdit.navigation.save.accessibilityHint", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "profileEdit.navigation.save.accessibilityLabel" in table "Localizable.xcstrings".
    nonisolated public static var profileEditNavigationSaveAccessibilityLabel: LocalizedStringResource {
        LocalizedStringResource("profileEdit.navigation.save.accessibilityLabel", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "profileEdit.title" in table "Localizable.xcstrings".
    nonisolated public static var profileEditTitle: LocalizedStringResource {
        LocalizedStringResource("profileEdit.title", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "rangeSlider.accessibility.maximum" in table "Localizable.xcstrings".
    nonisolated public static var rangeSliderAccessibilityMaximum: LocalizedStringResource {
        LocalizedStringResource("rangeSlider.accessibility.maximum", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "rangeSlider.accessibility.minimum" in table "Localizable.xcstrings".
    nonisolated public static var rangeSliderAccessibilityMinimum: LocalizedStringResource {
        LocalizedStringResource("rangeSlider.accessibility.minimum", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "recentListings.empty.title" in table "Localizable.xcstrings".
    nonisolated public static var recentListingsEmptyTitle: LocalizedStringResource {
        LocalizedStringResource("recentListings.empty.title", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "recentListings.title" in table "Localizable.xcstrings".
    nonisolated public static var recentListingsTitle: LocalizedStringResource {
        LocalizedStringResource("recentListings.title", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "savedListings.empty.title" in table "Localizable.xcstrings".
    nonisolated public static var savedListingsEmptyTitle: LocalizedStringResource {
        LocalizedStringResource("savedListings.empty.title", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "savedListings.title" in table "Localizable.xcstrings".
    nonisolated public static var savedListingsTitle: LocalizedStringResource {
        LocalizedStringResource("savedListings.title", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "search.accessibility.back" in table "Localizable.xcstrings".
    nonisolated public static var searchAccessibilityBack: LocalizedStringResource {
        LocalizedStringResource("search.accessibility.back", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "search.accessibility.clearInput" in table "Localizable.xcstrings".
    nonisolated public static var searchAccessibilityClearInput: LocalizedStringResource {
        LocalizedStringResource("search.accessibility.clearInput", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "search.empty.noResults" in table "Localizable.xcstrings".
    nonisolated public static var searchEmptyNoResults: LocalizedStringResource {
        LocalizedStringResource("search.empty.noResults", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "search.error.failed" in table "Localizable.xcstrings".
    nonisolated public static var searchErrorFailed: LocalizedStringResource {
        LocalizedStringResource("search.error.failed", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "search.error.invalidInput" in table "Localizable.xcstrings".
    nonisolated public static var searchErrorInvalidInput: LocalizedStringResource {
        LocalizedStringResource("search.error.invalidInput", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "search.placeholder" in table "Localizable.xcstrings".
    nonisolated public static var searchPlaceholder: LocalizedStringResource {
        LocalizedStringResource("search.placeholder", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "search.recent.clearAll" in table "Localizable.xcstrings".
    nonisolated public static var searchRecentClearAll: LocalizedStringResource {
        LocalizedStringResource("search.recent.clearAll", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "search.recent.delete.accessibility" in table "Localizable.xcstrings".
    nonisolated public static func searchRecentDeleteAccessibility(_ arg1: String) -> LocalizedStringResource {
        LocalizedStringResource("search.recent.delete.accessibility", defaultValue: "Delete \(arg1) from recent searches", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "search.recent.title" in table "Localizable.xcstrings".
    nonisolated public static var searchRecentTitle: LocalizedStringResource {
        LocalizedStringResource("search.recent.title", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "settings.account.title" in table "Localizable.xcstrings".
    nonisolated public static var settingsAccountTitle: LocalizedStringResource {
        LocalizedStringResource("settings.account.title", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "settings.appVersion.current" in table "Localizable.xcstrings".
    nonisolated public static var settingsAppVersionCurrent: LocalizedStringResource {
        LocalizedStringResource("settings.appVersion.current", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "settings.customerTerms.title" in table "Localizable.xcstrings".
    nonisolated public static var settingsCustomerTermsTitle: LocalizedStringResource {
        LocalizedStringResource("settings.customerTerms.title", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "settings.logout.confirmAction" in table "Localizable.xcstrings".
    nonisolated public static var settingsLogoutConfirmAction: LocalizedStringResource {
        LocalizedStringResource("settings.logout.confirmAction", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "settings.logout.confirmMessage" in table "Localizable.xcstrings".
    nonisolated public static var settingsLogoutConfirmMessage: LocalizedStringResource {
        LocalizedStringResource("settings.logout.confirmMessage", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "settings.logout.failure" in table "Localizable.xcstrings".
    nonisolated public static var settingsLogoutFailure: LocalizedStringResource {
        LocalizedStringResource("settings.logout.failure", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "settings.logout.title" in table "Localizable.xcstrings".
    nonisolated public static var settingsLogoutTitle: LocalizedStringResource {
        LocalizedStringResource("settings.logout.title", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "settings.marketingConsent.title" in table "Localizable.xcstrings".
    nonisolated public static var settingsMarketingConsentTitle: LocalizedStringResource {
        LocalizedStringResource("settings.marketingConsent.title", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "settings.notification.chat.title" in table "Localizable.xcstrings".
    nonisolated public static var settingsNotificationChatTitle: LocalizedStringResource {
        LocalizedStringResource("settings.notification.chat.title", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "settings.notification.deliveryMethod.title" in table "Localizable.xcstrings".
    nonisolated public static var settingsNotificationDeliveryMethodTitle: LocalizedStringResource {
        LocalizedStringResource("settings.notification.deliveryMethod.title", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "settings.notification.emailNotifications.title" in table "Localizable.xcstrings".
    nonisolated public static var settingsNotificationEmailNotificationsTitle: LocalizedStringResource {
        LocalizedStringResource("settings.notification.emailNotifications.title", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "settings.notification.landlordMessages.title" in table "Localizable.xcstrings".
    nonisolated public static var settingsNotificationLandlordMessagesTitle: LocalizedStringResource {
        LocalizedStringResource("settings.notification.landlordMessages.title", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "settings.notification.loadFailure.message" in table "Localizable.xcstrings".
    nonisolated public static var settingsNotificationLoadFailureMessage: LocalizedStringResource {
        LocalizedStringResource("settings.notification.loadFailure.message", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "settings.notification.permission.failure" in table "Localizable.xcstrings".
    nonisolated public static var settingsNotificationPermissionFailure: LocalizedStringResource {
        LocalizedStringResource("settings.notification.permission.failure", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "settings.notification.permission.message" in table "Localizable.xcstrings".
    nonisolated public static var settingsNotificationPermissionMessage: LocalizedStringResource {
        LocalizedStringResource("settings.notification.permission.message", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "settings.notification.permission.openSettings" in table "Localizable.xcstrings".
    nonisolated public static var settingsNotificationPermissionOpenSettings: LocalizedStringResource {
        LocalizedStringResource("settings.notification.permission.openSettings", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "settings.notification.pushNotifications.title" in table "Localizable.xcstrings".
    nonisolated public static var settingsNotificationPushNotificationsTitle: LocalizedStringResource {
        LocalizedStringResource("settings.notification.pushNotifications.title", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "settings.notification.saveFailure" in table "Localizable.xcstrings".
    nonisolated public static var settingsNotificationSaveFailure: LocalizedStringResource {
        LocalizedStringResource("settings.notification.saveFailure", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "settings.notification.settingsOpenFailure" in table "Localizable.xcstrings".
    nonisolated public static var settingsNotificationSettingsOpenFailure: LocalizedStringResource {
        LocalizedStringResource("settings.notification.settingsOpenFailure", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "settings.notification.tenantMessages.title" in table "Localizable.xcstrings".
    nonisolated public static var settingsNotificationTenantMessagesTitle: LocalizedStringResource {
        LocalizedStringResource("settings.notification.tenantMessages.title", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "settings.notifications.title" in table "Localizable.xcstrings".
    nonisolated public static var settingsNotificationsTitle: LocalizedStringResource {
        LocalizedStringResource("settings.notifications.title", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "settings.popup.cancel" in table "Localizable.xcstrings".
    nonisolated public static var settingsPopupCancel: LocalizedStringResource {
        LocalizedStringResource("settings.popup.cancel", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "settings.privacyPolicy.title" in table "Localizable.xcstrings".
    nonisolated public static var settingsPrivacyPolicyTitle: LocalizedStringResource {
        LocalizedStringResource("settings.privacyPolicy.title", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "settings.title" in table "Localizable.xcstrings".
    nonisolated public static var settingsTitle: LocalizedStringResource {
        LocalizedStringResource("settings.title", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "settings.withdrawal.confirmAction" in table "Localizable.xcstrings".
    nonisolated public static var settingsWithdrawalConfirmAction: LocalizedStringResource {
        LocalizedStringResource("settings.withdrawal.confirmAction", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "settings.withdrawal.confirmMessage" in table "Localizable.xcstrings".
    nonisolated public static var settingsWithdrawalConfirmMessage: LocalizedStringResource {
        LocalizedStringResource("settings.withdrawal.confirmMessage", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "settings.withdrawal.failure" in table "Localizable.xcstrings".
    nonisolated public static var settingsWithdrawalFailure: LocalizedStringResource {
        LocalizedStringResource("settings.withdrawal.failure", table: "Localizable", bundle: resourceBundleDescription)
    }

    /// Localized string for key "tab.community" in table "Localizable.xcstrings".
    nonisolated public static var tabCommunity: LocalizedStringResource {
        LocalizedStringResource("tab.community", table: "Localizable", bundle: resourceBundleDescription)
    }

}
