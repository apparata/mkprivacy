import Foundation

// MARK: - Other Data Types

/// An enum representing various other data types.
enum OtherDataTypesCategory: String, Codable, CollectedCategory {
    /// Any other data types not mentioned.
    case otherDataTypes = "NSPrivacyCollectedDataTypeOtherDataTypes"

    var id: String { rawValue }

    var title: String {
        switch self {
        case .otherDataTypes:
            "Other data types"
        }
    }

    var description: String {
        switch self {
        case .otherDataTypes:
            return "Any other data types not mentioned."
        }
    }
}
