//
//  Router.swift
//  iAm
//
//  Created by Alfadli Maulana Siddik on 11/07/24.
//

import Foundation

class Router: ObservableObject {
    @Published var path: [Destination] = []
    
    static let shared: Router = Router()
}

