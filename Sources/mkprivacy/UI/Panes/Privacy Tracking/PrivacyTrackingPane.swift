import SwiftUI

struct PrivacyTrackingPane: View {

    @Environment(AppModel.self) private var appModel

    var body: some View {
        @Bindable var appModel = appModel
        VStack(alignment: .leading) {
            Text("Does the app or third-party SDK use data for tracking as defined under the App Tracking Transparency framework?")
                .multilineTextAlignment(.leading)
                .frame(maxWidth: .infinity, alignment: .leading)
            Toggle(isOn: $appModel.privacyManifest.privacyTracking.animation(.smooth)) {
                Text("Yes, the app or third-party SDK uses data for tracking")
            }
            .padding(.vertical)
            Text("For more information, see [User Privacy and Data Use](https://developer.apple.com/app-store/user-privacy-and-data-use/).")
                .multilineTextAlignment(.leading)
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundColor(.secondary)
                .padding(.bottom)
            if appModel.warningTrackingButNoTrackingDatatypes {
                Warning("No collected data types have been marked for use with tracking yet.", goTo: .collectedDataTypes)
            }
            if appModel.warningNotTrackingButTrackingDataTypes {
                Warning("Some collected data types have been marked for use with tracking.", goTo: .collectedDataTypes)
            }
            if appModel.warningNotTrackingButTrackingDomains {
                Warning("Tracking domains have been added, without tracking enabled.", goTo: .trackingDomains)
            }
            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

// MARK: - Preview

#if DEBUG
#Preview {
    PrivacyTrackingPane()
        .environment(AppModel())
}
#endif
