import SwiftUI

struct ManifestFilePane: View {

    @Environment(AppModel.self) private var appModel

    @State var toastModel = ToastModel()

    var body: some View {
        ScrollView(.vertical) {
            VStack(alignment: .leading) {
                Text(appModel.manifestAsPlistText())
                    .font(.custom("Menlo", fixedSize: 11))
                    .multilineTextAlignment(.leading)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding()
        }
        .scrollContentBackground(.hidden)
        .background(Color(NSColor.controlBackgroundColor))
        .overlay(alignment: .bottomTrailing) {
            HStack(alignment: .bottom) {
                if toastModel.isShowingToast {
                    Toast("Copied manifest to pasteboard")
                        .transition(.move(edge: .bottom))
                        .padding(.bottom, 16)
                }
                Button {
                    appModel.copyPrivacyManifestToPasteboard()
                    toastModel.showToast()
                } label: {
                    Image(systemName: "square.on.square")
                        .imageScale(.medium)
                        .fontWeight(.medium)
                        .padding(8)
                        .background(.ultraThinMaterial)
                        .clipShape(Circle())
                        .foregroundColor(.primary)
                }
                .buttonStyle(.scaledOnTap(scale: 0.9))
                .help("Copy manifest to pasteboard")
                .padding(.trailing)
                .padding(.bottom, 16)
            }
        }
    }
}

// MARK: - Preview

#if DEBUG
#Preview {
    ManifestFilePane()
        .environment(AppModel())
}
#endif
