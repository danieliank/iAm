//
//  NoteView.swift
//  iAm
//
//  Created by Alfadli Maulana Siddik on 11/07/24.
//

import Foundation
import SwiftUI
import SwiftData

struct NoteView: View {
    @Bindable var note: Note
    
    var body: some View {
        VStack {
            TextField("note", text: $note.content)
            Spacer()
        }
        .toolbar {
            ToolbarItemGroup(placement: .bottomBar) {
                Button(action: {}, label: {
                    Image(systemName: "checklist")
                })
                Spacer()
                Button(action: {}, label: {
                    Image(systemName: "camera")
                })
                Spacer()
                Button(action: {}, label: {
                    Image(systemName: "mic")
                })
                Spacer()
                Button(action: {}, label: {
                    Image(systemName: "bubble")
                })
            }
        }
    }
}

#Preview {
    NavigationStack {
        NoteView(note: SampleData.shared.note)
    }
    .modelContainer(SampleData.shared.modelContainer)
}
