import Foundation

class FruitViewModel: ObservableObject {
    
    @Published var fruits: [Fruit] = []
    
    init() {
        loadFruits()
    }
    
    func loadFruits() {
        guard let url = Bundle.main.url(forResource: "FruitsData", withExtension: "plist"),
              let data = try? Data(contentsOf: url),
              let decodedFruits = try? PropertyListDecoder().decode([Fruit].self, from: data) else {
            print("Error loading plist")
            return
        }
        
        fruits = decodedFruits
    }
}
