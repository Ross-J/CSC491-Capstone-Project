//
//  ToDoListItem.swift
//  CapstoneProjectFinal
//
//  Created by Ross Jacobson on 12/10/23.
//

import Foundation

// creating a model for to do list items
struct ToDoListItem: Codable, Identifiable {
    let id: String
    let title: String
    let dueDate: TimeInterval
    let createdDate: TimeInterval
    var isDone: Bool
    
    // ability to change the state of an item in the list when it is marked as done
    mutating func setDone(_ state: Bool) {
        isDone = state
    }
}
