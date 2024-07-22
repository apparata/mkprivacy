import Foundation

enum CollectionCategory: String, Identifiable, CaseIterable, CustomStringConvertible {
    case contactInfo = "Contact Info"
    case healthAndFitness = "Health and Fitness"
    case financialInfo = "Financial Info"
    case locationInfo = "Location Info"
    case sensitiveInfo = "Sensitive Info"
    case contactsInfo = "Contacts Info"
    case userContent = "User Content"
    case browsingHistory = "Browsing History"
    case searchHistory = "Search History"
    case identifiers = "Identifiers"
    case purchases = "Purchases"
    case usageData = "Usage Data"
    case diagnostics = "Diagnostics"
    case surroundings = "Surroundings"
    case body = "Body"
    case otherDataTypes = "Other Data Types"

    var id: Self { self }

    var description: String {
        rawValue
    }

    var icon: String {
        switch self {
        case .contactInfo: "info.circle.fill"
        case .healthAndFitness: "heart.circle.fill"
        case .financialInfo: "creditcard.fill"
        case .locationInfo: "location.fill"
        case .sensitiveInfo: "eye.fill"
        case .contactsInfo: "person.crop.circle.fill"
        case .userContent: "photo.on.rectangle.fill"
        case .browsingHistory: "clock.fill"
        case .searchHistory: "magnifyingglass.circle.fill"
        case .identifiers: "person.text.rectangle.fill"
        case .purchases: "bag.fill"
        case .usageData: "chart.bar.fill"
        case .diagnostics: "gearshape.fill"
        case .surroundings: "arkit"
        case .body: "figure.stand"
        case .otherDataTypes: "ellipsis.circle.fill"
        }
    }
}

protocol CollectedCategory: CaseIterable, Identifiable, CustomStringConvertible {
    var id: String { get }
    var title: String { get }
}
