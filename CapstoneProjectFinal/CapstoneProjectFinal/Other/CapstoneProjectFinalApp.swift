//
//  CapstoneProjectFinalApp.swift
//  CapstoneProjectFinal
//
//  Created by Ross Jacobson on 12/10/23.
//

import SwiftUI
import FirebaseCore

@main
struct CapstoneProjectFinalApp: App {
    
    // initialize firebase database on app load
    init() {
        FirebaseApp.configure()
    }
    
    
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
