import SwiftUI

struct Sidebar: View {

    @Environment(AppModel.self) private var appModel

    var body: some View {
        @Bindable var appModel = appModel
        List(selection: $appModel.selectedSidebarItem) {
            Section("Input") {
                SidebarListItem(.privacyTracking)
                SidebarListItem(.trackingDomains)
                SidebarListItem(.collectedDataTypes)
                SidebarListItem(.requiredReasonsAPIs)
            }
            Section("Output") {
                SidebarListItem(.summary)
                SidebarListItem(.manifestFile)
            }
        }
        .listStyle(.sidebar)
    }
}

#Preview {
    Sidebar()
}
