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
    @FocusState private var isTextEditorFocused: Bool // Add this state for managing focus

    var body: some View {
        VStack {
            // Selected StateOfMind
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
                .focused($isTextEditorFocused) // Bind the focus state
                .toolbar {
                    ToolbarItemGroup(placement: .keyboard) {
                        Spacer()
                        Button("Done") {
                            isTextEditorFocused = false // Dismiss the keyboard
                        }
                    }
                }
            
            RecordingListView(vm: vm, note: note)
        }
        .onAppear {
            vm.fetchAllRecording(audioURLs: note.audioFileName)
        }
        .navigationTitle(note.timestamp.formatted(Date.FormatStyle().weekday(.wide)
            .day(.twoDigits).month()
            ) + " · " + note.timestamp.formatted(Date.FormatStyle().hour().minute(.twoDigits)))
        .navigationBarTitleDisplayMode(.inline)
        .background(Color(uiColor: .secondarySystemBackground))
        .navigationTitle(note.timestamp.formatted(Date.FormatStyle()
            .weekday(.abbreviated)
            .day(.twoDigits)
        ) + " · " + note.timestamp.formatted(Date.FormatStyle().hour().minute(.twoDigits)))
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItemGroup(placement: .bottomBar) {
//                Button(action: {}, label: {
//                    Image(systemName: "checklist")
//                })
//                Spacer()
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
        .sheet(isPresented: $showSheet) {
            StateOfMindView(moodValue: $note.mood, isEditing: true)
                .presentationDragIndicator(.visible)
                .presentationCornerRadius(10)
        }
        Spacer()
        if isRecorderToggled {
            AudioRecordToolbarView(vm: vm, note: note)
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

