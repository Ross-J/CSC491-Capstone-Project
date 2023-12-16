//
//  ToDoListViewViewModel.swift
//  CapstoneProjectFinal
//
//  Created by Ross Jacobson on 12/10/23.
//

import Foundation
import FirebaseFirestore

// View model for main to do list menu tab
class ToDoListViewViewModel: ObservableObject {
    
    @Published var showingNewItemView = false
    
    private let userId: String
    
    init(userId: String) {
        self.userId = userId
    }
    
    // Delete to do list item
    func delete(id: String) {
        let db = Firestore.firestore()
        
        // identify current item and remove from database
        db.collection("users")
            .document(userId)
            .collection("to do list items")
            .document(id)
            .delete()
    }
}
