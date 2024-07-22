// MARK: - Contact Info

/// An enum representing various types of contact information.
enum ContactInfoCategory: String, Codable, CollectedCategory {
    /// Such as first or last name.
    case name = "NSPrivacyCollectedDataTypeName"

    /// Including but not limited to a hashed email address.
    case emailAddress = "NSPrivacyCollectedDataTypeEmailAddress"

    /// Including but not limited to a hashed phone number.
    case phoneNumber = "NSPrivacyCollectedDataTypePhoneNumber"

    /// Such as home address, physical address, or mailing address.
    case physicalAddress = "NSPrivacyCollectedDataTypePhysicalAddress"

    /// Any other information that can be used to contact the user outside the app.
    case otherUserContactInfo = "NSPrivacyCollectedDataTypeOtherUserContactInfo"

    var id: String { rawValue }

    var title: String {
        switch self {
        case .name:
            "Name"
        case .emailAddress:
            "Email address"
        case .phoneNumber:
            "Phone number"
        case .physicalAddress:
            "Physical address"
        case .otherUserContactInfo:
            "Other user contact info"
        }
    }

    var description: String {
        switch self {
        case .name:
            return "Such as first or last name."
        case .emailAddress:
            return "Including but not limited to a hashed email address."
        case .phoneNumber:
            return "Including but not limited to a hashed phone number."
        case .physicalAddress:
            return "Such as home address, physical address, or mailing address."
        case .otherUserContactInfo:
            return "Any other information that can be used to contact the user outside the app."
        }
    }
}
