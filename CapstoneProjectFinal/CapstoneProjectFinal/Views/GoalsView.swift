//
//  GoalsView.swift
//  CapstoneProjectFinal
//
//  Created by Ross Jacobson on 12/14/23.
//

import SwiftUI

struct GoalsView: View {
    
    @StateObject var viewModel = GoalsViewViewModel()
    
    var body: some View {
        
        NavigationView {
            VStack {
                
            }
            .navigationTitle("Goals")
            .toolbar {
                Button {
                    // add new goal to track
                } label: {
                    Image(systemName: "plus")
                }
            }
        }
    }
}

#Preview {
    GoalsView()
}
