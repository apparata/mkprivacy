import Foundation

// MARK: - Usage Data

/// An enum representing various types of usage data.
enum UsageDataCategory: String, Codable, CollectedCategory {
    /// Such as app launches, taps, clicks, scrolling information, music listening data, video views, saved
    /// place in a game, video, or song, or other information about how the user interacts with the app.
    case productInteraction = "NSPrivacyCollectedDataTypeProductInteraction"

    /// Such as information about the advertisements the user has seen.
    case advertisingData = "NSPrivacyCollectedDataTypeAdvertisingData"

    /// Any other data about user activity in the app.
    case otherUsageData = "NSPrivacyCollectedDataTypeOtherUsageData"

    var id: String { rawValue }

    var title: String {
        switch self {
        case .productInteraction:
            "Product interaction"
        case .advertisingData:
            "Advertising data"
        case .otherUsageData:
            "User usage data"
        }
    }

    var description: String {
        switch self {
        case .productInteraction:
            return "Such as app launches, taps, clicks, scrolling information, music listening data, video views, saved place in a game, video, or song, or other information about how the user interacts with the app."
        case .advertisingData:
            return "Such as information about the advertisements the user has seen."
        case .otherUsageData:
            return "Any other data about user activity in the app."
        }
    }
}
