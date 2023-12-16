//
//  MainViewViewModel.swift
//  CapstoneProjectFinal
//
//  Created by Ross Jacobson on 12/10/23.
//

import Foundation
import FirebaseAuth

class MainViewViewModel: ObservableObject {
    
    @Published var currentUserId: String = ""
    private var handler: AuthStateDidChangeListenerHandle?
    
    init() {
        // observe when currentUser changes
        // whenever user signs in or out, currentUserId will be updated
        self.handler = Auth.auth().addStateDidChangeListener { [weak self] _, user in
            DispatchQueue.main.async {
                self?.currentUserId = user?.uid ?? ""
            }
        }
        
    }
    
    // returns true if user is signed in to app, false if not
    public var isSignedIn: Bool {
        // if currentUser exists, user is signed in
        return Auth.auth().currentUser != nil
    }
}
