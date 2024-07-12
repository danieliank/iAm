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
    
    // TODO: add prompt
}

enum Destination: Hashable {
    case noteView(note: Note)
}
