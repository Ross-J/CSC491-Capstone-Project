//
//  TLButton.swift
//  CapstoneProjectFinal
//
//  Created by Ross Jacobson on 12/11/23.
//

import SwiftUI

struct TLButton: View {
    
    let title: String
    let background: Color
    // closure passed in for button action
    let action: () -> Void
    
    var body: some View {
        
        Button {
            action()
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(background)
                Text(title)
                    .foregroundColor(.white)
                    .bold()
            }
        }
        .padding()
        
    }
}

#Preview {
    TLButton(title: "Title", background: .blue) {
        // action passed in
    }
}
