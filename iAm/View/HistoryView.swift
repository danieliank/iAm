//
//  HistoryView.swift
//  iAm
//
//  Created by Daniel Ian on 11/07/24.
//

import SwiftUI
import SwiftData

struct HistoryView: View {
    @Environment(\.modelContext) private var context
    @Query(sort: \Note.timestamp, order: .reverse) private var notes: [Note]
    
    var body: some View {
        List {
            ForEach (notes) { note in
                NavigationLink {
                    NoteView(note: note)
                } label: {
                    HStack {
                        Image(note.mood.image)
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
    
    private func deleteNotes(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                context.delete(notes[index])
            }
        }
    }
}

#Preview {
    HistoryView()
}
