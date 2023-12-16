//
//  ProfileView.swift
//  CapstoneProjectFinal
//
//  Created by Ross Jacobson on 12/10/23.
//

import SwiftUI

struct ProfileView: View {
    
    @StateObject var viewModel = ProfileViewViewModel()
    
    var body: some View {
        
        NavigationView {
            VStack {
                
                // if current user is identified, show profile info
                if let user = viewModel.user {
                    profile(user: user)
                } else {
                    Text("Loading profile...")
                }
            }
            .navigationTitle("Profile")
        }
        .onAppear {
            viewModel.fetchUser()
        }
        
    }
    
    @ViewBuilder
    func profile(user: User) -> some View {
        // Avatar
        Image(systemName: "person.circle")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .foregroundColor(.appGreen)
            .frame(width: 125, height: 125)
            .padding()
        
        // Personal info
        VStack(alignment: .leading) {
            HStack {
                Text("Name: ")
                    .bold()
                Text(user.name)
            }
            .padding(.bottom, 10)
            HStack {
                Text("Email: ")
                    .bold()
                Text(user.email)
            }
            .padding(.bottom, 10)
            HStack {
                Text("Member since: ")
                    .bold()
                Text("\(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .shortened))")
            }
        }
        .padding()
        
        Spacer()
        
        // Sign out button
        Button("Log Out")
        {
            viewModel.logOut()
        }
        .tint(.red)
        .padding()
        .bold()
        
        Spacer()
    }
}

#Preview {
    ProfileView()
}
