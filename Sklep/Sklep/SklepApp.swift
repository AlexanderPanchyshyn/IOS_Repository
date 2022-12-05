//
//  SklepApp.swift
//  Sklep
//
//  Created by user222882 on 12/5/22.
//

import SwiftUI

@main
struct SklepApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
