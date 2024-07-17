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
    @Binding var showSheet: Bool

    var body: some View {
        HStack(spacing: 15) {
            Image(selectedStateOfMind.image)
                .resizable()
                .frame(width: 80, height: 80)
                .onTapGesture {
                    showSheet = true
                }

            VStack {
                HStack {
                    Text("REFLECT")
                        .font(.caption)
                        .foregroundColor(Color(uiColor: .secondaryLabel))
                        .opacity(0.5)
                        .padding([.top, .leading], 10)

                    Spacer()

                    Image(systemName: "arrow.clockwise")
                        .font(.caption)
                        .fontWeight(.semibold)
                        .padding(.top, 8)
                        .padding(.trailing, 10)
                        .onTapGesture {
                                currentIndex = (currentIndex + 1) % selectedStateOfMind.prompt.count
                        }
                }
                .padding(.bottom,10)

                HStack {
                    Text(selectedStateOfMind.prompt[currentIndex])
                        .font(.headline)
                }
                .padding(.bottom,10)

                
            }
            .background(Color(uiColor: .systemBackground))
            .cornerRadius(10)
//            .shadow(color: .secondary.opacity(1), radius: 4)
            .frame(width: 260, height: 100)
            
            
        }
        .padding()
    }
}

#Preview {
    StateOfMindHeader(selectedStateOfMind: Note.sampleData[0].mood, showSheet: .constant(false))
}

#Preview {
    StateOfMindHeader(selectedStateOfMind: Note.sampleData[0].mood, showSheet: .constant(false))
}

