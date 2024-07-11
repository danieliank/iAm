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
    @State var content = ""
    
    var body: some View {
        VStack {
            TextField("note", text: $content)
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
        NoteView()
    }
    .modelContainer(SampleData.shared.modelContainer)
}
