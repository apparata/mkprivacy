import SwiftUI

struct RequiredReasonsAPIPane: View {

    @Environment(AppModel.self) private var appModel

    var body: some View {
        @Bindable var appModel = appModel
        HSplitView() {
            List(selection: $appModel.selectedRequiredReasonsAPI) {
                Section("API Type") {
                    Text(UserDefaultsAPIs.name)
                        .badge(appModel.apiReasons[UserDefaultsAPIs.key]?.count ?? 0)
                        .tag(UserDefaultsAPIs.key)
                    Text(FileTimestampAPIs.name)
                        .badge(appModel.apiReasons[FileTimestampAPIs.key]?.count ?? 0)
                        .tag(FileTimestampAPIs.key)
                    Text(DiskSpaceAPIs.name)
                        .badge(appModel.apiReasons[DiskSpaceAPIs.key]?.count ?? 0)
                        .tag(DiskSpaceAPIs.key)
                    Text(SystemBootTimeAPIs.name)
                        .badge(appModel.apiReasons[SystemBootTimeAPIs.key]?.count ?? 0)
                        .tag(SystemBootTimeAPIs.key)
                    Text(ActiveKeyboardAPIs.name)
                        .badge(appModel.apiReasons[ActiveKeyboardAPIs.key]?.count ?? 0)
                        .tag(ActiveKeyboardAPIs.key)
                }
            }
            .listStyle(.sidebar)
            .scrollContentBackground(.hidden)
            .frame(width: 180)
            .frame(maxHeight: .infinity)
            VStack {
                switch appModel.selectedRequiredReasonsAPI {
                case UserDefaultsAPIs.key:
                    RequiredReasonsSelector<UserDefaultsAPIs>()
                case FileTimestampAPIs.key:
                    RequiredReasonsSelector<FileTimestampAPIs>()
                case DiskSpaceAPIs.key:
                    RequiredReasonsSelector<DiskSpaceAPIs>()
                case SystemBootTimeAPIs.key:
                    RequiredReasonsSelector<SystemBootTimeAPIs>()
                case ActiveKeyboardAPIs.key:
                    RequiredReasonsSelector<ActiveKeyboardAPIs>()
                default:
                    ContentUnavailableView {
                        Label("No APIs selected", systemImage: "function")
                    } description: {
                        Text("Select an API type to specify reasons.")
                    }
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}

struct RequiredReasonsSelector<T: RequiredReasonsAPI>: View {

    @Environment(AppModel.self) private var appModel

    var body: some View {
        @Bindable var appModel = appModel
        ScrollView(.vertical) {
            VStack(alignment: .leading, spacing: 0) {
                HStack {
                    Text("\(T.name) APIs")
                        .font(.title2)
                        .bold()
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Spacer()
                    Link(destination: T.url) {
                        Image(systemName: "questionmark.circle")
                    }
                    .foregroundColor(.primary)
                }
                ForEach(Array(T.Reasons.allCases)) { reason in
                    VStack(alignment: .leading) {
                        
                        Toggle(isOn: Binding(
                        
                            get: {
                                return appModel.apiReasons[T.key]?.contains(reason.id) ?? false
                            }, set: { shouldInsert in
                                if !appModel.apiReasons.keys.contains(T.key) {
                                    if shouldInsert {
                                        appModel.apiReasons[T.key] = [reason.id]
                                    }
                                } else {
                                    if shouldInsert {
                                        appModel.apiReasons[T.key]?.append(reason.id)
                                    } else {
                                        appModel.apiReasons[T.key]?.removeAll(where: { reasonID in
                                            reasonID == reason.id
                                        })
                                    }
                                }
                            }
    
                        )) {
                            Text("\(reason.id)")
                                .bold()
                        }
                        DisclosureGroup {
                            Text(reason.description)
                                .foregroundStyle(.secondary)
                                .padding(.vertical, 8)
                        } label: {
                            Text(reason.title)
                                .foregroundStyle(.primary)
                        }
                        Divider()
                    }
                    .padding(.top)
                }
            }
            .padding()
            .frame(maxWidth: .infinity)
        }
    }
}

// MARK: - Preview

#if DEBUG
#Preview {
    RequiredReasonsAPIPane()
        .environment(AppModel())
}
#endif
