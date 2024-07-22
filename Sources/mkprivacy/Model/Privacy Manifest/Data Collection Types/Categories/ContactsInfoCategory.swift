import Foundation

// MARK: - Contacts Info

/// An enum representing various types of contacts information.
enum ContactsInfoCategory: String, Codable, CollectedCategory {
    /// Such as a list of contacts in the user’s phone, address book, or social graph.
    case contacts = "NSPrivacyCollectedDataTypeContacts"

    var id: String { rawValue }

    var title: String {
        switch self {
        case .contacts:
            "Contacts"
        }
    }

    var description: String {
        switch self {
        case .contacts:
            return "Such as a list of contacts in the user’s phone, address book, or social graph."
        }
    }
}
