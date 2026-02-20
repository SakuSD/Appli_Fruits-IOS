import Foundation

struct Fruit: Identifiable, Codable {
    let id = UUID()
    let title: String
    let headline: String
    let image: String
    let description: String
    let nutrition: [String]
    let colorLight: String
    let colorDark: String
}
