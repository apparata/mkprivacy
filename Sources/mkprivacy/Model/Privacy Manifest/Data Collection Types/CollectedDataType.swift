import Foundation

// MARK: - Collected Data Type

struct CollectedDataType: Codable {

    /// `NSPrivacyCollectedDataType`
    ///
    /// A string that identifies the type of data your app or third-party SDK collects. Choose the value from
    /// the list of data types below that matches the data your app or third-party SDK collects.
    ///
    let type: String

    /// `NSPrivacyCollectedDataTypeLinked`
    ///
    /// A Boolean that indicates whether your app or third-party SDK links this data type to the
    /// user’s identity. For more information, see data linked to the user in
    /// "App privacy details on the App Store".
    var isLinked: Bool

    /// `NSPrivacyCollectedDataTypeTracking`
    ///
    /// A Boolean that indicates whether your app or third-party SDK uses this data type to track.
    ///
    var isTracking: Bool

    /// `NSPrivacyCollectedDataTypePurposes`
    ///
    /// An array of strings that lists the reasons your app or third-party SDK collects the data. Choose
    /// values from the list of purposes below that match the reasons your app or third-party SDK
    /// collects this data type.
    ///
    var purposes: [String]

    enum CodingKeys: String, CodingKey {
        case type = "NSPrivacyCollectedDataType"
        case isLinked = "NSPrivacyCollectedDataTypeLinked"
        case isTracking = "NSPrivacyCollectedDataTypeTracking"
        case purposes = "NSPrivacyCollectedDataTypePurposes"
    }
}
