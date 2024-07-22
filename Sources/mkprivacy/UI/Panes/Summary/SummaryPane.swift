import SwiftUI

struct SummaryPane: View {

    @Environment(AppModel.self) private var appModel

    var body: some View {
        let assembledManifest = appModel.assembledPrivacyManifest()
        let summarizedCategories = appModel.summarizeDataCollectionCategories(assembledManifest)
        ScrollView(.vertical) {
            VStack(alignment: .leading) {
                Text("Summary")
                    .font(.title)
                    .bold()
                    .frame(maxWidth: .infinity, alignment: .leading)
                dataCollection(assembledManifest, summarizedCategories)
            }
            .padding()
            .padding()
            .frame(maxWidth: .infinity)
        }
        .scrollContentBackground(.hidden)
        .background(Color(NSColor.controlBackgroundColor))
    }

    @ViewBuilder private func dataCollection(
        _ privacyManifest: PrivacyManifest,
        _ summarizedCategories: SummarizedCategories
    ) -> some View {

        VStack(spacing: 16) {

            VStack(spacing: 0) {
                Image(systemName: "person.fill.viewfinder")
                    .foregroundStyle(Color.accentColor)
                    .imageScale(.large)
                    .font(.title)
                    .fontWeight(.medium)
                    .padding(.bottom, 6)
                Text("Data Used to track You")
                    .font(.title3)
                    .fontWeight(.bold)
                    .padding(.bottom, 8)
                Text("The following data may be used to track you across apps and websites owned by other companies:")
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.secondary)
                    .padding(.bottom, 12)
                LazyVGrid(columns: [GridItem(), GridItem(), GridItem()]) {
                    ForEach(summarizedCategories.tracking) { category in
                        Label(category.description, systemImage: category.icon)
                            .padding(.vertical, 2)
                    }
                }
            }
            .frame(maxWidth: .infinity)
            .padding(20)
            .background(.quinary)
            .clipShape(RoundedRectangle(cornerSize: .init(width: 12, height: 12), style: .continuous))

            VStack(spacing: 0) {
                Image(systemName: "person.fill")
                    .foregroundStyle(Color.accentColor)
                    .imageScale(.large)
                    .font(.title)
                    .fontWeight(.medium)
                    .padding(.bottom, 6)
                Text("Data Linked to You")
                    .font(.title3)
                    .fontWeight(.bold)
                    .padding(.bottom, 8)
                Text("The following data may be collected and linked to your identity:")
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.secondary)
                    .padding(.bottom, 12)
                LazyVGrid(columns: [GridItem(), GridItem(), GridItem()]) {
                    ForEach(summarizedCategories.linked) { category in
                        Label(category.description, systemImage: category.icon)
                            .padding(.vertical, 2)
                    }
                }
            }
            .frame(maxWidth: .infinity)
            .padding(20)
            .background(.quinary)
            .clipShape(RoundedRectangle(cornerSize: .init(width: 12, height: 12), style: .continuous))

            VStack(spacing: 0) {
                Image(systemName: "person.slash.fill")
                    .foregroundStyle(Color.accentColor)
                    .imageScale(.large)
                    .font(.title)
                    .fontWeight(.medium)
                    .padding(.bottom, 6)
                Text("Data Not Linked to You")
                    .font(.title3)
                    .fontWeight(.bold)
                    .padding(.bottom, 8)
                Text("The following may be collected but is not linked to your identity:")
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.secondary)
                    .padding(.bottom, 12)
                LazyVGrid(columns: [GridItem(), GridItem(), GridItem()]) {
                    ForEach(summarizedCategories.linked) { category in
                        Label(category.description, systemImage: category.icon)
                            .padding(.vertical, 2)
                    }
                }
            }
            .frame(maxWidth: .infinity)
            .padding(20)
            .background(.quinary)
            .clipShape(RoundedRectangle(cornerSize: .init(width: 12, height: 12), style: .continuous))
        }
    }
}

// MARK: - Preview

#if DEBUG
#Preview {
    SummaryPane()
        .environment(AppModel())
}
#endif
