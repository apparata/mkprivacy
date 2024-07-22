import Foundation

// MARK: - Surroundings

/// An enum representing various types of surroundings information.
enum SurroundingsCategory: String, Codable, CollectedCategory {
    /// Such as mesh, planes, scene classification, and/or image detection of the user’s surroundings.
    case environmentScanning = "NSPrivacyCollectedDataTypeEnvironmentScanning"

    var id: String { rawValue }

    var title: String {
        switch self {
        case .environmentScanning:
            "Environment scanning"
        }
    }

    var description: String {
        switch self {
        case .environmentScanning:
            return "Such as mesh, planes, scene classification, and/or image detection of the user’s surroundings."
        }
    }
}
