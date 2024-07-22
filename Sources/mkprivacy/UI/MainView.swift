import SwiftUI
import MakePrivacyKit

struct MainView: View {

    @Environment(AppModel.self) private var appModel

    @State private var isPresentingClearDataPrompt: Bool = false

    var body: some View {
        @Bindable var appModel = appModel
        NavigationSplitView(columnVisibility: .constant(.all)) {
            Sidebar()
                .safeAreaInset(edge: .bottom) {
                    SidebarBottomPanel()
                }
                .toolbar(removing: .sidebarToggle)
                .toolbar {
                    ToolbarItem {
                        HelpMenu()
                            .help("Links to documentation")
                    }
                    ToolbarItem {
                        Button("Clear", systemImage: "trash") {
                            isPresentingClearDataPrompt = true
                        }
                        .help("Clear the privacy manifest")
                    }
                }
                .navigationSplitViewColumnWidth(min: 230, ideal: 230, max: 230)
        } detail: {
            switch appModel.selectedSidebarItem {
            case .privacyTracking: PrivacyTrackingPane()
            case .trackingDomains: TrackingDomainsPane()
            case .requiredReasonsAPIs: RequiredReasonsAPIPane()
            case .collectedDataTypes: CollectedDataTypesPane()
            case .summary: SummaryPane()
            case .manifestFile: ManifestFilePane()
            default: emptyState
            }
        }
        .navigationTitle(appModel.selectedSidebarItem?.description ?? "Privacy Manifest")
        .navigationSubtitle(appModel.selectedSidebarItem?.subtitle ?? "Describe the data your app tracks")
        .toolbar {
            ToolbarItemGroup(placement: .primaryAction) {
                if appModel.isWarningActive {
                    Button {
                        appModel.selectedSidebarItem = .summary
                    } label: {
                        Image(systemName: "exclamationmark.triangle.fill")
                            .imageScale(.large)
                            .foregroundColor(Color.yellow)
                    }
                    .buttonStyle(.plain)
                    .help("Show summary of warnings")
                }
                ExportButton()
                    .help("Export the privacy manifest file")
            }
        }
        .alert(
            appModel.error?.localizedDescription ?? "Error: Something went wrong.",
            isPresented: $appModel.isShowingError
        ) {
            Button("OK", role: .cancel) { }
        }
        .confirmationDialog("Clear data?", isPresented: $isPresentingClearDataPrompt) {
            Button("Cancel", role: .cancel) { }
            Button("Clear", role: .destructive) {
                appModel.clearPrivacyManifest()
            }
        }
        .dialogIcon(Image(systemName: "trash"))
    }

    @ViewBuilder private var emptyState: some View {
        @Bindable var appModel = appModel
        VStack {
            ContentUnavailableView {
                Label("Privacy Manifest", systemImage: "lock.shield")
            } description: {
                Text("Describe the data your app or third-party SDK collects and the reasons required APIs it uses.")
            } actions: {
                Button("Get started") {
                    withAnimation {
                        appModel.selectedSidebarItem = .privacyTracking
                    }
                }
                .buttonStyle(.borderedProminent)
                .padding(.top)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}
