import Foundation

// MARK: - Body

/// An enum representing various types of body information.
enum BodyCategory: String, Codable, CollectedCategory {

    /// The user’s hand structure and hand movements.
    case hands = "NSPrivacyCollectedDataTypeHands"

    /// The user’s head movement.
    case head = "NSPrivacyCollectedDataTypeHead"

    var id: String { rawValue }

    var title: String {
        switch self {
        case .hands:
            "Hands"
        case .head:
            "Head"
        }
    }

    var description: String {
        switch self {
        case .hands:
            return "The user’s hand structure and hand movements."
        case .head:
            return "The user’s head movement."
        }
    }
}
