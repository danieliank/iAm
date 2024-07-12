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
                    TabView(selection: $moodValue) {
                        ForEach(Mood.allCases, id: \.self) { mood in
                            VStack {
                                Image(mood.image)
                                Text(mood.title)
                                    .tag(mood)
//                                    .foregroundColor(mood.color)
                            }
                        }
                    }
                    .padding(.bottom, -40)
                    .tabViewStyle(.page(indexDisplayMode: .always))
                    .indexViewStyle(.page(backgroundDisplayMode: .always))
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


