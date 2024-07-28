//
//  StateOfMindView.swift
//  iAm
//
//  Created by Alfadli Maulana Siddik on 15/07/24.
//

import SwiftUI
import Lottie

struct StateOfMindView: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var context
    
    @Binding var moodValue: Mood
    @State var isEditing: Bool
    
    var body: some View {
        VStack {
            Text(isEditing ? "Edit Note" : "New Note")
                .font(.system(size: 17))
                .fontWeight(.semibold)
                .padding(.bottom, 74)
                .padding(.top, -10)
            
            Text(isEditing ? "How did your emotion change?" : "How do you feel right now?")
                .font(.headline)
                .padding(.top, -10)

            ZStack{
                TabView(selection: $moodValue) {
                    ForEach(Mood.allCases, id: \.self) { mood in
                        VStack {
                            LottieView(name: mood.image)
                                .frame(height: 240)
                                .padding(.bottom, 40)
                            
                            Text(mood.title)
                                .font(.system(size: 30, weight: .bold))
                        }
                    }
                }
                .frame(height: 450)
                .tabViewStyle(.page(indexDisplayMode: .never))
                
                HStack {
                    if moodValue != .unpleasant {
                        // button chevron left
                        Button(action: {
                            if let currentIndex = Mood.allCases.firstIndex(of: moodValue) {
                                let newIndex = (currentIndex - 1 + Mood.allCases.count) % Mood.allCases.count
                                moodValue = Mood.allCases[newIndex]
                            }
                        }) {
                            Image(systemName: "chevron.left")
                                .imageScale(.large)
                                .padding(.horizontal)
                        }
                    }
                    Spacer()
                    
                    if moodValue != .pleasant {
                        // button chevron right
                        Button(action: {
                            if let currentIndex = Mood.allCases.firstIndex(of: moodValue) {
                                let newIndex = (currentIndex + 1) % Mood.allCases.count
                                moodValue = Mood.allCases[newIndex]
                            }
                        }) {
                            Image(systemName: "chevron.right")
                                .imageScale(.large)
                                .padding(.horizontal)
                        }
                    }
                }
            }
            Button {
                if isEditing {
                    dismiss()
                } else {
                    let newNote = Note(mood: moodValue, content: "", timestamp: Date())
                    context.insert(newNote)
                    Router.shared.path.append(.noteView(note: newNote))
                    dismiss()
                }
            } label: {
                Text(isEditing ? "Update" : "Log Emotion")
                    .frame(width: 115, height: 18)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(12)
            }
            .padding(.top, 50)
        }
        .frame(height: UIScreen.main.bounds.height)
    }
}

#Preview {
    StateOfMindView(moodValue: .constant(.neutral), isEditing: false)
}
