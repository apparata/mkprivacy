import SwiftUI
import UniformTypeIdentifiers

struct PrivacyManifestDocument: FileDocument {

    static var readableContentTypes: [UTType] {
        [.xmlPropertyList]
    }

    static var writableContentTypes: [UTType] {
        [.xmlPropertyList]
    }

    private var privacyManifest: PrivacyManifest

    init(_ privacyManifest: PrivacyManifest) {
        self.privacyManifest = privacyManifest
    }

    init(configuration: ReadConfiguration) throws {
        if let data = configuration.file.regularFileContents {
            privacyManifest = try PropertyListDecoder().decode(
                PrivacyManifest.self,
                from: data
            )
        } else {
            privacyManifest = PrivacyManifest()
        }
    }

    func fileWrapper(configuration: WriteConfiguration) throws -> FileWrapper {
        let encoder = PropertyListEncoder()
        encoder.outputFormat = .xml
        let data = try encoder.encode(privacyManifest)
        return FileWrapper(regularFileWithContents: data)
    }
}
