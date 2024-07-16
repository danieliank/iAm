//
//  StateOfMindView.swift
//  iAm
//
//  Created by Alfadli Maulana Siddik on 15/07/24.
//

import SwiftUI

struct StateOfMindView: View {
    @State var moodValue: Mood = .neutral
    @Environment(\.modelContext) private var context
    
    @Binding var showSheet: Bool
    
    var body: some View {
        VStack {
            Text("How do you feel right now?")
                .font(.headline)
            TabView(selection: $moodValue) {
                ForEach(Mood.allCases, id: \.self) { mood in
                    VStack {
                        Image(mood.image)
                            .resizable()
                            .scaledToFit()
                            .frame(height: 280)
                            .padding([.top,.bottom], 40)
                            
                        Text(mood.title)
                        .font(.system(size: 30, weight: .bold))}
                }
            } .frame(width: .infinity, height: 450)
            
                .tabViewStyle(.page(indexDisplayMode: .never))
                
            
            Button {
                let newNote = Note(mood: moodValue, content: "", timestamp: Date())
                context.insert(newNote)
                
                Router.shared.path.append(.noteView(note: newNote))
                
                showSheet.toggle()
            } label: {
                Text("Log Emotion")
                    .frame(width: 115, height: 18)
                    .padding()
                    .background(.blue)
                    .foregroundColor(.white)
                    .cornerRadius(12)
            }
            .padding(.top, 50)
        }
        .frame(height: UIScreen.main.bounds.height)
    }
}

#Preview {
    StateOfMindView(showSheet: .constant(true))
}
