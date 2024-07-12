//
//  StateOfMindsModel.swift
//  nanoChallenge 3
//
//  Created by Ferris Leroy Winata on 10/07/24.
//

import Foundation



class StateOfMindModel: Identifiable {
    let id = UUID()
    var imageName : String
    var name : String
    var promptMessages: [String]
    
    init(imageName: String, name: String, promptMessages: [String]) {
        self.imageName = imageName
        self.name = name
        self.promptMessages = promptMessages
    }
}


struct MockData {
    static let stateOfMinds: [StateOfMindModel] = [
            StateOfMindModel(
                imageName: "unpleasant",
                name: "Unpleasant",
                promptMessages: [
                    "What's bothering you?",
                   "How can you talk about it?",
                   "What would you like to change?"
                ]
            ),
            StateOfMindModel(
                imageName: "slightlyUnpleasant",
                name: "Slightly Unpleasant",
                promptMessages: [
                    "What small thing is on your mind?",
                    "Is there something you can do to feel a bit better?",
                    "What can you learn from this feeling?"
                ]
            ),
            StateOfMindModel(
                imageName: "neutral",
                name: "Neutral",
                promptMessages: [
                 "What's on your mind?",
                 "How are you feeling today?",
                 "What's something you're looking forward to?"
                ]
            ),
            StateOfMindModel(
                imageName: "slightlyPleasant",
                name: "Slightly Pleasant",
                promptMessages: [
                    "What's something that made you smile today?",
                   "What positive thing happened today?",
                    "What small joy did you experience?"
                ]
            ),
            StateOfMindModel(
                imageName: "pleasant",
                name: "Pleasant",
                promptMessages: [
                    "What’s bringing you happiness right now?",
                    "How can you cherish this moment?",
                    "What are you grateful for today?"
                ]
            )
        ]
}
