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
    @State var showSheet: Bool = false
    @State var moodValue: Mood = .neutral
    
    var body: some View {
        List {
            ForEach (notes) { note in
                HStack(spacing: 12) {
                    UnevenRoundedRectangle(bottomTrailingRadius: 10, topTrailingRadius: 10)
                        .fill(note.mood.color)
                        .frame(width: 7)
                    VStack {
                        Button {
                            Router.shared.path.append(.noteView(note: note))
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
                                    Text(note.timestamp.formatted(Date.FormatStyle().weekday(.wide)
                                        .day(.twoDigits).month()
                                        ) + " · " + note.timestamp.formatted(Date.FormatStyle().hour().minute(.twoDigits))
                                    )
                                }
                            }
                            .frame(maxHeight: .infinity)
                            .padding(10)
                            .background(Color(uiColor: .systemBackground))
                            .cornerRadius(10)
                            .shadow(radius: 10)
                        }
                        
                    }
                }
                .listRowSeparator(.hidden)
                .frame(maxHeight: 150)
                .padding([.trailing, .top], 8)
                
            }
            .onDelete(perform: deleteNotes)
            .listRowInsets(.init(top: 0, leading: 0, bottom: 10, trailing: 0))
            .listRowBackground(Color.clear)
        }
        .listStyle(.plain)
        .overlay {
            if notes.isEmpty {
                ContentUnavailableView(label: {
                    Label ("No Entry", systemImage: "list.bullet.clipboard")
                }, description: {
                    Text("Start adding notes to see your list.")
                }, actions: {
                    Button("Add New Note") {
                        showSheet = true
                    }
                })
                .offset(y: -60)
            }
        }
        .sheet(isPresented: $showSheet, content: {
            StateOfMindView(moodValue: $moodValue, isEditing: false)
                .presentationDragIndicator(.visible)
                .presentationCornerRadius(10)
        })
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
