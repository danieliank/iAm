//
//  Enums.swift
//  iAm
//
//  Created by Alfadli Maulana Siddik on 11/07/24.
//

import Foundation

enum Mood: Codable, CaseIterable {
    case veryUnpleasant
    case unpleasant
    case neutral
    case pleasant
    case veryPleasant
    
    var title: String {
        switch self {
        case .veryUnpleasant:
            return "Very Unpleasant"
        case .unpleasant:
            return "Unpleasant"
        case .neutral:
            return "Neutral"
        case .pleasant:
            return "Pleasant"
        case .veryPleasant:
            return "Very Pleasant"
        }
    }
    
    var image: String {
        switch self {
        case .veryUnpleasant:
            return "arrow.down.left.circle.fill"
        case .unpleasant:
            return "arrow.up.left.circle.fill"
        case .neutral:
            return "arrow.up.circle.fill"
        case .pleasant:
            return "arrow.up.forward.circle.fill"
        case .veryPleasant:
            return "arrow.down.forward.circle.fill"
        }
    }
}

enum Destination: Hashable {
    case noteView(note: Note)
}
