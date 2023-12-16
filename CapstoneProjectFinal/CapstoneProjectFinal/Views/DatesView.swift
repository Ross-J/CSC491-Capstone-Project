//
//  Calendar.swift
//  CapstoneProjectFinal
//
//  Created by Ross Jacobson on 12/15/23.
//

import Foundation
import SwiftUI

// creating calendar model to display in calendar tab
struct DatesView: UIViewRepresentable {

    //@ObservedObject var tasks: NewItemViewViewModel
    let interval: DateInterval
    
    
    func makeUIView(context: Context) -> UICalendarView {
        let view = UICalendarView()
        view.calendar = Calendar(identifier: .gregorian)
        view.availableDateRange = interval
        return view
    }
    
    func updateUIView(_ uiView: UICalendarView, context: Context) {
        
    }
    
    /*
    class Coordinator: NSObject, UICalendarViewDelegate {
        var parent: DatesView
        
        @ObservedObject var tasks: NewItemViewViewModel
        
        init(parent: DatesView, tasks: ObservedObject<NewItemViewViewModel>) {
            self.parent = parent
            self._tasks = tasks
        }
        
        @MainActor
        func calendarView(_ calendarView: UICalendarView,
                          decorationFor dateComponents: DateComponents) -> UICalendarView.Decoration? {
            return nil
        }
        
    }
    */
    
    
    // implement later
    // calendar view should show current events/items
}
