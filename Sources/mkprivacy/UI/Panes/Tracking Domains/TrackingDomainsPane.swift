import SwiftUI

struct TrackingDomainsPane: View {

    @Environment(AppModel.self) private var appModel

    @FocusState private var domainFocus: UUID?

    var body: some View {
        @Bindable var appModel = appModel
        VStack(alignment: .leading, spacing: 0) {
            if appModel.privacyManifest.trackingDomains.isEmpty {
                emptyState
            } else {
                List {
                    ForEach($appModel.privacyManifest.trackingDomains) { $entry in
                        HStack(spacing: 20) {
                            TextField("Domain", text: $entry.domain, prompt: Text("example.com"))
                                .textFieldStyle(.plain)
                                .focused($domainFocus, equals: entry.id)
                                .frame(height: 36)
                                .frame(maxWidth: .infinity)
                                .contentShape(Rectangle())
                                .onSubmit {
                                    if entry.domain.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
                                        deleteEntry(entry)
                                    } else {
                                        withAnimation {
                                            addEntry()
                                        }
                                    }
                                }
                                .onTapGesture {
                                    domainFocus = entry.id
                                }
                            Button {
                                deleteEntry(entry)
                            } label: {
                                Image(systemName: "trash")
                                    .foregroundStyle(.secondary)
                            }
                            .buttonStyle(.plain)
                        }
                    }
                }
                .listStyle(.inset)
                .scrollContentBackground(.hidden)
                Divider()
                Button("Add domain", systemImage: "plus") {
                    withAnimation {
                        addEntry()
                    }
                }
                .buttonStyle(.plain)
                .keyboardShortcut("+")
                .padding(.horizontal)
                .padding(.vertical, 12)
            }
        }
    }

    @ViewBuilder private var emptyState: some View {
        VStack {
            ContentUnavailableView {
                Label("No domains", systemImage: "network.badge.shield.half.filled")
            } description: {
                Text("List domains your app connects to for tracking.")
            } actions: {
                Button {
                    addEntry()
                } label: {
                    Label("Add domain", systemImage: "plus")
                }
                .buttonStyle(.borderedProminent)
                .padding(.top)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }

    private func addEntry() {
        let domain = TrackingDomain("")
        appModel.privacyManifest.trackingDomains.append(domain)
        domainFocus = domain.id
    }

    private func deleteEntry(_ entry: TrackingDomain) {
        domainFocus = nil
        Task {
            try? await Task.sleep(for: .milliseconds(200))
            if let index = appModel
                .privacyManifest
                .trackingDomains
                .firstIndex(where: { $0.id == entry.id }) {
                _ = withAnimation {
                    appModel
                        .privacyManifest
                        .trackingDomains
                        .remove(at: index)
                }
            }
        }

    }
}

// MARK: - Preview

#if DEBUG
#Preview {
    TrackingDomainsPane()
        .environment(AppModel())
}
#endif
