//
//  ToDoListItemViewViewModel.swift
//  CapstoneProjectFinal
//
//  Created by Ross Jacobson on 12/10/23.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

// view model for single to do list item (one row within main list)
class ToDoListItemViewViewModel: ObservableObject {
    init() {}
    
    func toggleIsDone(item: ToDoListItem) {
        // set inverse state of current list item
        var itemCopy = item
        itemCopy.setDone(!item.isDone)
        
        guard let uid = Auth.auth().currentUser?.uid else {
            return
        }
        
        let db = Firestore.firestore()
        
        // update item in database
        db.collection("users")
            .document(uid)
            .collection("to do list items")
            .document(itemCopy.id)
            .setData(itemCopy.asDictionary())
    }
}
