import SwiftUI

struct ContentView: View {
    
    @AppStorage("isOnboarding") var isOnboarding: Bool = true
    
    var body: some View {
        if isOnboarding {
            OnboardingView()
        } else {
            FruitListView()
        }
    }
}
#Preview {
    ContentView()
}
