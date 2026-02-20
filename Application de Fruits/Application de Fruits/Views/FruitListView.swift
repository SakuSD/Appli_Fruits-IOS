import SwiftUI

struct FruitListView: View {
    
    @StateObject var viewModel = FruitViewModel()
    @State private var showSettings = false
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 20) {
                    
                    ForEach(viewModel.fruits) { fruit in
                        
                        NavigationLink(destination: FruitDetailView(fruit: fruit)) {
                            
                            HStack(spacing: 15) {
                                
                                Image(fruit.image)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 80, height: 80)
                                    .clipShape(RoundedRectangle(cornerRadius: 15))
                                
                                VStack(alignment: .leading, spacing: 5) {
                                    
                                    Text(fruit.title)
                                        .font(.headline)
                                        .foregroundColor(.white)
                                    
                                    Text(fruit.headline)
                                        .font(.subheadline)
                                        .foregroundColor(.white.opacity(0.9))
                                }
                                
                                Spacer()
                            }
                            .padding()
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
                            .cornerRadius(20)
                            .shadow(radius: 5)
                        }
                    }
                }
                .padding()
            }
            .navigationTitle("Fruits")
            .toolbar {
                Button("Settings") {
                    showSettings.toggle()
                }
            }
            .sheet(isPresented: $showSettings) {
                SettingsView()
            }
        }
    }
}
