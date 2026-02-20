//
//  FruitSliderView.swift
//  Application de Fruits
//
//  Created by COURS on 20/02/2026.
//

import SwiftUI

struct FruitSliderView: View {
    
    @StateObject var viewModel = FruitViewModel()
    
    var body: some View {
        TabView {
            ForEach(viewModel.fruits) { fruit in
                ZStack {
                    // Gradient background
                    LinearGradient(
                        colors: [Color(fruit.colorLight), Color(fruit.colorDark)],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                    .ignoresSafeArea()
                    
                    VStack(spacing: 20) {
                        Spacer()
                        
                        Text(fruit.title)
                            .font(.largeTitle)
                            .bold()
                            .foregroundColor(.white)
                        
                        Image(fruit.image)
                            .resizable()
                            .scaledToFit()
                            .frame(height: 250)
                            .shadow(radius: 10)
                        
                        Text(fruit.description)
                            .font(.body)
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal, 20)
                        
                        Spacer()
                        
                        NavigationLink(destination: FruitDetailView(fruit: fruit)) {
                            Text("Learn More")
                                .font(.headline)
                                .padding()
                                .frame(width: 180)
                                .background(Color.white.opacity(0.3))
                                .foregroundColor(.white)
                                .cornerRadius(15)
                        }
                        
                        Spacer()
                    }
                    .padding(.top, 40)
                }
            }
        }
        .tabViewStyle(PageTabViewStyle())
        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
    }
}
