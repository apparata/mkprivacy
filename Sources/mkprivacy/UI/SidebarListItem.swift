import SwiftUI

enum SidebarItem: Identifiable, Hashable, CustomStringConvertible {
    case privacyTracking
    case trackingDomains
    case collectedDataTypes
    case requiredReasonsAPIs

    case summary
    case manifestFile

    var id: Self { self }

    var description: String {
        switch self {
        case .privacyTracking: "Privacy Tracking"
        case .trackingDomains: "Tracking Domains"
        case .collectedDataTypes: "Collected Data Types"
        case .requiredReasonsAPIs: "Required Reasons API"
        case .summary: "Summary"
        case .manifestFile: "Manifest File"
        }
    }

    var subtitle: String {
        switch self {
        case .privacyTracking: "Tracking of personal information"
        case .trackingDomains: "Internet domains engaged in tracking"
        case .collectedDataTypes: "Types of data the app collects"
        case .requiredReasonsAPIs: "APIs that require reasons to access"
        case .summary: "Overview of the privacy manifest"
        case .manifestFile: "Preview of the file contents"
        }
    }

    var icon: String {
        switch self {
        case .privacyTracking: "checkmark.shield"
        case .trackingDomains: "network.badge.shield.half.filled"
        case .collectedDataTypes: "cylinder.split.1x2"
        case .requiredReasonsAPIs: "function"
        case .summary: "list.bullet"
        case .manifestFile: "doc.text"
        }
    }
}

struct SidebarListItem: View {

    private let item: SidebarItem

    @Environment(AppModel.self) private var appModel

    init(_ item: SidebarItem) {
        self.item = item
    }

    var body: some View {
        Label(item.description, systemImage: item.icon)
            .badge(badge(for: item))
            .tag(item)
    }

    private func badge(for item: SidebarItem) -> Int {
        let manifest = appModel.privacyManifest
        return switch item {
        case .privacyTracking: manifest.privacyTracking ? 1 : 0
        case .trackingDomains: manifest.trackingDomains.count
        case .collectedDataTypes: appModel.dataTypes.count
        case .requiredReasonsAPIs: appModel.apiReasons
                .map { _, reasons in reasons.count }
                .reduce(0, +)
        case .summary: 0
        case .manifestFile: 0
        }
    }
}

#if DEBUG
#Preview {
    SidebarListItem(.privacyTracking)
        .environment(AppModel())
}
#endif
