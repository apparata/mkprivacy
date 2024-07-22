import Foundation

struct UserDefaultsAPIs: RequiredReasonsAPI {

    var id: String { Self.key }
    var name: String { Self.name }

    static let name = "User Defaults"

    static let key = "NSPrivacyAccessedAPICategoryUserDefaults"

    static let url = URL.Docs.userDefaultsAPIs

    enum Reasons: String, RequiredReason {

        /// `CA92.1`
        ///
        /// Declare this reason to access user defaults to read and write information that is only
        /// accessible to the app itself.
        ///
        /// This reason does not permit reading information that was written by other apps or the system,
        /// or writing information that can be accessed by other apps.
        ///
        case readWriteInfoThatIsOnlyAccessibleToApp = "CA92.1"

        /// `1C8F.1`
        ///
        /// Declare this reason to access user defaults to read and write information that is only
        /// accessible to the apps, app extensions, and App Clips that are members of the same
        /// App Group as the app itself.
        ///
        /// This reason does not permit reading information that was written by apps, app extensions,
        /// or App Clips outside the same App Group or by the system. Your app is not responsible if
        /// the system provides information from the global domain because a key is not present in your
        /// requested domain while your app is attempting to read information that apps, app extensions,
        /// or App Clips in your app’s App Group write.
        ///
        /// This reason also does not permit writing information that can be accessed by apps, app
        /// extensions, or App Clips outside the same App Group.
        ///
        case readWriteInfoThatIsOnlyAccessibleToAppGroup = "1C8F.1"

        /// `C56D.1`
        ///
        /// Declare this reason if your third-party SDK is providing a wrapper function around user
        /// defaults API(s) for the app to use, and you only access the user defaults APIs when the app
        /// calls your wrapper function. This reason may only be declared by third-party SDKs. This
        /// reason may not be declared if your third-party SDK was created primarily to wrap required
        /// reason API(s).
        ///
        /// Information accessed for this reason, or any derived information, may not be used for your
        /// third-party SDK’s own purposes or sent off-device by your third-party SDK.
        ///
        case provideSDKWrapperFunctionsAroundAPIs = "C56D.1"

        /// `AC6B.1`
        ///
        /// Declare this reason to access user defaults to read the com.apple.configuration.managed key
        /// to retrieve the managed app configuration set by MDM, or to set the
        /// `com.apple.feedback.managed` key to store feedback information to be queried over
        /// MDM, as described in the Apple Mobile Device Management Protocol Reference
        /// documentation.
        ///
        case readManagedKeyToRetrieveMDMAppConfiguration = "AC6B.1"

        var id: String { self.rawValue }

        var title: String {
            switch self {
            case .readWriteInfoThatIsOnlyAccessibleToApp:
                "Read and write info that is only accessible to app"
            case .readWriteInfoThatIsOnlyAccessibleToAppGroup:
                "Read and write info that is only accessible to app group"
            case .provideSDKWrapperFunctionsAroundAPIs:
                "Provide SDK wrapper functions around APIs"
            case .readManagedKeyToRetrieveMDMAppConfiguration:
                "Read managed key to retrieve MDM app configuration"
            }
        }

        var description: String {
            switch self {
            case .readWriteInfoThatIsOnlyAccessibleToApp:
                """
                Declare this reason to access user defaults to read and write information that is only accessible to the app itself.

                This reason does not permit reading information that was written by other apps or the system, or writing information that can be accessed by other apps.
                """
            case .readWriteInfoThatIsOnlyAccessibleToAppGroup:
                """
                Declare this reason to access user defaults to read and write information that is only accessible to the apps, app extensions, and App Clips that are members of the same App Group as the app itself.

                This reason does not permit reading information that was written by apps, app extensions, or App Clips outside the same App Group or by the system. Your app is not responsible if the system provides information from the global domain because a key is not present in your requested domain while your app is attempting to read information that apps, app extensions, or App Clips in your app’s App Group write.

                This reason also does not permit writing information that can be accessed by apps, app extensions, or App Clips outside the same App Group.
                """
            case .provideSDKWrapperFunctionsAroundAPIs:
                """
                Declare this reason if your third-party SDK is providing a wrapper function around user defaults API(s) for the app to use, and you only access the user defaults APIs when the app calls your wrapper function. This reason may only be declared by third-party SDKs. This reason may not be declared if your third-party SDK was created primarily to wrap required reason API(s).

                Information accessed for this reason, or any derived information, may not be used for your third-party SDK’s own purposes or sent off-device by your third-party SDK.
                """
            case .readManagedKeyToRetrieveMDMAppConfiguration:
                """
                Declare this reason to access user defaults to read the `com.apple.configuration.managed` key to retrieve the managed app configuration set by MDM, or to set the `com.apple.feedback.managed` key to store feedback information to be queried over MDM, as described in the Apple Mobile Device Management Protocol Reference documentation.
                """
            }
        }
    }
}
