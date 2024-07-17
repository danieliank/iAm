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
    @State private var toggledView: String?
    @State private var isRecorderToggled: Bool = false
    @State private var micIcon: String = "mic"
    
    @StateObject var vm = VoiceViewModel()
    
    @State var showSheet: Bool = false
    @State var updatedMood: Mood = .neutral // hny untk receive update la
    
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
            
            TextField("note", text: $note.content, axis: .vertical)
                .frame(width: 370)
            RecordingListView(vm: vm, note: note)
        }
        .onAppear {
            vm.fetchAllRecording(audioURLs: note.audioFileName)
        }
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
        .sheet(isPresented: $showSheet){
            StateOfMindView(moodValue: note.mood, isEditing: true, updatedMoodValue: $updatedMood, onUpdate: updateMood)
                .presentationDragIndicator(.visible)
                .presentationCornerRadius(10)
        }
        Spacer()
        if isRecorderToggled == true {
            AudioRecordToolbarView(vm:vm, note: note)
        } else {
            EmptyView()
        }
    }
    
    func updateMood() -> Void {
        note.mood = updatedMood
    }
}

#Preview {
    NavigationStack {
        NoteView(note: SampleData.shared.note)
    }
    .modelContainer(SampleData.shared.modelContainer)
}
