import Foundation

// MARK: - Privacy Manifest

struct PrivacyManifest: Codable {

    /// `NSPrivacyTracking`
    ///
    /// A Boolean that indicates whether your app or third-party SDK uses data for tracking as defined
    /// under the App Tracking Transparency framework.
    ///
    /// For more information, see "User Privacy and Data Use".
    ///
    var privacyTracking: Bool

    /// `NSPrivacyTrackingDomains`
    ///
    /// An array of strings that lists the internet domains your app or third-party SDK connects to
    /// that engage in tracking. If the user has not granted tracking permission through the
    /// App Tracking Transparency framework, network requests to these domains fail and your app
    /// receives an error.
    ///
    /// To provide a list of internet domains in `NSPrivacyTrackingDomains`,
    /// set `NSPrivacyTracking` to true.
    ///
    var trackingDomains: [TrackingDomain]

    /// `NSPrivacyCollectedDataTypes`
    ///
    /// An array of dictionaries that describes the data types your app or third-party SDK collects.
    ///
    /// For information on the keys and values to use in the dictionaries,
    /// see "Describing data use in privacy manifests".
    ///
    var collectedDataTypes: [CollectedDataType]

    /// `NSPrivacyAccessedAPITypes`
    ///
    /// An array of dictionaries that describe the API types your app or third-party SDK accesses
    /// that have been designated as APIs that require reasons to access.
    ///
    /// For information on the keys and values to use in the dictionaries,
    /// see "Describing use of required reason API".
    var accessedAPITypes: [AccessedAPIType]

    init(
        privacyTracking: Bool = false,
        trackingDomains: [TrackingDomain] = [],
        collectedDataTypes: [CollectedDataType] = [],
        accessedAPITypes: [AccessedAPIType] = []
    ) {
        self.privacyTracking = privacyTracking
        self.trackingDomains = trackingDomains
        self.collectedDataTypes = collectedDataTypes
        self.accessedAPITypes = accessedAPITypes
    }

    enum CodingKeys: String, CodingKey {
        case privacyTracking = "NSPrivacyTracking"
        case trackingDomains = "NSPrivacyTrackingDomains"
        case collectedDataTypes = "NSPrivacyCollectedDataTypes"
        case accessedAPITypes = "NSPrivacyAccessedAPITypes"
    }

    func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(privacyTracking, forKey: .privacyTracking)
        if !trackingDomains.isEmpty {
            let domains = trackingDomains
                .map {
                    $0.domain.trimmingCharacters(in: .whitespacesAndNewlines)
                }
                .filter {
                    !$0.isEmpty
                }
            try container.encode(domains, forKey: .trackingDomains)
        }
        if !collectedDataTypes.isEmpty {
            try container.encode(collectedDataTypes, forKey: .collectedDataTypes)
        }
        if !accessedAPITypes.isEmpty {
            try container.encode(accessedAPITypes, forKey: .accessedAPITypes)
        }
    }

    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        privacyTracking = try container.decodeIfPresent(Bool.self, forKey: .privacyTracking) ?? false
        trackingDomains = try container.decodeIfPresent([TrackingDomain].self, forKey: .trackingDomains) ?? []
        collectedDataTypes = try container.decodeIfPresent([CollectedDataType].self, forKey: .collectedDataTypes) ?? []
        accessedAPITypes = try container.decodeIfPresent([AccessedAPIType].self, forKey: .accessedAPITypes) ?? []
    }
}
