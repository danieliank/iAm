//
//  StateOfMindView.swift
//  iAm
//
//  Created by Alfadli Maulana Siddik on 15/07/24.
//

import SwiftUI

struct StateOfMindView: View {
    
    @State var moodValue: Mood
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var context
    
    //    @Binding var showSheet: Bool
    @State var isEditing: Bool
    var updatedMoodValue: Binding<Mood>?
    var onUpdate: () -> Void = {}
    
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
            }
            .frame(height: 450)
            .tabViewStyle(.page(indexDisplayMode: .always))
            
            Button {
                
                if (isEditing) {
                    
                    if let updatedMoodValue = updatedMoodValue {
                        updatedMoodValue.wrappedValue = moodValue
                    }
                    //                    updatedMoodValue = moodValue
                    onUpdate() // note.mood = updatedMood
                    dismiss()
                    
                    // flow: note.mood = (updatedMood or updatedMoodValue) = moodValue
                    //   showSheet = false
                    
                }
                
                else  {
                    
                    let newNote = Note(mood: moodValue, content: "", timestamp: Date())
                    context.insert(newNote)
                    
                    Router.shared.path.append(.noteView(note: newNote))
                    dismiss()
                    //            showSheet.toggle()
                    //  showSheet = false
                    
                }
                
                
            } label: {
                Text(isEditing ? "Update" : "Log Emotion")
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


//#Preview {
//    StateOfMindView(moodValue: .pleasant, showSheet: .constant(true), isEditing: false, updatedMoodValue: <#Binding<Mood?>#>)
//}
