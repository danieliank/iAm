//
//  Item.swift
//  iAm
//
//  Created by Daniel Ian on 09/07/24.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
