import SwiftUI

struct CollectedDataTypesPane: View {

    @Environment(AppModel.self) private var appModel

    var body: some View {
        @Bindable var appModel = appModel
        HSplitView() {
            List(selection: $appModel.selectedCollectionCategory) {
                Section("Category") {
                    ForEach(CollectionCategory.allCases) { category in
                        categoryItem(category)
                    }
                }
            }
            .listStyle(.sidebar)
            .scrollContentBackground(.hidden)
            .frame(width: 196)
            .frame(maxHeight: .infinity)
            VStack {
                if let category = appModel.selectedCollectionCategory {
                    CollectionCategorySelector(for: category)
                } else {
                    ContentUnavailableView {
                        Label("No category selected", systemImage: "cylinder.split.1x2")
                    } description: {
                        Text("Select a category to specify collected data types.")
                    }
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }

    @ViewBuilder private func categoryItem(_ category: CollectionCategory) -> some View {
        Label(category.description, systemImage: category.icon)
            .imageScale(.small)
            .badge(badge(for: category))
            .tag(category)
    }

    private func badge(for category: CollectionCategory) -> Int {
        switch category {
        case .contactInfo:
            let keys = Set(ContactInfoCategory.allCases.map { $0.id })
            return appModel.dataTypes.filter { keys.contains($0.key) }.count
        case .healthAndFitness:
            let keys = Set(HealthAndFitnessCategory.allCases.map { $0.id })
            return appModel.dataTypes.filter { keys.contains($0.key) }.count
        case .financialInfo:
            let keys = Set(FinancialInfoCategory.allCases.map { $0.id })
            return appModel.dataTypes.filter { keys.contains($0.key) }.count
        case .locationInfo:
            let keys = Set(LocationInfoCategory.allCases.map { $0.id })
            return appModel.dataTypes.filter { keys.contains($0.key) }.count
        case .sensitiveInfo:
            let keys = Set(SensitiveInfoCategory.allCases.map { $0.id })
            return appModel.dataTypes.filter { keys.contains($0.key) }.count
        case .contactsInfo:
            let keys = Set(ContactsInfoCategory.allCases.map { $0.id })
            return appModel.dataTypes.filter { keys.contains($0.key) }.count
        case .userContent:
            let keys = Set(UserContentCategory.allCases.map { $0.id })
            return appModel.dataTypes.filter { keys.contains($0.key) }.count
        case .browsingHistory:
            let keys = Set(BrowsingHistoryCategory.allCases.map { $0.id })
            return appModel.dataTypes.filter { keys.contains($0.key) }.count
        case .searchHistory:
            let keys = Set(SearchHistoryCategory.allCases.map { $0.id })
            return appModel.dataTypes.filter { keys.contains($0.key) }.count
        case .identifiers:
            let keys = Set(IdentifiersCategory.allCases.map { $0.id })
            return appModel.dataTypes.filter { keys.contains($0.key) }.count
        case .purchases:
            let keys = Set(PurchasesCategory.allCases.map { $0.id })
            return appModel.dataTypes.filter { keys.contains($0.key) }.count
        case .usageData:
            let keys = Set(UsageDataCategory.allCases.map { $0.id })
            return appModel.dataTypes.filter { keys.contains($0.key) }.count
        case .diagnostics:
            let keys = Set(DiagnosticsCategory.allCases.map { $0.id })
            return appModel.dataTypes.filter { keys.contains($0.key) }.count
        case .surroundings:
            let keys = Set(SurroundingsCategory.allCases.map { $0.id })
            return appModel.dataTypes.filter { keys.contains($0.key) }.count
        case .body:
            let keys = Set(BodyCategory.allCases.map { $0.id })
            return appModel.dataTypes.filter { keys.contains($0.key) }.count
        case .otherDataTypes:
            let keys = Set(OtherDataTypesCategory.allCases.map { $0.id })
            return appModel.dataTypes.filter { keys.contains($0.key) }.count
        }
    }
}

struct CollectionCategorySelector: View {

    let category: CollectionCategory

    init(for category: CollectionCategory) {
        self.category = category
    }

    var body: some View {
        let title = category.description
        switch category {
        case .contactInfo:
            CollectedDataTypeEntry<ContactInfoCategory>(title: title)
        case .healthAndFitness:
            CollectedDataTypeEntry<HealthAndFitnessCategory>(title: title)
        case .financialInfo:
            CollectedDataTypeEntry<FinancialInfoCategory>(title: title)
        case .locationInfo:
            CollectedDataTypeEntry<LocationInfoCategory>(title: title)
        case .sensitiveInfo:
            CollectedDataTypeEntry<SensitiveInfoCategory>(title: title)
        case .contactsInfo:
            CollectedDataTypeEntry<ContactsInfoCategory>(title: title)
        case .userContent:
            CollectedDataTypeEntry<UserContentCategory>(title: title)
        case .browsingHistory:
            CollectedDataTypeEntry<BrowsingHistoryCategory>(title: title)
        case .searchHistory:
            CollectedDataTypeEntry<SearchHistoryCategory>(title: title)
        case .identifiers:
            CollectedDataTypeEntry<IdentifiersCategory>(title: title)
        case .purchases:
            CollectedDataTypeEntry<PurchasesCategory>(title: title)
        case .usageData:
            CollectedDataTypeEntry<UsageDataCategory>(title: title)
        case .diagnostics:
            CollectedDataTypeEntry<DiagnosticsCategory>(title: title)
        case .surroundings:
            CollectedDataTypeEntry<SurroundingsCategory>(title: title)
        case .body:
            CollectedDataTypeEntry<BodyCategory>(title: title)
        case .otherDataTypes:
            CollectedDataTypeEntry<OtherDataTypesCategory>(title: title)
        }
    }
}

struct CollectedDataTypeEntry<T: CollectedCategory>: View {

    @Environment(AppModel.self) private var appModel

    let title: String

    var body: some View {
        @Bindable var appModel = appModel
        ScrollView(.vertical) {
            VStack(alignment: .leading, spacing: 0) {
                HStack {
                    Text("\(title)")
                        .font(.title2)
                        .bold()
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Spacer()
                    Link(destination: .Docs.dataUserCategories) {
                        Image(systemName: "questionmark.circle")
                    }
                    .foregroundStyle(Color.primary)
                }
                ForEach(Array(T.allCases)) { dataType in
                    VStack(alignment: .leading) {
                        Toggle(
                            isOn: Binding(
                                
                                get: {
                                    return appModel.dataTypes[dataType.id] != nil
                                },
                                set: { isChecked in
                                    withAnimation {
                                        if isChecked {
                                            appModel.dataTypes[dataType.id] = CollectedDataType(
                                                type: dataType.id,
                                                isLinked: false,
                                                isTracking: false,
                                                purposes: []
                                            )
                                        } else {
                                            appModel.dataTypes.removeValue(forKey: dataType.id)
                                        }
                                    }
                                }
                                
                            )
                        ) {
                            Text("\(dataType.title)")
                                .font(.headline)
                                .fontWeight(.medium)
                        }

                        Text(dataType.description)
                            .foregroundStyle(.secondary)
                        if appModel.dataTypes[dataType.id] != nil {
                            usageBox(for: dataType)
                            purposeBox(for: dataType)
                        }

                        Divider()
                            .padding(.top, 8)
                    }
                    .padding(.top)
                }
            }
            .padding()
            .frame(maxWidth: .infinity)
        }
    }

    @ViewBuilder private func usageBox(for dataType: T) -> some View {
        @Bindable var appModel = appModel
        GroupBox("Usage") {
            Grid(alignment: .leading, horizontalSpacing: 0) {
                GridRow {
                    HStack {
                        Toggle(isOn:

                                Binding(
                                    get: {
                                        return appModel.dataTypes[dataType.id]?.isLinked ?? false
                                    }, set: { isChecked in
                                        if appModel.dataTypes[dataType.id] == nil {
                                            if isChecked {
                                                appModel.dataTypes[dataType.id] = CollectedDataType(
                                                    type: dataType.id,
                                                    isLinked: isChecked,
                                                    isTracking: false,
                                                    purposes: []
                                                )
                                            }
                                        } else {
                                            appModel.dataTypes[dataType.id]?.isLinked = isChecked
                                        }
                                    }
                                )

                        ) {
                            Text("Linked to user's identity")
                        }
                        Spacer()
                    }
                    HStack {
                        Toggle(isOn:

                                Binding(
                                    get: {
                                        return appModel.dataTypes[dataType.id]?.isTracking ?? false
                                    }, set: { isChecked in
                                        if appModel.dataTypes[dataType.id] == nil {
                                            if isChecked {
                                                appModel.dataTypes[dataType.id] = CollectedDataType(
                                                    type: dataType.id,
                                                    isLinked: false,
                                                    isTracking: isChecked,
                                                    purposes: []
                                                )
                                            }
                                        } else {
                                            appModel.dataTypes[dataType.id]?.isTracking = isChecked
                                        }
                                    }
                                )

                        ) {
                            Text("Used for tracking")
                        }
                        Spacer()
                    }
                }
            }
            .frame(maxWidth: .infinity)
            .padding(4)
        }
        .padding(.top, 4)
        .padding(.bottom, 8)
    }

    @ViewBuilder private func purposeBox(for dataType: T) -> some View {
        @Bindable var appModel = appModel
        GroupBox(label: purposeBoxTitle(for: dataType)) {
            Grid(alignment: .leading, verticalSpacing: 8) {
                GridRow {
                    purposeToggle(for: .thirdPartyAdvertising, title: "3rd-party ads", dataType: dataType)
                    purposeToggle(for: .developerAdvertising, title: "Developer ads", dataType: dataType)
                }
                GridRow {
                    purposeToggle(for: .analytics, title: "Analytics", dataType: dataType)
                    purposeToggle(for: .productPersonalization, title: "Product personalization", dataType: dataType)
                }
                GridRow {
                    purposeToggle(for: .appFunctionality, title: "App functionality", dataType: dataType)
                    purposeToggle(for: .other, title: "Other", dataType: dataType)
                }
            }
            .padding(4)
            .frame(maxWidth: .infinity)
        }
        .padding(.bottom, 8)
    }

    @ViewBuilder private func purposeBoxTitle(for dataType: T) -> some View {
        if appModel.dataTypes[dataType.id]?.purposes.isEmpty ?? true {
            Text("\(Image(systemName: "exclamationmark.triangle.fill")) Purpose (required)").foregroundStyle(Color.yellow)
        } else {
            Text("Purpose")
        }
    }

    @ViewBuilder private func purposeToggle(for purpose: CollectionPurposes, title: String, dataType: T) -> some View {
        @Bindable var appModel = appModel
        HStack(spacing: 0) {
            Toggle(isOn:

                    Binding(
                        get: {
                            return appModel.dataTypes[dataType.id]?.purposes.contains(purpose.id) ?? false
                        }, set: { shouldInsert in

                            withAnimation {
                                if appModel.dataTypes[dataType.id] == nil {
                                    if shouldInsert {
                                        appModel.dataTypes[dataType.id] = CollectedDataType(
                                            type: dataType.id,
                                            isLinked: false,
                                            isTracking: false,
                                            purposes: [purpose.id]
                                        )
                                    }
                                } else {
                                    if appModel.dataTypes[dataType.id]?.purposes.contains(purpose.id) ?? false {
                                        if !shouldInsert {
                                            appModel.dataTypes[dataType.id]?.purposes.removeAll(where: { purposeID in
                                                purposeID == purpose.id
                                            })
                                        }
                                    } else {
                                        if shouldInsert {
                                            appModel.dataTypes[dataType.id]?.purposes.append(purpose.id)
                                        }
                                    }
                                }
                            }
                        }
                    )

            ) {
                Text(title)
            }
            Image(systemName: "info.circle")
                .imageScale(.small)
                .foregroundStyle(.secondary)
                .padding(.leading, 4)
                .onHover { isHovering in
                    if isHovering {
                        appModel.hoveredPurpose = purpose
                    } else {
                        appModel.hoveredPurpose = nil
                    }
                }
                .popover(item: Binding(get: {
                    if appModel.hoveredPurpose == purpose {
                        return purpose
                    } else {
                        return nil
                    }
                }, set: { value in
                    appModel.hoveredPurpose = value
                }), arrowEdge: .trailing) { purpose in
                    PopoverContainer {
                        VStack(alignment: .leading, spacing: 8) {
                            Text(purpose.title)
                                .font(.title2)
                                .bold()
                            Text(purpose.description)
                                .multilineTextAlignment(.leading)
                                .lineLimit(nil)
                                .frame(width: 250, alignment: .leading)
                        }
                    }
                    .padding()
                }
            Spacer(minLength: 0)
        }
    }
}

struct PopoverContainer: Layout {
    func sizeThatFits(
        proposal: ProposedViewSize,
        subviews: Subviews,
        cache: inout ()
    ) -> CGSize {
        guard subviews.count == 1 else {
            fatalError()
        }
        var p = proposal
        p.width = p.width ?? 300
        p.height = p.height ?? 300

        return subviews[0].sizeThatFits(p)
    }

    func placeSubviews(
        in bounds: CGRect,
        proposal: ProposedViewSize,
        subviews: Subviews,
        cache: inout ()
    ) {
        // Go with default
    }
}

// MARK: - Preview

#if DEBUG
#Preview {
    CollectedDataTypesPane()
        .environment(AppModel())
}
#endif
