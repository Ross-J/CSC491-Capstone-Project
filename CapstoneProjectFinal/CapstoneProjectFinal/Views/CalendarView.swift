//
//  CalendarView.swift
//  CapstoneProjectFinal
//
//  Created by Ross Jacobson on 12/14/23.
//

import SwiftUI

struct CalendarView: View {
    
    @StateObject var viewModel = CalendarViewViewModel()
    
    var body: some View {
        
        NavigationView {
            VStack {
                DatesView(interval: DateInterval(start: .distantPast, end: .distantFuture))
                    .accentColor(.appGreen)
            }
            .navigationTitle("Calendar")
        }

    }
}

#Preview {
    CalendarView()
}
