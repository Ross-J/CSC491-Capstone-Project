//
//  RegisterView.swift
//  CapstoneProjectFinal
//
//  Created by Ross Jacobson on 12/10/23.
//

import SwiftUI

struct RegisterView: View {
    
    // creating an instance of the registerView object
    @StateObject var viewModel = RegisterViewViewModel()
    
    var body: some View {
        
        VStack {
            // header
            HeaderView(title: "Sign Up",
                       subtitle: "Start getting more done.",
                       angle: -15,
                       background: .appGreen,
                       text: .white)
            .shadow(color: Color.black.opacity(0.7), radius: 20, x: 0, y: 10)
            
            // registration
            Form {
                TextField("Full Name", text: $viewModel.name)
                    .autocorrectionDisabled()
                TextField("Email Address", text: $viewModel.email)
                    .autocapitalization(.none)
                    .autocorrectionDisabled()
                SecureField("Password", text: $viewModel.password)
                    .autocorrectionDisabled()
                
                TLButton(
                    title: "Create Account",
                    background: .appGreen
                ) {
                    // attempt to register user account
                    viewModel.register()
                }
            }
            .offset(y: -50)
            
            Spacer()
        }
        .background(.appGray)
    }
}

#Preview {
    RegisterView()
}
