import Foundation

struct SystemBootTimeAPIs: RequiredReasonsAPI {

    static let name = "System Boot Time"

    static let key = "NSPrivacyAccessedAPICategorySystemBootTime"

    static let url = URL.Docs.fileTimestampAPIs

    enum Reasons: String, RequiredReason {

        /// `35F9.1`
        ///
        /// Declare this reason to access the system boot time in order to measure the amount of time
        /// that has elapsed between events that occurred within the app or to perform calculations to
        /// enable timers.
        ///
        /// Information accessed for this reason, or any derived information, may not be sent off-device.
        /// There is an exception for information about the amount of time that has elapsed between
        /// events that occurred within the app, which may be sent off-device.
        ///
        case measureTimeBetweenEventsOrEnableTimers = "35F9.1"

        /// `8FFB.1`
        ///
        /// Declare this reason to access the system boot time to calculate absolute timestamps for
        /// events that occurred within your app, such as events related to the `UIKit` or `AVFAudio`
        /// frameworks.
        ///
        /// Absolute timestamps for events that occurred within your app may be sent off-device.
        /// System boot time accessed for this reason, or any other information derived from system
        /// boot time, may not be sent off-device.
        ///
        case calculateTimestampsForEventsWithinApp = "8FFB.1"

        /// `3D61.1`
        ///
        /// Declare this reason to include system boot time information in an optional bug report that the
        /// person using the device chooses to submit. The system boot time information must be
        /// prominently displayed to the person as part of the report.
        ///
        /// Information accessed for this reason, or any derived information, may be sent off-device only
        /// after the user affirmatively chooses to submit the specific bug report including system boot
        /// time information, and only for the purpose of investigating or responding to the bug report.
        ///
        case includeTimestampsInBugReportSubmittedByUser = "3D61.1"

        var id: String { self.rawValue }

        var title: String {
            switch self {
            case .measureTimeBetweenEventsOrEnableTimers:
                "Measure time between events or enable timers"
            case .calculateTimestampsForEventsWithinApp:
                "Calculate timestamps for events within app"
            case .includeTimestampsInBugReportSubmittedByUser:
                "Include timestamps in bug report submitted by user"
            }
        }

        var description: String {
            switch self {
            case .measureTimeBetweenEventsOrEnableTimers:
                """
                Declare this reason to access the system boot time in order to measure the amount of time that has elapsed between events that occurred within the app or to perform calculations to enable timers.

                Information accessed for this reason, or any derived information, may not be sent off-device. There is an exception for information about the amount of time that has elapsed between events that occurred within the app, which may be sent off-device.
                """
            case .calculateTimestampsForEventsWithinApp:
                """
                Declare this reason to access the system boot time to calculate absolute timestamps for events that occurred within your app, such as events related to the `UIKit` or `AVFAudio` frameworks.

                Absolute timestamps for events that occurred within your app may be sent off-device. System boot time accessed for this reason, or any other information derived from system boot time, may not be sent off-device.
                """
            case .includeTimestampsInBugReportSubmittedByUser:
                """
                Declare this reason to include system boot time information in an optional bug report that the person using the device chooses to submit. The system boot time information must be prominently displayed to the person as part of the report.

                Information accessed for this reason, or any derived information, may be sent off-device only after the user affirmatively chooses to submit the specific bug report including system boot time information, and only for the purpose of investigating or responding to the bug report.
                """
            }
        }
    }
}
