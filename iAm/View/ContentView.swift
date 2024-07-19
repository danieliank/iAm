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
    @State var moodValue: Mood = .neutral
    
    @Environment(\.colorScheme) private var colorScheme
    
    
    
    var body: some View {
        NavigationStack(path: $navPath.path) {
            HistoryView()
                .onOpenURL { url in
                    guard url.scheme == "testNotes" else { return }
                    
                    showSheet = true
                    moodValue = setMoodValue(mood: url.lastPathComponent)
                }
                .navigationDestination(for: Destination.self) { destination in
                    switch destination {
                    case .noteView(let note):
                        NoteView(note: note)
                    }
                }
                .navigationTitle("iAm")
                .toolbar {
                    ToolbarItemGroup {
                        Button("Add", systemImage: "plus.circle.fill") {
                            showSheet = true
                        }
                    }
                }
                .background(colorScheme == .dark ? Color(uiColor: .systemBackground) : Color(uiColor: .secondarySystemBackground))
                .sheet(isPresented: $showSheet, content: {
                    StateOfMindView(moodValue: $moodValue, isEditing: false)
                        .presentationDragIndicator(.visible)
                        .presentationCornerRadius(10)
                })
        }
        .ignoresSafeArea(.all)
    }
    
    private func setMoodValue(mood: String) -> Mood {
        switch mood {
        case "unpleasant":
            return .unpleasant
        case "slightlyUnpleasant":
            return .slightlyUnpleasant
        case "neutral":
            return .neutral
        case "slightlyPleasant":
            return .slightlyPleasant
        case "pleasant":
            return .pleasant
        default:
            return .neutral
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(SampleData.shared.modelContainer)
}


