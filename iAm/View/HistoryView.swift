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
    @Environment(\.colorScheme) private var colorScheme
    @Query(sort: \Note.timestamp, order: .reverse) private var notes: [Note]
    
    var body: some View {
        ScrollView {
            VStack {
                ForEach (notes) { note in
                    HStack(spacing: 12) {
                        UnevenRoundedRectangle(bottomTrailingRadius: 10, topTrailingRadius: 10)
                            .fill(note.mood.color)
                            .frame(width: 7)
                        VStack {
                            NavigationLink {
                                NoteView(note: note)
                            } label: {
                                HStack {
                                    if let photoData = note.noteImage, let uiImage = UIImage(data: photoData) {
                                        Image(uiImage: uiImage)
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: 130, height: 130)
                                            .clipShape(RoundedRectangle(cornerRadius: 6))
                                    }
                                    VStack(alignment: .leading) {
                                        Text(note.content)
                                            .multilineTextAlignment(.leading)
                                        Spacer()
                                        Divider()
                                        Text("Friday, 12 July • 11.53")
                                    }
                                }
                                .frame(maxHeight: .infinity)
                                .padding(10)
                                .background{
                                    if colorScheme == .dark {
                                        Color(uiColor: .secondarySystemBackground)
                                    } else {
                                        Color(uiColor: .systemBackground)
                                    }
                                }
                                .cornerRadius(10)
                                .foregroundColor(.primary)
                            }
                        }
                    }
                    .frame(maxHeight: 150)
                    .padding(.trailing, 16)
                }
            }
            .padding(.top, 5)
        }
        .padding(.leading, 0)
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
    NavigationStack {
        HistoryView()
    }
    .modelContainer(SampleData.shared.modelContainer)
}

