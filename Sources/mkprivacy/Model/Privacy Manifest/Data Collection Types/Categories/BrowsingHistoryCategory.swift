import Foundation

// MARK: - Browsing History

/// An enum representing various types of browsing history information.
enum BrowsingHistoryCategory: String, Codable, CollectedCategory {
    /// Information about content the user has viewed that is not part of the app, such as websites.
    case browsingHistory = "NSPrivacyCollectedDataTypeBrowsingHistory"

    var id: String { rawValue }

    var title: String {
        switch self {
        case .browsingHistory:
            "Browsing history"
        }
    }

    var description: String {
        switch self {
        case .browsingHistory:
            return "Information about content the user has viewed that is not part of the app, such as websites."
        }
    }
}
