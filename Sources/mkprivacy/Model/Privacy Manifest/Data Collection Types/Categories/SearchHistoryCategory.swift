import Foundation

// MARK: - Search History

/// An enum representing various types of search history information.
enum SearchHistoryCategory: String, Codable, CollectedCategory {
    /// Information about searches performed in the app.
    case searchHistory = "NSPrivacyCollectedDataTypeSearchHistory"

    var id: String { rawValue }

    var title: String {
        switch self {
        case .searchHistory:
            "Search history"
        }
    }

    var description: String {
        switch self {
        case .searchHistory:
            return "Information about searches performed in the app."
        }
    }
}
