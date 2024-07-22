import Foundation

struct ActiveKeyboardAPIs: RequiredReasonsAPI {

    static let name = "Active Keyboard"

    static let key = "NSPrivacyAccessedAPICategoryActiveKeyboards"

    static let url = URL.Docs.activeKeyboardAPIs

    enum Reasons: String, RequiredReason {

        /// `3EC4.1`
        ///
        /// Declare this reason if your app is a custom keyboard app, and you access this API category
        /// to determine the keyboards that are active on the device.
        ///
        /// Providing a systemwide custom keyboard to the user must be the primary functionality
        /// of the app.
        ///
        /// Information accessed for this reason, or any derived information, may not be sent off-device.
        ///
        case appIsCustomKeyboardApp = "3EC4.1"

        /// `54BD.1`
        ///
        /// Declare this reason to access active keyboard information to present the correct customized
        /// user interface to the person using the device. The app must have text fields for entering or
        /// editing text and must behave differently based on active keyboards in a way that is
        /// observable to users.
        ///
        /// Information accessed for this reason, or any derived information, may not be sent off-device.
        ///
        case presentCorrectCustomizedUI = "54BD.1"

        var id: String { self.rawValue }

        var title: String {
            switch self {
            case .appIsCustomKeyboardApp:
                "App is custom keyboard app"
            case .presentCorrectCustomizedUI:
                "Present correct customized UI"
            }
        }

        var description: String {
            switch self {
            case .appIsCustomKeyboardApp:
                """
                Declare this reason if your app is a custom keyboard app, and you access this API category to determine the keyboards that are active on the device.

                Providing a systemwide custom keyboard to the user must be the primary functionality of the app.

                Information accessed for this reason, or any derived information, may not be sent off-device.
                """
            case .presentCorrectCustomizedUI:
                """
                Declare this reason to access active keyboard information to present the correct customized user interface to the person using the device. The app must have text fields for entering or editing text and must behave differently based on active keyboards in a way that is observable to users.

                Information accessed for this reason, or any derived information, may not be sent off-device.
                """
            }
        }
    }
}
