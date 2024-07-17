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
    @Bindable var note: Note
    @State var selectedPhoto: PhotosPickerItem?
    @State private var toggledView: String?
    @State private var isRecorderToggled: Bool = false
    @State private var micIcon: String = "mic"
    
    @StateObject var vm = VoiceViewModel()
    
    
    var body: some View {
        VStack {
            
            //Selected StateOfMind
            StateOfMindHeader(selectedStateOfMind: note.mood)
            
            if let photoData = note.noteImage, let uiImage = UIImage(data: photoData) {
                Image(uiImage: uiImage)
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: .infinity, maxHeight: 300)
            }
            
            TextField("note", text: $note.content, axis: .vertical)
                .frame(width: 370)
            RecordingListView(vm: vm, note: note)
        }
        .onAppear {
            vm.fetchAllRecording(audioURLs: note.audioFileName)
        }
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
                Button(action: {
                    self.toggledView = "mic"
                    withAnimation {
                        isRecorderToggled.toggle()
                    }
                    micIcon = isRecorderToggled ? "mic.fill" : "mic"
                }, label: {
                    Image(systemName: micIcon)
                        .foregroundStyle(.blue)
                })

            }
        }
        Spacer()
        if isRecorderToggled == true {
            AudioRecordToolbarView(vm:vm, note: note)
        } else {
            EmptyView()
        }
    }
}

#Preview {
    NavigationStack {
        NoteView(note: SampleData.shared.note)
    }
    .modelContainer(SampleData.shared.modelContainer)
}
