//
//  HomeView 2.swift
//  AnimatedFloatingSheetView
//
//  Created by MacMini6 on 07/03/25.
//


import SwiftUI

struct HomeView2: View {
    @State private var selectedSheet: SheetType? = nil
    
    var body: some View {
        ZStack {
            VStack(spacing: 20) {
                Button(action: { withAnimation { selectedSheet = .first } }) {
                    Label("Profile", systemImage: "person.circle.fill")
                        .styledButton(colors: [.blue, .purple])
                }
                
                Button(action: { withAnimation { selectedSheet = .second } }) {
                    Label("Statistics", systemImage: "chart.bar.fill")
                        .styledButton(colors: [.green, .blue])
                }
                
                Button(action: { withAnimation { selectedSheet = .third } }) {
                    Label("Settings", systemImage: "gearshape.fill")
                        .styledButton(colors: [.orange, .red])
                }
            }
            .padding()

            if let sheet = selectedSheet {
                Color.black.opacity(0.3) // Dim background when sheet appears
                    .edgesIgnoringSafeArea(.all)
                    .onTapGesture {
                        withAnimation {
                            selectedSheet = nil
                        }
                    }

                FloatingSheetView(sheetType: sheet) {
                    withAnimation {
                        selectedSheet = nil
                    }
                }
            }
        }
    }
}

// MARK: - Enum for Sheet Types
enum SheetType2 {
    case first, second, third
}

// MARK: - Floating Sheet View
struct FloatingSheetView2: View {
    let sheetType: SheetType2
    let onDismiss: () -> Void
    
    var body: some View {
        VStack {
            RoundedRectangle(cornerRadius: 10)
                .frame(width: 50, height: 5)
                .foregroundColor(.gray.opacity(0.6))
                .padding(.top, 10)

            VStack(spacing: 15) {
                switch sheetType {
                case .first:
                    ProfileSheetView()
                case .second:
                    StatsSheetView()
                case .third:
                    SettingsSheetView()
                }
            }
            .padding()
            
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .frame(height: 350)
        .background(Color.white)
        .cornerRadius(20)
        .shadow(radius: 10)
        .transition(.move(edge: .bottom).combined(with: .opacity))
        .padding()
    }
}

// MARK: - Different Sheet Contents

struct ProfileSheetView2: View {
    var body: some View {
        VStack {
            Image(systemName: "person.circle.fill")
                .resizable()
                .frame(width: 80, height: 80)
                .foregroundColor(.blue)
            
            Text("John Doe")
                .font(.title2)
                .fontWeight(.bold)
            
            Text("iOS Developer | SwiftUI Enthusiast")
                .font(.subheadline)
                .foregroundColor(.gray)
            
            Button("View Profile") {}
                .styledActionButton(color: .blue)
        }
    }
}

struct StatsSheetView2: View {
    var body: some View {
        VStack {
            Text("Statistics Overview")
                .font(.title2)
                .fontWeight(.bold)
            
            HStack(spacing: 20) {
                VStack {
                    Text("85%")
                        .font(.title)
                        .bold()
                        .foregroundColor(.green)
                    Text("Task Completion")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                VStack {
                    Text("120")
                        .font(.title)
                        .bold()
                        .foregroundColor(.blue)
                    Text("Hours Worked")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
            }
            .padding()
            
            Button("View More Stats") {}
                .styledActionButton(color: .green)
        }
    }
}

struct SettingsSheetView2: View {
    var body: some View {
        VStack(spacing: 15) {
            Toggle("Dark Mode", isOn: .constant(true))
                .padding()
                .background(Color.gray.opacity(0.1))
                .cornerRadius(10)
            
            Toggle("Notifications", isOn: .constant(false))
                .padding()
                .background(Color.gray.opacity(0.1))
                .cornerRadius(10)
            
            Button("Logout") {}
                .styledActionButton(color: .red)
        }
    }
}

// MARK: - Button Styling Extensions
extension View {
    func styledButton(colors: [Color]) -> some View {
        self.padding()
            .frame(maxWidth: .infinity)
            .background(LinearGradient(colors: colors, startPoint: .leading, endPoint: .trailing))
            .foregroundColor(.white)
            .cornerRadius(12)
    }
    
    func styledActionButton(color: Color) -> some View {
        self.padding()
            .frame(maxWidth: .infinity)
            .background(color)
            .foregroundColor(.white)
            .cornerRadius(10)
    }
}

// MARK: - Preview
struct HomeView2_Previews: PreviewProvider {
    static var previews: some View {
        HomeView2()
    }
}
