//
//  LoginViewViewModel.swift
//  CapstoneProjectFinal
//
//  Created by Ross Jacobson on 12/10/23.
//

import Foundation
import FirebaseAuth

// object to hold data, functionality from login view
class LoginViewViewModel: ObservableObject {
    
    // bindings (variables)
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    
    
    init() {}
    
    
    func login() {
        // validate user inputs
        guard validate() else {
            return
        }
        
        // try to log user in
        print("Called")
        Auth.auth().signIn(withEmail: email, password: password)
    }

    
    private func validate() -> Bool {
        // reset error message
        errorMessage = ""
        
        // checking for valid email and password entries
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
                !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            errorMessage = "Please fill in all fields"
            return false
        }
        
        // checking for valid email address
        guard email.contains("@") && email.contains(".") else {
            errorMessage = "Please enter a valid email"
            return false
        }
        
        return true
    }
}
