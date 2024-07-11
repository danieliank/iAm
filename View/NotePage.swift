//
//  notePage.swift
//  nanoChallenge 3
//
//  Created by Ferris Leroy Winata on 10/07/24.
//

import SwiftUI

struct NotePage: View {
    var selectedStateOfMind: StateOfMindModel
    
    var body: some View {
        VStack{
            Image(selectedStateOfMind.imageName)
//            Text(selectedStateOfMind.name)
            Spacer()
        }
        .padding()
    }
}

#Preview {
    NotePage(selectedStateOfMind: StateOfMindModel(imageName: "Normal", name: "normal"))
}
