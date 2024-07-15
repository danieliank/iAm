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
            HistoryView()
                .padding(.top, 24)
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
            .sheet(isPresented: $showSheet, content: {
                StateOfMindView(showSheet: $showSheet)
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


