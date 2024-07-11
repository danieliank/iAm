//
//  Note.swift
//  iAm
//
//  Created by Alfadli Maulana Siddik on 11/07/24.
//

import Foundation
import SwiftData

@Model
class Note {
    var mood: Mood
    var content: String
    var image: String?
    var audio: String?
    var timestamp: Date
    
    init(mood: Mood, content: String, image: String? = nil, audio: String? = nil, timestamp: Date) {
        self.mood = mood
        self.content = content
        self.image = image
        self.audio = audio
        self.timestamp = timestamp
    }
    
    static let sampleData = [
        Note(mood: .unpleasant, content: "Saya sangat tidak senang", timestamp: Calendar.current.date(byAdding: .day, value: -2, to: Date()) ?? Date()),
        Note(mood: .slightlyPleasant, content: "Saya tidak senang", timestamp: Calendar.current.date(byAdding: .day, value: -1, to: Date()) ?? Date()),
        Note(mood: .neutral, content: "Saya netral", timestamp: Date()),
        Note(mood: .slightlyPleasant, content: "Saya senang", timestamp: Calendar.current.date(byAdding: .day, value: 1, to: Date()) ?? Date()),
        Note(mood: .pleasant, content: "Saya sangat senang", timestamp: Calendar.current.date(byAdding: .day, value: 2, to: Date()) ?? Date())
    ]
}
