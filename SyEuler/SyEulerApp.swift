//
//  SyEulerApp.swift
//  SyEuler
//
//  Created by Wayne Mock on 12/28/20.
//

import SwiftUI

@main
struct SyEulerApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
