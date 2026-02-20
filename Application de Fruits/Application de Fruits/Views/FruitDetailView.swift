import SwiftUI

struct FruitDetailView: View {
    
    let fruit: Fruit
    
    var body: some View {
        
        ScrollView(.vertical, showsIndicators: false) {
            
            VStack(spacing: 0) {
                
                // 🔝 HEADER COLORÉ
                VStack {
                    Image(fruit.image)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 250)
                        .shadow(radius: 20)
                        .padding(.vertical, 40)
                }
                .frame(maxWidth: .infinity)
                .background(
                    LinearGradient(
                        colors: [
                            Color(fruit.colorLight),
                            Color(fruit.colorDark)
                        ],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
                
                // ⬜ SECTION BLANCHE
                VStack(alignment: .leading, spacing: 20) {
                    
                    // Titre principal
                    Text(fruit.title)
                        .font(.largeTitle)
                        .bold()
                    
                    // Headline
                    Text(fruit.headline)
                        .font(.headline)
                        .foregroundColor(.gray)
                    
                    Divider()
                    
                    // 📊 Nutrition (horizontal scroll)
                    Text("Nutrition")
                        .font(.title2)
                        .bold()
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 15) {
                            ForEach(fruit.nutrition, id: \.self) { item in
                                Text(item)
                                    .font(.subheadline)
                                    .padding()
                                    .background(Color.gray.opacity(0.1))
                                    .cornerRadius(10)
                            }
                        }
                    }
                    
                    Divider()
                    
                    // 📖 Description complète
                    Text("About \(fruit.title)")
                        .font(.title2)
                        .bold()
                    
                    Text(fruit.description)
                        .font(.body)
                        .foregroundColor(.secondary)
                        .multilineTextAlignment(.leading)
                        .padding(.bottom, 40)
                    
                }
                .padding(25)
                .background(Color.white)
            }
        }
        .ignoresSafeArea(edges: .top)
        .navigationBarTitleDisplayMode(.inline)
    }
}
