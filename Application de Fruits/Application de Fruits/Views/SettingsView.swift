import SwiftUI

struct SettingsView: View {
    
    @Environment(\.dismiss) private var dismiss
    @AppStorage("isOnboarding") var isOnboarding: Bool = false
    
    var body: some View {
        
        NavigationStack {
            List {
                
                // FRUCTUS
                Section {
                    HStack(spacing: 15) {
                        Image(systemName: "leaf.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50, height: 50)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.green)
                            .cornerRadius(12)
                        
                        Text("Most fruits are naturally low in fat, sodium, and calories. None have cholesterol. Fruits are sources of many essential nutrients, including potassium, dietary fiber, vitamins, and much more.")
                            .font(.footnote)
                    }
                    .padding(.vertical, 8)
                    
                } header: {
                    Text("FRUCTUS")
                }
                
                
                // CUSTOMIZATION
                Section {
                    
                    Text("If you wish, you can restart the application by toggling the switch below. That way it starts the onboarding process again.")
                        .font(.footnote)
                        .foregroundColor(.gray)
                    
                    Toggle("Restart", isOn: $isOnboarding)
                        .tint(.green)
                    
                } header: {
                    Text("CUSTOMIZATION")
                }
                
                
                // APPLICATION
                Section {
                    
                    HStack {
                        Text("Developer")
                            .foregroundColor(.gray)
                        Spacer()
                        Text("Ton Nom")
                    }
                    
                    HStack {
                        Text("Designer")
                            .foregroundColor(.gray)
                        Spacer()
                        Text("Toi 😉")
                    }
                    
                    HStack {
                        Text("Compatibility")
                            .foregroundColor(.gray)
                        Spacer()
                        Text("iOS 17+")
                    }
                } header: {
                    Text("APPLICATION")
                }
            }
            .navigationTitle("Settings")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Done") {
                        dismiss()
                    }
                }
            }
        }
    }
}
