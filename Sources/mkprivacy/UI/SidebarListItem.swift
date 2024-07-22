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

    var url: URL {
        switch self {
        case .privacyTracking: .Docs.createAPrivacyManifest
        case .trackingDomains: .Docs.createAPrivacyManifest
        case .collectedDataTypes: .Docs.describingDataUseInPrivacyManifests
        case .requiredReasonsAPIs: .Docs.describingUseOfRequiredReasonAPI
        case .summary: .Docs.userPrivacyAndDataUse
        case .manifestFile: .Docs.addingAPrivacyManifestToYourAppOrThirdPartySDK
        }
    }
}

struct SidebarListItem: View {

    private let item: SidebarItem

    @Environment(AppModel.self) private var appModel

    @Environment(\.colorScheme) private var colorScheme

    init(_ item: SidebarItem) {
        self.item = item
    }

    var body: some View {
        Label(item.description, systemImage: item.icon)
            .badge(stringBadge(for: item))
            .badge(numericBadge(for: item))
            .tag(item)
    }

    private func stringBadge(for item: SidebarItem) -> Text? {
        let manifest = appModel.privacyManifest
        switch item {
        case .privacyTracking:
            let showWarning = appModel.warningTrackingButNoTrackingDatatypes
                || appModel.warningNotTrackingButTrackingDataTypes
                || appModel.warningNotTrackingButTrackingDomains
            if showWarning {
                return 
                    Text("\(Image(systemName: "exclamationmark.triangle.fill"))")
                        .foregroundColor(colorScheme == .light ? .yellow : .yellow)
                        .bold()
                    + Text(" \(manifest.privacyTracking ? "Yes" : "No")")
            } else {
                return Text(manifest.privacyTracking ? "Yes" : "No")
            }
        case .collectedDataTypes:
            let count = appModel.dataTypes.count
            if appModel.warningDataTypePurposeRequired {
                return
                    Text("\(Image(systemName: "exclamationmark.triangle.fill"))")
                        .foregroundColor(colorScheme == .light ? .yellow : .yellow)
                        .bold()
                    + Text(count > 0 ? " \(count)" : "")
            } else {
                return count > 0 ? Text("\(appModel.dataTypes.count)") : nil
            }
        case .summary where appModel.isWarningActive:
            return Text("\(Image(systemName: "exclamationmark.triangle.fill"))")
                .foregroundColor(colorScheme == .light ? .yellow : .yellow)
                .bold()
        default: return nil
        }
    }

    private func numericBadge(for item: SidebarItem) -> Int {
        let manifest = appModel.privacyManifest
        return switch item {
        case .trackingDomains:
            manifest.trackingDomains.count
        case .requiredReasonsAPIs:
            appModel.apiReasons
                .map { _, reasons in reasons.count }
                .reduce(0, +)
        default: 0
        }
    }
}

#if DEBUG
#Preview {
    SidebarListItem(.privacyTracking)
        .environment(AppModel())
}
#endif
