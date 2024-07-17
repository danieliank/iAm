//
//  NoteView.swift
//  iAm
//
//  Created by Alfadli Maulana Siddik on 11/07/24.
//

import Foundation
import SwiftUI
import SwiftData
import PhotosUI

struct NoteView: View {
    @Environment(\.colorScheme) private var colorScheme
    @Bindable var note: Note
    @State var selectedPhoto: PhotosPickerItem?
    @State var showSheet: Bool = false
    
    var body: some View {
        VStack {
            
            //Selected StateOfMind
            StateOfMindHeader(selectedStateOfMind: note.mood, showSheet: $showSheet)
            
            if let photoData = note.noteImage, let uiImage = UIImage(data: photoData) {
                Image(uiImage: uiImage)
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: .infinity, maxHeight: 300)
            }
            
            TextEditor(text: $note.content)
            .scrollContentBackground(.hidden)
            .padding(.horizontal)
            .background(Color(uiColor: .secondarySystemBackground))
        }
        .navigationTitle("date")
        .navigationBarTitleDisplayMode(.inline)
        .background(Color(uiColor: .secondarySystemBackground))
        .toolbar {
            ToolbarItemGroup(placement: .bottomBar) {
                Button(action: {}, label: {
                    Image(systemName: "checklist")
                })
                Spacer()
                PhotosPicker(selection: $selectedPhoto, matching: .images, photoLibrary: .shared()) {
                    Image(systemName: "camera")
                }
                .onChange(of: selectedPhoto) { newItem in
                    Task {
                        if let data = try? await newItem?.loadTransferable(type: Data.self) {
                            note.noteImage = data
                        }
                    }
                }
                Spacer()
                Button(action: {}, label: {
                    Image(systemName: "mic")
                })
            }
        }
        .sheet(isPresented: $showSheet){
            StateOfMindView(moodValue: $note.mood, isEditing: true)
                .presentationDragIndicator(.visible)
                .presentationCornerRadius(10)
        }
        Spacer()
    }
}

#Preview {
    NavigationStack {
        NoteView(note: SampleData.shared.note)
    }
    .modelContainer(SampleData.shared.modelContainer)
}
