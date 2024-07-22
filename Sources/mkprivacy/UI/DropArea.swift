import SwiftUI

@MainActor struct DropArea: View {

    @State private var isDropAreaTargeted: Bool = false

    @State private var isImportButtonHighlighted: Bool = false

    @State private var isPresentingFileImporter: Bool = false

    @Environment(AppModel.self) private var appModel

    @Environment(\.colorScheme) private var colorScheme

    private var borderColor: Color {
        isDropAreaTargeted ? .accentColor.opacity(0.8) : .primary.opacity(0.2)
    }

    private var importButtonColor: Color {
        isImportButtonHighlighted ? .accentColor.opacity(0.8) : .secondary
    }

    var body: some View {
        Button {
            isPresentingFileImporter = true
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 8)
                    .foregroundStyle(.ultraThinMaterial)
                RoundedRectangle(cornerRadius: 8)
                    .strokeBorder(
                        borderColor,
                        style: StrokeStyle(lineWidth: 2, dash: [8, 4], dashPhase: 0)
                    )
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                HStack(spacing: 6) {
                    Image(systemName: "square.and.arrow.down")
                        .imageScale(.large)
                        .offset(y: -2)
                    Text("Import manifest")
                }
                .foregroundStyle(importButtonColor)
            }
            .frame(maxHeight: 100)
        }
        .buttonStyle(.plain)
        .padding(.horizontal)
        .onHover { value in
            isImportButtonHighlighted = value
        }
        .dropDestination(for: URL.self) { urls, location in
            _ = location
            guard let url = urls.first else {
                return false
            }
            importManifest(from: url)
            return true
        } isTargeted: { isTargeted in
            self.isDropAreaTargeted = isTargeted
        }
        .fileImporter(
            isPresented: $isPresentingFileImporter,
            allowedContentTypes: [.xmlPropertyList]
        ) { result in
            switch result {
            case .success(let url):
                importManifest(from: url)
            case .failure(let error):
                dump(error)
                appModel.error = error
                appModel.isShowingError = true
            }
        }
    }

    private func importManifest(from url: URL) {
        Task {
            do {
                let data = try Data(contentsOf: url)
                let privacyManifest = try PropertyListDecoder()
                    .decode(PrivacyManifest.self, from: data)
                withAnimation {
                    appModel.importPrivacyManifest(privacyManifest)
                }
            } catch {
                dump(error)
                appModel.showError(error)
            }
        }
    }
}

#Preview {
    DropArea()
}
