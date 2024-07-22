import Foundation

// MARK: - Identifiers

/// An enum representing various types of identifiers information.
enum IdentifiersCategory: String, Codable, CollectedCategory {
    /// Such as screen name, handle, account ID, assigned user ID, customer number, or other user- or
    /// account-level ID that can be used to identify a particular user or account.
    case userID = "NSPrivacyCollectedDataTypeUserID"

    /// Such as the device’s advertising identifier, or other device-level ID.
    case deviceID = "NSPrivacyCollectedDataTypeDeviceID"

    var id: String { rawValue }

    var title: String {
        switch self {
        case .userID:
            "User ID"
        case .deviceID:
            "Device ID"
        }
    }

    var description: String {
        switch self {
        case .userID:
            return "Such as screen name, handle, account ID, assigned user ID, customer number, or other user- or account-level ID that can be used to identify a particular user or account."
        case .deviceID:
            return "Such as the device’s advertising identifier, or other device-level ID."
        }
    }
}
