//
//  ToDoListItemView.swift
//  CapstoneProjectFinal
//
//  Created by Ross Jacobson on 12/10/23.
//

import SwiftUI

struct ToDoListItemView: View {
    
    @StateObject var viewModel = ToDoListItemViewViewModel()
    
    let item: ToDoListItem
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(item.title)
                    .font(.body)
                    .bold()
                    .foregroundColor(.appGreen)
                Text("\(Date(timeIntervalSince1970: item.dueDate).formatted(date: .abbreviated, time: .shortened))")
                    .font(.footnote)
                    .foregroundColor(Color(.secondaryLabel))
            }
            
            Spacer()
            
            Button {
                viewModel.toggleIsDone(item: item)
            } label: {
                // toggle images based on state of item
                Image(systemName: item.isDone ? "checkmark.circle.fill" : "circle")
                    .accentColor(.appGreen)
            }
        }
        .padding(.top, 8)
        .padding(.bottom, 8)
    }
}

#Preview {
    ToDoListItemView(item: .init(
        id: "123",
        title: "Example item",
        dueDate: Date().timeIntervalSince1970,
        createdDate: Date().timeIntervalSince1970,
        isDone: false
    ))
}
