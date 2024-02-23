//
//  skripsiApp.swift
//  skripsi
//
//  Created by Rival Fauzi on 25/12/23.
//

import SwiftUI

@main
struct skripsiApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
//            ContentView()
            MainView()
//            InfoView(aksara: "mgbqz")
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
