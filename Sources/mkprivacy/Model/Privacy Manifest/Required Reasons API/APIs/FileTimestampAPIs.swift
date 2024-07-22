import Foundation

struct FileTimestampAPIs: RequiredReasonsAPI {

    static let name = "File Timestamp"
    
    static let key = "NSPrivacyAccessedAPICategoryFileTimestamp"

    static let icon = "doc.badge.clock.fill"

    static let url = URL.Docs.fileTimestampAPIs

    enum Reasons: String, RequiredReason {

        /// `DDA9.1`
        ///
        /// Declare this reason to display file timestamps to the person using the device.
        ///
        /// Information accessed for this reason, or any derived information, may not be sent off-device.
        ///
        case displayFileTimestampsToUser = "DDA9.1"

        /// `C617.1`
        ///
        /// Declare this reason to access the timestamps, size, or other metadata of files inside the app
        /// container, app group container, or the app’s CloudKit container.
        ///
        case accessMetadataOfFilesInAppContainer = "C617.1"

        /// `3B52.1`
        ///
        /// Declare this reason to access the timestamps, size, or other metadata of files or directories
        /// that the user specifically granted access to, such as using a document picker view controller.
        ///
        case accessMetadataOfFilesThatUserGrantedAccessTo = "3B52.1"

        /// `0A2A.1`
        ///
        /// Declare this reason if your third-party SDK is providing a wrapper function around file
        /// timestamp API(s) for the app to use, and you only access the file timestamp APIs when
        /// the app calls your wrapper function. This reason may only be declared by third-party SDKs.
        /// 
        /// This reason may not be declared if your third-party SDK was created primarily to wrap
        /// required reason API(s).
        ///
        case provideSDKWrapperFunctionsAroundAPIs = "0A2A.1"

        var id: String { self.rawValue }

        var title: String {
            switch self {
            case .displayFileTimestampsToUser:
                "Display file timestamps to user"
            case .accessMetadataOfFilesInAppContainer:
                "Access metadata of files in app container"
            case .accessMetadataOfFilesThatUserGrantedAccessTo:
                "Access metadata of files with user granted access"
            case .provideSDKWrapperFunctionsAroundAPIs:
                "Provide SDK wrapper functions around APIs"
            }
        }

        var description: String {
            switch self {
            case .displayFileTimestampsToUser:
                """
                Declare this reason to display file timestamps to the person using the device.

                Information accessed for this reason, or any derived information, may not be sent off-device.
                """
            case .accessMetadataOfFilesInAppContainer:
                """
                Declare this reason to access the timestamps, size, or other metadata of files inside the app container, app group container, or the app’s CloudKit container.
                """
            case .accessMetadataOfFilesThatUserGrantedAccessTo:
                """
                Declare this reason to access the timestamps, size, or other metadata of files or directories that the user specifically granted access to, such as using a document picker view controller.
                """
            case .provideSDKWrapperFunctionsAroundAPIs:
                """
                Declare this reason if your third-party SDK is providing a wrapper function around file timestamp API(s) for the app to use, and you only access the file timestamp APIs when the app calls your wrapper function. This reason may only be declared by third-party SDKs.

                This reason may not be declared if your third-party SDK was created primarily to wrap required reason API(s).
                """
            }
        }
    }
}

