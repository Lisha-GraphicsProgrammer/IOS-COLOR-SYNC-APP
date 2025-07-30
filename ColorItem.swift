import Foundation
struct ColorItem: Identifiable, Codable {
    let id: UUID
    let hex: String
    let timestamp: Date
}
