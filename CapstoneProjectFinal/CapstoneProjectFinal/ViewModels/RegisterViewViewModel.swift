//
//  RegisterViewViewModel.swift
//  CapstoneProjectFinal
//
//  Created by Ross Jacobson on 12/10/23.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class RegisterViewViewModel: ObservableObject {
    
    @Published var name = ""
    @Published var email = ""
    @Published var password = ""
    
    
    init() {}
    
    
    func register() {
        guard validate() else {
            return
        }
        
        // create a new user using custom user model
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] result, error in
            // make sure new user exists using unique identifier
            guard let userId = result?.user.uid else {
                return
            }
            
            // insert new user into database
            // optional self and weak self to avoid memory leak
            self?.insertUserRecord(id: userId)
        }
    }
    
    
    private func insertUserRecord(id: String) {
        // initialize user object
        let newUser = User(id: id, name: name, email: email, joined: Date().timeIntervalSince1970)
        
        // initialize database
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(id)
            // convert codable user object to dictionary and add to collection of users under the id document
            // done via an extension
            .setData(newUser.asDictionary())
        
    }
     
    
    private func validate() -> Bool {
        // checking if new user credentials are entered
        guard !name.trimmingCharacters(in: .whitespaces).isEmpty,
              !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
        }
        
        // checking if new password is greater than or equal to 6 characters
        guard password.count >= 6 else {
            return false
        }
        
        return true
    }
}
