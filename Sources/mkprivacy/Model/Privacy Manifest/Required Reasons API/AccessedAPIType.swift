import Foundation

// MARK: - Accessed API Type

struct AccessedAPIType: Codable {

    /// `NSPrivacyAccessedAPIType`
    ///
    /// A string that identifies the category of required reason APIs your app uses. The value you provide
    /// must be one of the values listed in the sections below.
    ///
    let type: String

    /// `NSPrivacyAccessedAPITypeReasons`
    ///
    /// An array of strings that identifies the reasons your app uses the APIs. The values you provide
    /// must be the values associated with the accessed API type in the sections below.
    ///
    let reasons: [String]

    enum CodingKeys: String, CodingKey {
        case type = "NSPrivacyAccessedAPIType"
        case reasons = "NSPrivacyAccessedAPITypeReasons"
    }
}
