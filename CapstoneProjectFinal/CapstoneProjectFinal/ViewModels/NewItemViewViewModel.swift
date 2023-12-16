//
//  NewItemViewViewModel.swift
//  CapstoneProjectFinal
//
//  Created by Ross Jacobson on 12/10/23.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class NewItemViewViewModel: ObservableObject {
    
    @Published var title = ""
    @Published var dueDate = Date()
    @Published var showAlert = false
    
    init() {}
    
    func save() {
        guard canSave else {
            return
        }
        
        // get current user id from signed-in user
        guard let uId = Auth.auth().currentUser?.uid else {
            return
        }
        
        // create new instance of a to do list item
        let newId = UUID().uuidString
        let newItem = ToDoListItem(
            id: newId,
            title: title,
            dueDate: dueDate.timeIntervalSince1970,
            createdDate: Date().timeIntervalSince1970,
            isDone: false)
        
        // save instance to database
        let db = Firestore.firestore()
            
        db.collection("users")
            .document(uId)
            .collection("to do list items")
            .document(newId)
            // converting model into dictionary to be stored
            .setData(newItem.asDictionary())
    }
    
    // validate user input in date selection
    var canSave: Bool {
        // checking that title has been entered
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
        }
        
        // checking that date selected is current date or later
        // accounting for timezones by subtracting one day
        guard dueDate >= Date().addingTimeInterval(-86400) else {
            return false
        }
        
        return true
    }
}
