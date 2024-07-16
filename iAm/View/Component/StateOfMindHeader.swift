//
//  notePage.swift
//  nanoChallenge 3
//
//  Created by Ferris Leroy Winata on 10/07/24.
//

import SwiftUI

struct StateOfMindHeader: View {
    var selectedStateOfMind: Mood
    @State private var currentIndex = 0
    @State private var fadeIn = true
    @State private var imageOpacity = 1.0

    var body: some View {
        HStack(spacing: 15) {
            Image(selectedStateOfMind.image)
                .resizable()
                .frame(width: 80, height: 80)
                .opacity(imageOpacity)

            VStack {
                HStack {
                    Text("REFLECT")
                        .font(.caption)
                        .opacity(0.3)
                        .padding([.top, .leading], 10)

                    Spacer()

                    Image(systemName: "arrow.clockwise")
                        .font(.caption)
                        .fontWeight(.bold)
                        .padding(.top, 8)
                        .padding(.trailing, 10)
                        .onTapGesture {
                            withAnimation {
                                currentIndex = (currentIndex + 1) % selectedStateOfMind.prompt.count
                            }
                        }
                }

                Text(selectedStateOfMind.prompt[currentIndex])
                    .font(.headline)
                    .animation(.easeInOut)
                
            }
            .cornerRadius(10)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.gray, lineWidth: 1)
            )
            .frame(width: 260, height: 100)
        }
        .padding()
    }
}

#Preview {
    StateOfMindHeader(selectedStateOfMind: Note.sampleData[0].mood)
}

#Preview {
    StateOfMindHeader(selectedStateOfMind: Note.sampleData[0].mood)
}

