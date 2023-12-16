//
//  NotesView.swift
//  CapstoneProjectFinal
//
//  Created by Ross Jacobson on 12/14/23.
//

import SwiftUI

struct NotesView: View {
    
    @StateObject var viewModel = NotesViewViewModel()
    
    var body: some View {
        
        NavigationView {
            VStack {
                
            }
            .navigationTitle("Notes")
            .toolbar {
                Button {
                    // add new note
                } label: {
                    Image(systemName: "plus")
                }
            }
        }
    }
}

#Preview {
    NotesView()
}
