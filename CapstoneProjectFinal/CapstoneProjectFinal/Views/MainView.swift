//
//  ContentView.swift
//  CapstoneProjectFinal
//
//  Created by Ross Jacobson on 12/10/23.
//

import SwiftUI

struct MainView: View {
    
    @StateObject var viewModel = MainViewViewModel()
    
    var body: some View {
        
        // check to see if user is signed in to show or skip login screen
        if viewModel.isSignedIn, !viewModel.currentUserId.isEmpty {
            
            // user is signed in - directly navigate to home screen
            // display main tab menu to navigate to pages
            menuView
        
        } else {
            // user is not signed in - show login screen
            LoginView()
        }
        
    }
    
    // main menu view to display
    @ViewBuilder
    var menuView: some View {
        // menus
        NavigationView {
            VStack {
                // top menu links
                HStack {
                    NavigationLink(destination: ProfileView()) {
                        Image(systemName: "person.circle")
                    }
                    .font(.system(size: 25))
                    
                    NavigationLink(destination: SettingsView()) {
                        Image(systemName: "gearshape.fill")
                    }
                    .font(.system(size: 25))
                    
                    Spacer()
                }
                .padding(.leading)
                .foregroundColor(.appGreen)
                
                Spacer()
                
                // main menu bar
                TabView {
                    HomeView()
                        .tabItem {
                            Label("Home", systemImage: "house")
                        }
                    // passing in user id in order to detect to do list items for a particular user
                    ToDoListView(userId: viewModel.currentUserId)
                        .tabItem {
                            Label("To Do List", systemImage: "checklist.checked")
                        }
                    CalendarView()
                        .tabItem {
                            Label("Calendar", systemImage: "calendar")
                        }
                    NotesView()
                        .tabItem {
                            Label("Notes", systemImage: "note")
                        }
                    GoalsView()
                        .tabItem {
                            Label("Goals", systemImage: "hourglass")
                        }
                }
                .accentColor(.appGreen)
            }
        }
        .accentColor(.appGreen)
        .ignoresSafeArea()
    }
    
}

#Preview {
    MainView()
}
