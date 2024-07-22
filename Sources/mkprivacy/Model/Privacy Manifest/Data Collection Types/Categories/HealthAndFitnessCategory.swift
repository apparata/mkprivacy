import Foundation

// MARK: - Health and Fitness

/// An enum representing various types of health and fitness information.
enum HealthAndFitnessCategory: String, Codable, CollectedCategory {
    /// Health and medical data, including but not limited to data from the Clinical Health Records API,
    /// HealthKit API, Movement Disorder APIs, or health-related human subject research or any other user
    /// provided health or medical data.
    case health = "NSPrivacyCollectedDataTypeHealth"

    /// Fitness and exercise data, including but not limited to the Motion and Fitness API.
    case fitness = "NSPrivacyCollectedDataTypeFitness"

    var id: String { rawValue }

    var title: String {
        switch self {
        case .health:
            "Health"
        case .fitness:
            "Fitness"
        }
    }

    var description: String {
        switch self {
        case .health:
            return "Health and medical data, including but not limited to data from the Clinical Health Records API, HealthKit API, Movement Disorder APIs, or health-related human subject research or any other user provided health or medical data."
        case .fitness:
            return "Fitness and exercise data, including but not limited to the Motion and Fitness API."
        }
    }
}
