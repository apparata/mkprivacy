import SwiftUI

struct PrivacyTrackingPane: View {

    @Environment(AppModel.self) private var appModel

    @Environment(\.colorScheme) private var colorScheme

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
                warning("No collected data types have been marked for use with tracking yet.")
            }
            if appModel.warningNotTrackingButTrackingDataTypes {
                warning("Some collected data types have been marked for use with tracking.")
            }
            if appModel.warningNotTrackingButTrackingDomains {
                warning("Tracking domains have been added, without tracking enabled.")
            }
            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }

    @ViewBuilder private func warning(_ message: String) -> some View {
        HStack(spacing: 4) {
            Image(systemName: "exclamationmark.triangle.fill")
            Text("**Warning:** \(message)")
            Spacer()
        }
        .padding(.vertical, 12)
        .padding(.horizontal, 16)
        .foregroundStyle(colorScheme == .light ? Color.primary : Color.yellow)
        .background(colorScheme == .light ? Color.yellow : Color.yellow.opacity(0.2) )
        .clipShape(Capsule())
    }
}

// MARK: - Preview

#if DEBUG
#Preview {
    PrivacyTrackingPane()
        .environment(AppModel())
}
#endif
