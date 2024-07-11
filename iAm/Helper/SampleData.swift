//
//  SampleData.swift
//  iAm
//
//  Created by Alfadli Maulana Siddik on 11/07/24.
//

import Foundation
import SwiftData

@MainActor
class SampleData {
    static let shared = SampleData()
    
    let modelContainer: ModelContainer
    
    var context: ModelContext {
        modelContainer.mainContext
    }
    
    private init() {
        let schema = Schema([
            Note.self
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: true)
        
        do {
            modelContainer = try ModelContainer(for: schema, configurations: [modelConfiguration])
            insertSampleData()
        } catch {
            fatalError("Error on SampleData: \(error)")
        }
    }
    
    func insertSampleData() {
        for note in Note.sampleData {
            context.insert(note)
        }
        
        do {
            try context.save()
        } catch {
            print("Error when inserting sample data: \(error)")
        }
    }
    
    var note: Note {
        Note.sampleData[0]
    }
}

