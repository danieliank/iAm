//
//  notePage.swift
//  nanoChallenge 3
//
//  Created by Ferris Leroy Winata on 10/07/24.
//

import SwiftUI

struct NotePage: View {
    var selectedStateOfMind: StateOfMindModel
    @State private var showPromptMessage = false
    @State private var currentIndex = 0
    @State private var fadeIn = false
    @State private var messageVisible = false
    @State private var imageOpacity = 1.0

    
    var body: some View {
        HStack (spacing: 15){
                Image(selectedStateOfMind.imageName)
                    .resizable()
                    .frame(width: 80, height: 80)
                    .opacity(imageOpacity)
                    .onTapGesture {
                        if !showPromptMessage {
                            currentIndex = (currentIndex + 1) % selectedStateOfMind.promptMessages.count
                            withAnimation {
                                fadeIn = true
                                showPromptMessage = true
                                imageOpacity = 0.7
                            }
                            
                            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                                withAnimation {
                                    fadeIn = false
                                }
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                    withAnimation {
                                        showPromptMessage = false
                                        imageOpacity = 1.0
                                    }
                                }
                            }
                        }
                    }
                
                if showPromptMessage {
                    Text(selectedStateOfMind.promptMessages[currentIndex])
                        .font(.title2)
                        .opacity(fadeIn ? 1 : 0)
                        .animation(.easeInOut(duration: 1), value: fadeIn)
                }
            }
        .padding()
        Spacer()
        }
}

#Preview {
    NotePage(selectedStateOfMind: MockData.stateOfMinds[0])
}
