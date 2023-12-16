//
//  LoginView.swift
//  CapstoneProjectFinal
//
//  Created by Ross Jacobson on 12/10/23.
//

import SwiftUI

struct LoginView: View {
    
    // creating an instance of the loginView object
    @StateObject var viewModel = LoginViewViewModel()
    
    var body: some View {
        
        // navigate between login and registration views on app load
        NavigationView {
            
            VStack {
                // header
                HeaderView(title: "Productivity Pro", 
                           subtitle: "Get more done.",
                           angle: 15,
                           background: .white,
                           text: .appGreen)
                    .shadow(color: Color.gray.opacity(0.5), radius: 20, x: 0, y: 10)
                
                // login form
                Form {
                    if !viewModel.errorMessage.isEmpty {
                        Text(viewModel.errorMessage)
                            .foregroundColor(.red)
                    }
                    
                    TextField("Email Address", text: $viewModel.email)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocapitalization(.none)
                        .autocorrectionDisabled()
                    SecureField("Password", text: $viewModel.password)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocorrectionDisabled()
                    
                    TLButton(
                        title: "Log In",
                        background: .appGreen
                    ) {
                        // attempt to log user in
                        viewModel.login()
                    }
                }
                .offset(y: -50)
                
                // create new account
                VStack {
                    Text("New User?")
                    NavigationLink("Create an account",
                                   destination: RegisterView())
                        .font(.system(size: 19))
                        .foregroundColor(.appGreen)
                        .bold()
                        .padding(1)
                }
                .offset(y: -50)
    
                Spacer()
            }
            .background(.appGray)
        }
        .accentColor(.white)
        
    }
}

#Preview {
    LoginView()
}
