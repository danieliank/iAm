//
//  ContentView.swift
//  iAm
//
//  Created by Daniel Ian on 09/07/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @StateObject var navPath = Router.shared
    @State var showSheet = false
    
    var body: some View {
        NavigationStack(path: $navPath.path) {
                Text("iAm")
                    .font(.system(size: 34, weight: .bold))
                    .padding(.trailing, 290)
            HistoryView()
            .navigationDestination(for: Destination.self) { destination in
                switch destination {
                case .noteView(let note):
                    NoteView(note: note)
                }
            }

            .toolbar {
                ToolbarItemGroup {
                    Button("Add", systemImage: "plus.circle.fill") {
                        showSheet = true
                    }
                }
            }
            .sheet(isPresented: $showSheet, content: {
                StateOfMindView(moodValue: .neutral, isEditing: false, updatedMoodValue: nil)
                    .presentationDragIndicator(.visible)
                    .presentationCornerRadius(10)
            })
        }
        .ignoresSafeArea(.all)
    }
}

#Preview {
    ContentView()
        .modelContainer(SampleData.shared.modelContainer)
}


