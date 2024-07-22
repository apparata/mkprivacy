import SwiftUI

struct MainWindow: Scene {

    var body: some Scene {
        WindowGroup {
            WindowWrapper()
                .frame(minWidth: 850, maxWidth: 850,
                       minHeight: 500, maxHeight: 1000)
        }
        .windowResizability(.contentSize)
    }
}

struct WindowWrapper: View {

    @StateObject private var windowModelHolder = WindowModelHolder()

    var body: some View {
        MainWindowContent()
            .environment(windowModelHolder.appModel)
    }
}

struct MainWindowContent: View {

    @Environment(AppModel.self) private var appModel

    var body: some View {
        MainView()
            .background {
                if appModel.windowIsAlwaysOnTop {
                    AlwaysOnTop()
                }
            }
    }
}

class WindowModelHolder: ObservableObject {

    let appModel: AppModel

    init() {
        appModel = AppModel()
    }
}
