//
//  ToDoListView.swift
//  CapstoneProjectFinal
//
//  Created by Ross Jacobson on 12/10/23.
//

import SwiftUI
import FirebaseFirestoreSwift

struct ToDoListView: View {
    
    @StateObject var viewModel: ToDoListViewViewModel
    
    // query database for a list of items corresponding to current user id
    @FirestoreQuery var items: [ToDoListItem]
    
    
    // taking in current user id from app entry to associate with to do list items
    // making sure initial user ID is included with viewModel
    init(userId: String) {
        self._items = FirestoreQuery(
            collectionPath: "users/\(userId)/to do list items"
        )
        self._viewModel = StateObject(wrappedValue: ToDoListViewViewModel(userId: userId)
        )
    }
    
    var body: some View {
        
        NavigationView {
            VStack {
                // loop through all to do list items and display in list form
                List(items) { item in
                    ToDoListItemView(item: item)
                        .swipeActions {
                            Button {
                                viewModel.delete(id: item.id)
                            } label: {
                                Text("Delete")
                            }
                            .tint(.red)
                        }
                }
                .listStyle(PlainListStyle())
                .foregroundColor(.appGreen)
                .bold()
            }
            .navigationTitle("To Do List")
            .toolbar {
                Button {
                    viewModel.showingNewItemView = true
                } label: {
                    Image(systemName: "plus")
                }
                
            }
            // show pop up view for creating new item
            // using binding to determine when to open/close the pop up 
            .sheet(isPresented: $viewModel.showingNewItemView, content: {
                NewItemView(newItemPresented: $viewModel.showingNewItemView)
            })
        }
        .accentColor(.appGreen)
        
        
        
    }
}

#Preview {
    ToDoListView(userId: "sdyR0mhn3XQ6EwwO3hqpBKRKvJi2")
}
