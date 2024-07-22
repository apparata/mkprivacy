import SwiftUI

// MARK: - Always on Top

/// Set this view as a background on e.g. the main view.
struct AlwaysOnTop: View {

    static let settingsKey = "window.setting.isAlwaysOnTop"
    
    @AppStorage(Self.settingsKey) var isAlwaysOnTop: Bool = true

    @State var window: NSWindow?

    var body: some View {
        WindowReflection(window: $window)
            .onReceive(window.publisher) { window in
                window.alwaysOnTop = isAlwaysOnTop
            }
            .onChange(of: isAlwaysOnTop) { _, isOnTop in
                window?.alwaysOnTop = isOnTop
            }
    }
}

// MARK: - Always on Top Command

struct AlwaysOnTopCommand: Commands {
    
    var body: some Commands {
        CommandGroup(after: .windowArrangement) {
            // There is a SwiftUI bug that keeps the checkmark from updating.
            AlwaysOnTopCheckbox("Toggle Always on Top")
        }
    }
}

// MARK: - Always on Top Checkbox

struct AlwaysOnTopCheckbox: View {
    
    let title: LocalizedStringKey
    
    @AppStorage(AlwaysOnTop.settingsKey) var isAlwaysOnTop: Bool = true
    
    init(_ title: LocalizedStringKey = "Always on top") {
        self.title = title
    }
    
    var body: some View {
        Toggle(title, isOn: $isAlwaysOnTop)
            .toggleStyle(CheckboxToggleStyle())
    }
}

// MARK: - Preview

struct AlwaysOnTopCheckbox_Previews: PreviewProvider {
    static var previews: some View {
        AlwaysOnTopCheckbox()
    }
}
