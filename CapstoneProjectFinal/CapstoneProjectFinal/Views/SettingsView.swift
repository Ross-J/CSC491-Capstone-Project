//
//  SettingsView.swift
//  CapstoneProjectFinal
//
//  Created by Ross Jacobson on 12/14/23.
//

import SwiftUI

struct SettingsView: View {
    
    @StateObject var viewModel = SettingsViewViewModel()
    @State private var isOnOne = true
    @State private var isOnTwo = true
    @State private var isOnThree = true
    @State private var isOnFour = true
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                Text("Enable Push Notifications:")
                    .font(.system(size: 25))
                    .foregroundColor(.appGreen)

                VStack {
                    HStack {
                        Spacer()
                        Text("Tasks")
                            .foregroundColor(.appGreen)
                        Toggle(isOn: $isOnOne) {
      
                        }
                        .toggleStyle(.switch)
                        .tint(.appGreen)
                        Spacer()
                    }
                    .padding(.leading, 50)
                    .padding(.trailing, 200)
                    
                    HStack {
                        Spacer()
                        Text("Notes")
                            .foregroundColor(.appGreen)
                        Toggle(isOn: $isOnTwo) {
      
                        }
                        .toggleStyle(.switch)
                        .tint(.appGreen)
                        Spacer()
                    }
                    .padding(.leading, 50)
                    .padding(.trailing, 200)
                    
                    HStack {
                        Spacer()
                        Text("Goals")
                            .foregroundColor(.appGreen)
                        Toggle(isOn: $isOnThree) {
      
                        }
                        .toggleStyle(.switch)
                        .tint(.appGreen)
                        Spacer()
                    }
                    .padding(.leading, 50)
                    .padding(.trailing, 200)
                }
                Spacer()
                Text("Preferences:")
                    .font(.system(size: 25))
                    .foregroundColor(.appGreen)
                HStack {
                    Spacer()
                    Text("Light mode/Dark mode")
                        .foregroundColor(.appGreen)
                    Toggle(isOn: $isOnFour) {
  
                    }
                    .toggleStyle(.switch)
                    .tint(.appGreen)
                    Spacer()
                }
                .padding(.leading, 50)
                .padding(.trailing, 125)
                Spacer()
                Text("Help:")
                    .font(.system(size: 25))
                    .foregroundColor(.appGreen)
                VStack {
                    HStack {
                        Text("FAQ")
                            .foregroundColor(.appGreen)
                        .underline()
                        Spacer()
                    }
                    .padding(.leading, 60)
                    HStack {
                        Text("About")
                            .foregroundColor(.appGreen)
                        .underline()
                        Spacer()
                    }
                    .padding(.leading, 60)
                }
                Spacer()
            }
            .navigationTitle("Settings")
        }
        
    }
}

#Preview {
    SettingsView()
}
