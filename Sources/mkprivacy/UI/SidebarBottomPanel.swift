import SwiftUI

struct SidebarBottomPanel: View {

    @Environment(AppModel.self) private var appModel

    var body: some View {
        @Bindable var appModel = appModel
        VStack(spacing: 0) {
            DropArea()
            HStack {
                Toggle(isOn: $appModel.windowIsAlwaysOnTop) {
                    Text("Always on top")
                        .foregroundStyle(Color.secondary)
                }
                .padding()
                Spacer()
            }
        }
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    SidebarBottomPanel()
}
