//
//  Recording.swift
//  iAm
//
//  Created by Alfadli Maulana Siddik on 18/07/24.
//

import Foundation

struct Recording : Equatable {
    let fileURL : URL
    let createdAt : Date
    var isPlaying : Bool
}
