import Foundation

// MARK: - Collection Purposes

enum CollectionPurposes: String, Identifiable, Codable, CustomStringConvertible {

    /// Such as displaying third-party ads in your app, or sharing data with entities who display
    /// third-party ads.
    case thirdPartyAdvertising = "NSPrivacyCollectedDataTypePurposeThirdPartyAdvertising"

    /// Such as displaying first-party ads in your app, sending marketing communications directly to your
    /// users, or sharing data with entities who will display your ads.
    case developerAdvertising = "NSPrivacyCollectedDataTypePurposeDeveloperAdvertising"

    /// Using data to evaluate user behavior, including to understand the effectiveness of existing product
    /// features, plan new features, or measure audience size or characteristics.
    case analytics = "NSPrivacyCollectedDataTypePurposeAnalytics"

    /// Customizing what the user sees, such as a list of recommended products, posts, or suggestions.
    case productPersonalization = "NSPrivacyCollectedDataTypePurposeProductPersonalization"

    /// Such as to authenticate the user, enable features, prevent fraud, implement security measures,
    /// ensure server up-time, minimize app crashes, improve scalability and performance, or perform customer support.
    case appFunctionality = "NSPrivacyCollectedDataTypePurposeAppFunctionality"

    /// Any other purposes not listed.
    case other = "NSPrivacyCollectedDataTypePurposeOther"

    var id: String { rawValue }

    var title: String {
        switch self {
        case .thirdPartyAdvertising:
            "3rd party advertising"
        case .developerAdvertising:
            "Developer advertising"
        case .analytics:
            "Analytics"
        case .productPersonalization:
            "Product personalization"
        case .appFunctionality:
            "App functionality"
        case .other:
            "Other"
        }
    }

    var description: String {
        switch self {
        case .thirdPartyAdvertising:
            "Such as displaying third-party ads in your app, or sharing data with entities who display third-party ads."
        case .developerAdvertising:
            "Such as displaying first-party ads in your app, sending marketing communications directly to your users, or sharing data with entities who will display your ads."
        case .analytics:
            "Using data to evaluate user behavior, including to understand the effectiveness of existing product features, plan new features, or measure audience size or characteristics."
        case .productPersonalization:
            "Customizing what the user sees, such as a list of recommended products, posts, or suggestions."
        case .appFunctionality:
            "Such as to authenticate the user, enable features, prevent fraud, implement security measures, ensure server up-time, minimize app crashes, improve scalability and performance, or perform customer support."
        case .other:
            "Any other purposes not listed."
        }
    }
}
