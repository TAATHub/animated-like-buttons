//
//  AnimatedLikeButtonsApp.swift
//  AnimatedLikeButtons
//
//  Created by TAAT on 2025/03/07.
//

import SwiftUI
import SwiftData

@main
struct AnimatedLikeButtonsApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Item.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(sharedModelContainer)
    }
}
