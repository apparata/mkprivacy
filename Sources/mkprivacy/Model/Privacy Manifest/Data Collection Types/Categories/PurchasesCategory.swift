import Foundation

// MARK: - Purchases

/// An enum representing various types of purchase information.
enum PurchasesCategory: String, Codable, CollectedCategory {
    /// An account’s or individual’s purchases or purchase tendencies.
    case purchaseHistory = "NSPrivacyCollectedDataTypePurchaseHistory"

    var id: String { rawValue }

    var title: String {
        switch self {
        case .purchaseHistory:
            "Purchase history"
        }
    }

    var description: String {
        switch self {
        case .purchaseHistory:
            return "An account’s or individual’s purchases or purchase tendencies."
        }
    }
}
