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
            return "arrow.down.left.circle.fill"
        case .slightlyUnpleasant:
            return "arrow.up.left.circle.fill"
        case .neutral:
            return "arrow.up.circle.fill"
        case .slightlyPleasant:
            return "arrow.up.forward.circle.fill"
        case .pleasant:
            return "arrow.down.forward.circle.fill"
        }
    }
}

enum Destination: Hashable {
    case noteView(note: Note)
}
