//
//  ContentView.swift
//  iAm
//
//  Created by Daniel Ian on 09/07/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var context
    
    @State var moodValue: Mood = .neutral
    @StateObject var navPath = Router.shared
    
    var body: some View {
        NavigationStack(path: $navPath.path) {
            ScrollView(.vertical) {
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
                
                HistoryView()
            }
            .navigationDestination(for: Destination.self) { destination in
                switch destination {
                case .noteView(let note):
                    NoteView(note: note)
                }
            }
            .ignoresSafeArea()
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(SampleData.shared.modelContainer)
}


