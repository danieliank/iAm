//
//  StateOfMindsModel.swift
//  nanoChallenge 3
//
//  Created by Ferris Leroy Winata on 10/07/24.
//

import Foundation

class StateOfMindModel: Identifiable {
    
    var imageName : String
    var name : String
    
    init(imageName: String, name: String) {
        self.imageName = imageName
        self.name = name
    }
}


struct MockData {
    static let stateOfMinds: [StateOfMindModel] = [
        StateOfMindModel(imageName: "unpleasant", name: "Unpleasant"),
        StateOfMindModel(imageName: "slightlyUnpleasant", name: "Slightly Unpleasant"),
        StateOfMindModel(imageName: "neutral", name: "Neutral"),
        StateOfMindModel(imageName: "slightlyPleasant", name: "Slightly Pleasant"),
        StateOfMindModel(imageName: "pleasant", name: "Pleasant")
    ]
}
