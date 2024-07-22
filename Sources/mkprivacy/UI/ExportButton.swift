import SwiftUI

struct ExportButton: View {

    @State private var isPresentingFileExplorer = false

    @State private var isPresentingConfirmDespiteWarning = false

    @Environment(AppModel.self) private var appModel

    var body: some View {
        Button("Export", systemImage: "square.and.arrow.up") {
            if appModel.isWarningActive {
                isPresentingConfirmDespiteWarning = true
            } else {
                isPresentingFileExplorer = true
            }
        }
        .fileExporter(
            isPresented: $isPresentingFileExplorer,
            document: appModel.makeDocument(),
            contentType: .xmlPropertyList,
            defaultFilename: "PrivacyInfo.xcprivacy"
        ) { result in
            switch result {
            case .success(let file):
                print(file)
            case .failure(let error):
                print(error)
            }
        }
        .confirmationDialog("Export despite warnings?", isPresented: $isPresentingConfirmDespiteWarning) {
            Button("Cancel", role: .cancel) { }
            Button("Yes, export") {
                isPresentingFileExplorer = true
            }
        } message: {
            Text("There are warnings for this privacy manifest. Do you want to export anyway?")
        }
        .dialogIcon(Image(systemName: "exclamationmark.triangle.fill"))
    }
}

#Preview {
    ExportButton()
}
