//
//  StateOfMindCard.swift
//  iAm
//
//  Created by Daniel Ian on 11/07/24.
//

import SwiftUI

struct StateOfMindCard: View {
    
    var imageName: String
    var name: String
    
    var body: some View {
        VStack (spacing: 40){
            Image(imageName)
                .resizable()
                .scaledToFit()
                .frame(height: 200)
            
            Text(name)
                .font(.title)
            
        }
        .padding(.bottom, 30)
    }
}
//#Preview {
//    StateOfMindCard(imageName: <#String#>, name: <#String#>)
//}
