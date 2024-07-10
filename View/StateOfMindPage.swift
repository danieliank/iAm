//
//  ContentView.swift
//  nanoChallenge 3
//
//  Created by Ferris Leroy Winata on 09/07/24.
//

import SwiftUI

struct StateOfMindPage: View {
    var body: some View {
        VStack {
            
            ScrollView(.horizontal, showsIndicators: false) {
                
                HStack(spacing: 0){
                    ForEach(MockData.stateOfMinds) { state in
                        StateOfMindCard(
                            imageName: state.imageName,
                            name: state.name
                        )
                        
                                                
                        .scrollTransition { content, phase in
                            content
                                .opacity(phase.isIdentity ? 1 : 0.0)
                                .scaleEffect(x: phase.isIdentity ? 1 : 0.15,
                                             y: phase.isIdentity ? 1 : 0.15 )
                                .offset(y: phase.isIdentity ? 0 : -10)
                            
                        }
                    }
                }
                .scrollTargetLayout()
                
            }
            .scrollTargetBehavior(.paging)
        }
    }
}

struct StateOfMindCard: View {
    
    var imageName: String
    var name: String
    
    var body: some View {
        VStack (spacing: 40){
            Image(imageName)
                .resizable()
                .scaledToFit()
                .frame(height: 200)
//                .shadow(radius: 12)
                .containerRelativeFrame(.horizontal, count: 1, spacing: 0)

            Text(name)
                .font(.title)

        }
    }
}

#Preview {
    StateOfMindPage()
}
