import Foundation

// MARK: - Financial Info

/// An enum representing various types of financial information.
enum FinancialInfoCategory: String, Codable, CollectedCategory {
    /// Such as form of payment, payment card number, or bank account number. If your app uses a
    /// payment service, the payment information is entered outside your app, and you as the developer
    /// never have access to the payment information, it is not collected and does not need to be disclosed.
    case paymentInfo = "NSPrivacyCollectedDataTypePaymentInfo"

    /// Such as credit score.
    case creditInfo = "NSPrivacyCollectedDataTypeCreditInfo"

    /// Such as salary, income, assets, debts, or any other financial information.
    case otherFinancialInfo = "NSPrivacyCollectedDataTypeOtherFinancialInfo"

    var id: String { rawValue }

    var title: String {
        switch self {
        case .paymentInfo:
            "Payment info"
        case .creditInfo:
            "Credit info"
        case .otherFinancialInfo:
            "Other financial info"
        }
    }

    var description: String {
        switch self {
        case .paymentInfo:
            return "Such as form of payment, payment card number, or bank account number. If your app uses a payment service, the payment information is entered outside your app, and you as the developer never have access to the payment information, it is not collected and does not need to be disclosed."
        case .creditInfo:
            return "Such as credit score."
        case .otherFinancialInfo:
            return "Such as salary, income, assets, debts, or any other financial information."
        }
    }
}
