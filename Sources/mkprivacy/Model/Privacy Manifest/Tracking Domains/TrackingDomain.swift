import Foundation

struct TrackingDomain: Identifiable, Codable {

    let id: UUID
    var domain: String

    init(id: UUID = UUID(), _ domain: String) {
        self.id = id
        self.domain = domain
    }

    init(from decoder: any Decoder) throws {
        let container = try decoder.singleValueContainer()
        id = UUID()
        domain = try container.decode(String.self)
    }

    func encode(to encoder: any Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(domain)
    }
}
