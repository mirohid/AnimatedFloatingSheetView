//
//  HomeView.swift
//  AnimatedFloatingSheetView
//
//  Created by MacMini6 on 07/03/25.
//


import SwiftUI

struct HomeView: View {
    @State private var selectedSheet: SheetType? = nil
    
    var body: some View {
        ZStack {
            VStack(spacing: 20) {
                Button(action: { withAnimation { selectedSheet = .first } }) {
                    Label("Profile", systemImage: "person.circle.fill")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(LinearGradient(colors: [.blue, .purple], startPoint: .leading, endPoint: .trailing))
                        .foregroundColor(.white)
                        .cornerRadius(12)
                }
                
                Button(action: { withAnimation { selectedSheet = .second } }) {
                    Label("Statistics", systemImage: "chart.bar.fill")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(LinearGradient(colors: [.green, .blue], startPoint: .leading, endPoint: .trailing))
                        .foregroundColor(.white)
                        .cornerRadius(12)
                }
                
                Button(action: { withAnimation { selectedSheet = .third } }) {
                    Label("Settings", systemImage: "gearshape.fill")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(LinearGradient(colors: [.orange, .red], startPoint: .leading, endPoint: .trailing))
                        .foregroundColor(.white)
                        .cornerRadius(12)
                }
            }
            .padding()

            if let sheet = selectedSheet {
                FloatingSheetView(sheetType: sheet) {
                    withAnimation {
                        selectedSheet = nil
                    }
                }
            }
        }
    }
}

enum SheetType {
    case first, second, third
}

struct FloatingSheetView: View {
    let sheetType: SheetType
    let onDismiss: () -> Void
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button(action: onDismiss) {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(.gray)
                        .font(.title)
                }
            }
            .padding()

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

struct ProfileSheetView: View {
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
            
            Button("View Profile") {
                // Action
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
        }
    }
}

struct StatsSheetView: View {
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
            
            Button("View More Stats") {
                // Action
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.green)
            .foregroundColor(.white)
            .cornerRadius(10)
        }
    }
}

struct SettingsSheetView: View {
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
            
            Button("Logout") {
                // Action
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.red)
            .foregroundColor(.white)
            .cornerRadius(10)
        }
    }
}

// MARK: - Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
