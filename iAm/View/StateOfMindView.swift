//
//  StateOfMindView.swift
//  iAm
//
//  Created by Alfadli Maulana Siddik on 15/07/24.
//

import SwiftUI

struct StateOfMindView: View {
    @Environment(\.modelContext) private var context
    
    @Binding var moodValue: Mood
    @Binding var showSheet: Bool
    
    var body: some View {
        VStack {
            Text("New Note")
                .font(.system(size: 17))
                .fontWeight(.semibold)
                .padding(.bottom, 74)
                .padding(.top, -10)
            
            Text("How do you feel right now?")
                .font(.headline)
                .padding(.top, -10)
    
            TabView(selection: $moodValue) {
                ForEach(Mood.allCases, id: \.self) { mood in
                    VStack {
                        Image(mood.image)
                            .resizable()
                            .scaledToFit()
                            .frame(height: 240)
                            .padding(.bottom, 40)
                        
                        Text(mood.title)
                        .font(.system(size: 30, weight: .bold))}
                }
            } .frame(width: .infinity, height: 450)
                .tabViewStyle(.page(indexDisplayMode: .always))
      
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
    StateOfMindView(moodValue: .constant(.neutral), showSheet: .constant(true))
}
