//
//  OnboardingView.swift
//  Application de Fruits
//
//  Created by COURS on 20/02/2026.
//

import SwiftUI

struct OnboardingView: View {
    
    @StateObject var viewModel = FruitViewModel()
    @AppStorage("isOnboarding") var isOnboarding: Bool = true
    
    var body: some View {
        
        NavigationStack {
            TabView {
                
                ForEach(viewModel.fruits) { fruit in
                    
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
                        
                        Text(fruit.headline)
                            .font(.body)
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal, 20)
                        
                        Spacer()
                        
                        Button {
                            isOnboarding = false
                        } label: {
                            Text("Start")
                                .font(.headline)
                                .padding()
                                .frame(width: 180)
                                .background(Color.white.opacity(0.3))
                                .foregroundColor(.white)
                                .cornerRadius(15)
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
                    .cornerRadius(25)
                    .padding(.horizontal, 20)
                }
            }
            .tabViewStyle(PageTabViewStyle())
            .indexViewStyle(.page(backgroundDisplayMode: .never))
        }
    }
}
