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
                HStack(spacing: 12) {
                    UnevenRoundedRectangle(bottomTrailingRadius: 10, topTrailingRadius: 10)
                        .fill(note.mood.color)
                        .frame(width: 7)
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
                                Text("Friday, 12 July • 11.53")
                            }
                        }
                        .frame(maxHeight: .infinity)
                        .padding(10)
                        .background()
                        .cornerRadius(10)
                        .shadow(radius: 5)
                    }
                    
                }
                .listRowSeparator(.hidden)
                .frame(maxHeight: 150)
                .padding([.trailing, .top], 12)
            }
            .onDelete(perform: { indexSet in
                deleteNotes(offsets: indexSet)
            })
            .listRowInsets(.init(top: 0, leading: 0, bottom: 10, trailing: 0))
        }
        .listStyle(.plain)
    }
    
    private func deleteNotes(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                
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
