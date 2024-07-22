import Foundation

/// An enum representing various types of location information.
enum LocationInfoCategory: String, Codable, CollectedCategory {
    /// Information that describes the location of a user or device with the same or greater resolution as a
    /// latitude and longitude with three or more decimal places.
    case preciseLocation = "NSPrivacyCollectedDataTypePreciseLocation"

    /// Information that describes the location of a user or device with lower resolution than a latitude and
    /// longitude with three or more decimal places, such as Approximate Location Services.
    case coarseLocation = "NSPrivacyCollectedDataTypeCoarseLocation"

    var id: String { rawValue }

    var title: String {
        switch self {
        case .preciseLocation:
            "Precise location"
        case .coarseLocation:
            "Coarse location"
        }
    }

    var description: String {
        switch self {
        case .preciseLocation:
            return "Information that describes the location of a user or device with the same or greater resolution as a latitude and longitude with three or more decimal places."
        case .coarseLocation:
            return "Information that describes the location of a user or device with lower resolution than a latitude and longitude with three or more decimal places, such as Approximate Location Services."
        }
    }
}
