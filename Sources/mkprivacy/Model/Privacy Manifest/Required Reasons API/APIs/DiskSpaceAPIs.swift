import Foundation

struct DiskSpaceAPIs: RequiredReasonsAPI {

    static let name = "Disk Space"

    static let key = "NSPrivacyAccessedAPICategoryDiskSpace"

    static let icon = "internaldrive.fill"

    static let url = URL.Docs.diskSpaceAPIs

    enum Reasons: String, RequiredReason {

        /// `85F4.1`
        ///
        /// Declare this reason to display disk space information to the person using the device. Disk
        /// space may be displayed in units of information (such as bytes) or units of time combined with
        /// a media type (such as minutes of HD video).
        ///
        /// Information accessed for this reason, or any derived information, may not be sent off-device.
        /// There is an exception that allows the app to send disk space information over the local
        /// network to another device operated by the same person only for the purpose of displaying
        /// disk space information on that device; this exception only applies if the user has provided
        /// explicit permission to send disk space information, and the information may not be sent
        /// over the Internet.
        ///
        case displayDiskSpaceInfoToUser = "85F4.1"

        /// `E174.1`
        ///
        /// Declare this reason to check whether there is sufficient disk space to write files, or to check
        /// whether the disk space is low so that the app can delete files when the disk space is low.
        /// The app must behave differently based on disk space in a way that is observable to users.
        ///
        /// Information accessed for this reason, or any derived information, may not be sent off-device.
        /// There is an exception that allows the app to avoid downloading files from a server when disk
        /// space is insufficient.
        ///
        case checkIfEnoughDiskSpaceToWriteFiles = "E174.1"

        /// `7D9E.1`
        ///
        /// Declare this reason to include disk space information in an optional bug report that the
        /// person using the device chooses to submit. The disk space information must be prominently
        /// displayed to the person as part of the report.
        ///
        /// Information accessed for this reason, or any derived information, may be sent off-device only
        /// after the user affirmatively chooses to submit the specific bug report including disk space
        /// information, and only for the purpose of investigating or responding to the bug report.
        ///
        case includeDiskSpaceInfoInBugReports = "7D9E.1"

        /// `B728.1`
        ///
        /// Declare this reason if your app is a health research app, and you access this API category
        /// to detect and inform research participants about low disk space impacting the research data
        /// collection.
        ///
        /// Your app must comply with App Store Review Guideline §5.1.3. Your app must not offer any
        /// functionality other than providing information about and allowing people to participate in
        /// health research.
        ///
        case healthResearchApp = "B728.1"

        var id: String { self.rawValue }

        var title: String {
            switch self {
            case .displayDiskSpaceInfoToUser:
                "Display disk space info to user"
            case .checkIfEnoughDiskSpaceToWriteFiles:
                "Check if enough dispace to write files"
            case .includeDiskSpaceInfoInBugReports:
                "Include disk space info in bug reports"
            case .healthResearchApp:
                "App is a health research app"
            }
        }

        var description: String {
            switch self {
            case .displayDiskSpaceInfoToUser:
                """
                Declare this reason to display disk space information to the person using the device. Disk space may be displayed in units of information (such as bytes) or units of time combined with a media type (such as minutes of HD video).

                Information accessed for this reason, or any derived information, may not be sent off-device. There is an exception that allows the app to send disk space information over the local network to another device operated by the same person only for the purpose of displaying disk space information on that device; this exception only applies if the user has provided explicit permission to send disk space information, and the information may not be sent over the Internet.
                """
            case .checkIfEnoughDiskSpaceToWriteFiles:
                """
                Declare this reason to check whether there is sufficient disk space to write files, or to check whether the disk space is low so that the app can delete files when the disk space is low. The app must behave differently based on disk space in a way that is observable to users.

                Information accessed for this reason, or any derived information, may not be sent off-device. There is an exception that allows the app to avoid downloading files from a server when disk space is insufficient.
                """
            case .includeDiskSpaceInfoInBugReports:
                """
                Declare this reason to include disk space information in an optional bug report that the person using the device chooses to submit. The disk space information must be prominently displayed to the person as part of the report.

                Information accessed for this reason, or any derived information, may be sent off-device only after the user affirmatively chooses to submit the specific bug report including disk space information, and only for the purpose of investigating or responding to the bug report.
                """
            case .healthResearchApp:
                """
                Declare this reason if your app is a health research app, and you access this API category to detect and inform research participants about low disk space impacting the research data collection.

                Your app must comply with App Store Review Guideline §5.1.3. Your app must not offer any functionality other than providing information about and allowing people to participate in health research.
                """
            }
        }
    }
}
