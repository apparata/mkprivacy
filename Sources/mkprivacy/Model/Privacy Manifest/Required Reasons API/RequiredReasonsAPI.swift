import Foundation

protocol RequiredReasonsAPI {
    
    associatedtype Reasons: RequiredReason

    static var name: String { get }
    static var key: String { get }
    static var url: URL { get }
}

protocol RequiredReason: Identifiable, CaseIterable, CustomStringConvertible {
    var id: String { get }
    var title: String { get }
}
