import Foundation

// MARK: - Diagnostics

/// An enum representing various types of diagnostic information.
enum DiagnosticsCategory: String, Codable, CollectedCategory {
    /// Such as crash logs.
    case crashData = "NSPrivacyCollectedDataTypeCrashData"

    /// Such as launch time, hang rate, or energy use.
    case performanceData = "NSPrivacyCollectedDataTypePerformanceData"

    /// Any other data collected for the purposes of measuring technical diagnostics related to the app.
    case otherDiagnosticData = "NSPrivacyCollectedDataTypeOtherDiagnosticData"

    var id: String { rawValue }

    var title: String {
        switch self {
        case .crashData:
            "Crash data"
        case .performanceData:
            "Performance data"
        case .otherDiagnosticData:
            "Other diagnostic data"
        }
    }

    var description: String {
        switch self {
        case .crashData:
            return "Such as crash logs."
        case .performanceData:
            return "Such as launch time, hang rate, or energy use."
        case .otherDiagnosticData:
            return "Any other data collected for the purposes of measuring technical diagnostics related to the app."
        }
    }
}
