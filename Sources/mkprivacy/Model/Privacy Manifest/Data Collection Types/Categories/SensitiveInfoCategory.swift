import Foundation

// MARK: - Sensitive Info

/// An enum representing various types of sensitive information.
enum SensitiveInfoCategory: String, Codable, CollectedCategory {
    /// Such as racial or ethnic data, sexual orientation, pregnancy or childbirth information, disability,
    /// religious or philosophical beliefs, trade union membership, political opinion, genetic information,
    /// or biometric data.
    case sensitiveInfo = "NSPrivacyCollectedDataTypeSensitiveInfo"

    var id: String { rawValue }

    var title: String {
        switch self {
        case .sensitiveInfo:
            "Sensitive info"
        }
    }

    var description: String {
        switch self {
        case .sensitiveInfo:
            return "Such as racial or ethnic data, sexual orientation, pregnancy or childbirth information, disability, religious or philosophical beliefs, trade union membership, political opinion, genetic information, or biometric data."
        }
    }
}
