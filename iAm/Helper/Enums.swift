//
//  Enums.swift
//  iAm
//
//  Created by Alfadli Maulana Siddik on 11/07/24.
//

import Foundation
import SwiftUI

enum Mood: Codable, CaseIterable {
    case unpleasant
    case slightlyUnpleasant
    case neutral
    case slightlyPleasant
    case pleasant
    
    var title: String {
        switch self {
        case .unpleasant:
            return "Unpleasant"
        case .slightlyUnpleasant:
            return "Slightly Unpleasant"
        case .neutral:
            return "Neutral"
        case .slightlyPleasant:
            return "Pleasant"
        case .pleasant:
            return "Very Pleasant"
        }
    }
    
    var image: String {
        switch self {
        case .unpleasant:
            return "Unpleasant"
        case .slightlyUnpleasant:
            return "SlightlyUnpleasant"
        case .neutral:
            return "Neutral"
        case .slightlyPleasant:
            return "SlightlyPleasant"
        case .pleasant:
            return "Pleasant"
        }
    }
    
    var color: Color {
        switch self {
        case .unpleasant:
            return .blue
        case .slightlyUnpleasant:
            return .mint
        case .neutral:
            return .green
        case .slightlyPleasant:
            return .yellow
        case .pleasant:
            return .orange
        }
    }
    
    var prompt: [String] {
        switch self {
        case .unpleasant:
            return ["What made you feel this way? Tell us what happened!", "So, for how long have you felt unpleasant?", "Is there something that might help improve your mood?"]
        case .slightlyUnpleasant:
            return ["What's causing this slight discomfort?", "Is there anything that could alleviate this feeling?", "What are you going to do to endure this feeling?"]
        case .neutral:
            return ["What's on your mind? Do you still have things lingering?", "Do you feel balanced today? What made you feel neutral?", "Is there something that could make your day better?"]
        case .slightlyPleasant:
            return ["What's making you feel good? What can boost your mood?", "Can you pinpoint the cause of this pleasant feeling?", "How can you maintain this positivity, and what can make it better?"]
        case .pleasant:
            return ["What made you feel happy? Good you're pleasant!", "Can you share what's bringing you joy?", "How can you carry this positive energy forward?"]
        }
    }
}

enum Destination: Hashable {
    case noteView(note: Note)
}
