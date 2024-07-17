//
//  iAmApp.swift
//  iAm
//
//  Created by Daniel Ian on 09/07/24.
//

import SwiftUI
import SwiftData

@main
struct iAmApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Note.self,
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
//            NoteView(note: SampleData.shared.note)
//            JournalView()
//            StateOfMindView(showSheet: .constant(true))
            ContentView()
        }
        .modelContainer(sharedModelContainer)
    }
}
