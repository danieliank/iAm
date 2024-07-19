import Foundation
import SwiftUI

enum Mood: Codable, CaseIterable {
    case unpleasant
    case slightlyUnpleasant
    case neutral
    case slightlyPleasant
    case pleasant
    
    var currentLanguage: String {
        return Locale.current.languageCode ?? "en"
    }
    
    var title: String {
        switch currentLanguage {
        case "id": // Indonesian
            switch self {
            case .unpleasant:
                return "Negatif"
            case .slightlyUnpleasant:
                return "Sedikit Negatif"
            case .neutral:
                return "Netral"
            case .slightlyPleasant:
                return "Sedikit Positif"
            case .pleasant:
                return "Sangat Negatif"
            }
        default: // English
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
            return .orange
        case .pleasant:
            return .yellow
        }
    }
    
    var prompt: [String] {
        switch currentLanguage {
        case "id": // Indonesian
            switch self {
                        case .unpleasant:
                            return ["Apa yang terjadi?", "Sudah berapa lama?", "Apa yang bisa memperbaiki mood Anda?"]
                        case .slightlyUnpleasant:
                            return ["Apa penyebabnya?", "Apa yang bisa mengurangi perasaan ini?", "Bagaimana cara Anda mengatasinya?"]
                        case .neutral:
                            return ["Apa yang ada di pikiran Anda?", "Apa yang membuat Anda netral?", "Apa yang bisa memperbaiki hari Anda?"]
                        case .slightlyPleasant:
                            return ["Apa yang membuat Anda merasa baik?", "Apa penyebab perasaan ini?", "Bagaimana cara mempertahankan ini?"]
                        case .pleasant:
                            return ["Apa yang membuat Anda bahagia?", "Apa yang membawa kebahagiaan?", "Bagaimana membawa energi ini ke depan?"]
                        }
        default: // English
            switch self {
            case .unpleasant:
                return ["What made you feel this way? Tell us what happened!", "So, for how long have you felt unpleasant?", "Is there something that might help improve your mood?"]
            case .slightlyUnpleasant:
                return ["So, what's causing this slight discomfort?", "Is there anything that could alleviate this feeling?", "What are you going to do to endure this feeling?"]
            case .neutral:
                return ["What's on your mind? Do you still have things lingering?", "Do you feel balanced today? What made you feel neutral?", "Is there something that could make your day better?"]
            case .slightlyPleasant:
                return ["What's making you feel good? What can boost your mood?", "Can you pinpoint the cause of this pleasant feeling?", "How can you maintain this positivity, and what can make it better?"]
            case .pleasant:
                return ["What made you feel happy? Good you're pleasant!", "Can you share what's bringing you joy?", "How can you carry this positive energy forward?"]
            }
        }
    }
}

enum Destination: Hashable {
    case noteView(note: Note)
}
