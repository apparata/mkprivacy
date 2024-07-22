import SwiftUI

struct HelpMenu: View {

    var body: some View {
        Menu("Help", systemImage: "questionmark.circle") {
            Section("Privacy Manifest") {
                Link(destination: .Docs.privacyManifestFiles) {
                    Text("Privacy manifest files")
                }
                Link(destination: .Docs.addingAPrivacyManifestToYourAppOrThirdPartySDK) {
                    Text("Adding a privacy manifest to your app or third-party SDK")
                }
                Link(destination: .Docs.describingDataUseInPrivacyManifests) {
                    Text("Describing data use in privacy manifests")
                }
                Link(destination: .Docs.describingUseOfRequiredReasonAPI) {
                    Text("Describing use of required reason API")
                }
            }
            Section("Privacy Requirements") {
                Link(destination: .Docs.userPrivacyAndDataUse) {
                    Text("User privacy and data use")
                }
                Link(destination: .Docs.thirdPartySDKRequirements) {
                    Text("Third party SDK requirements")
                }
                Link(destination: .Docs.appPrivacyDetailsOnTheAppStore) {
                    Text("App privacy details on the App Store")
                }
            }
        }
    }
}
