//
//  Enums.swift
//  iAm
//
//  Created by Alfadli Maulana Siddik on 11/07/24.
//

import Foundation

enum Mood: Codable, CaseIterable {
    case unpleasant
    case slightlyUnpleasant
    case neutral
    case slightlyPleasant
    case pleasant
    
    var title: String {
        switch self {
        case .unpleasant:
            return "Unpleasent"
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
}

enum Destination: Hashable {
    case noteView(note: Note)
}
