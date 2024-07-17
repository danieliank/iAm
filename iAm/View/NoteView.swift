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
    
//    let date = DateFormatter().dateFormat
    
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
            
            VStack {
                
            }
            TextEditor(text: $note.content)
            .scrollContentBackground(.hidden)
            .padding(.horizontal)
            .background(Color(uiColor: .secondarySystemBackground))
            RecordingListView(vm: vm, note: note)
        }
        .onAppear {
            vm.fetchAllRecording(audioURLs: note.audioFileName)
        }
        .navigationTitle("date")
        .navigationBarTitleDisplayMode(.inline)
        .background(Color(uiColor: .secondarySystemBackground))
        .navigationTitle(note.timestamp.formatted(Date.FormatStyle()
            .weekday(.abbreviated)
            .day(.twoDigits)
        ) + " · " + note.timestamp.formatted(Date.FormatStyle().hour().minute(.twoDigits)))
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem (placement: .topBarTrailing) {
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Image(systemName: "ellipsis.circle").fontWeight(.medium)
                })
                .foregroundStyle(.blue)
            }
            
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
            StateOfMindView(moodValue: $note.mood, isEditing: true)
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
}

#Preview {
    NavigationStack {
        NoteView(note: Note.sampleData[0])
    }
    .modelContainer(SampleData.shared.modelContainer)
}
