import SwiftUI

struct ExportButton: View {

    @State private var isPresentingFileExplorer = false

    @Environment(AppModel.self) private var appModel

    var body: some View {
        Button("Export", systemImage: "square.and.arrow.up") {
            isPresentingFileExplorer = true
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
    }
}

#Preview {
    ExportButton()
}
