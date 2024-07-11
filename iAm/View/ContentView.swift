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
    @Query(sort: \Note.timestamp, order: .reverse) private var notes: [Note]

    @State var moodValue: Mood = .neutral
    @StateObject var navPath = Router.shared
    
    var body: some View {
        NavigationStack(path: $navPath.path) {
            ScrollView(.vertical) {
                VStack {
                    Picker("Mood", selection: $moodValue) {
                        ForEach(Mood.allCases, id: \.self) { mood in
                            Text(mood.title).tag(mood)
                        }
                    }
                    Button {
                        let newNote = Note(mood: moodValue, content: "", timestamp: Date())
                        context.insert(newNote)

                        Router.shared.path.append(.noteView(note: newNote))
                    } label: {
                        Text("Log")
                            .padding(.vertical, 12)
                            .padding(.horizontal, 20)
                            .foregroundColor(.white)
                            .background(.black)
                    }

                }
                .frame(height: UIScreen.main.bounds.height)
                
                List {
                    ForEach (notes) { note in
                        NavigationLink {
                            NoteView(note: note)
                        } label: {
                            HStack {
                                Image(systemName: note.mood.image)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: 40)
                                VStack {
                                    Text(note.timestamp, format: Date.FormatStyle()
                                        .month(.abbreviated)
                                        .day(.defaultDigits))
                                    Text(note.timestamp, format: Date.FormatStyle()
                                            .hour(.twoDigits(amPM: .omitted))
                                            .minute(.twoDigits))
                                }
                            }
                        }
                    }
                    .onDelete(perform: deleteNotes)
                    
                }
                .frame(height: UIScreen.main.bounds.height)
                
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

    private func deleteNotes(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                context.delete(notes[index])
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(SampleData.shared.modelContainer)
}
