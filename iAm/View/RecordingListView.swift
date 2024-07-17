//
//  RecordingListView.swift
//  iAm
//
//  Created by Raphael on 15/07/24.
//

import Foundation
import SwiftUI
import DSWaveformImage
import DSWaveformImageViews

struct RecordingListView: View {
    
    @ObservedObject var vm: VoiceViewModel
    @State private var configuration: Waveform.Configuration = Waveform.Configuration(
        style: .striped(Waveform.Style.StripeConfig(color: .gray, width: 4, lineCap: .round)),
        verticalScalingFactor: 1
    )
    var note: Note
    var body: some View {
        VStack {
            ScrollView(showsIndicators: false){
                ForEach(vm.recordingsList, id: \.createdAt) { recording in
                    ZStack {
                        RoundedRectangle(cornerSize: CGSize(width: 10, height: 10))
                            .stroke()
                            .frame(width: 361, height: 97)
                        
                        VStack{
                            HStack{
                                Button(action: {
                                    if recording.isPlaying == true {
                                        vm.stopPlaying(url: recording.fileURL)
                                    }else{
                                        vm.startPlaying(url: recording.fileURL)
                                    }
                                }) {
                                    Image(systemName: recording.isPlaying ? "stop.fill" : "play.fill")
                                        .foregroundColor(.blue)
                                        .font(.system(size:30))
                                }
                                WaveformView(audioURL: recording.fileURL, configuration: configuration)
                                    .padding(20)
                                if recording.isPlaying == false {
                                    VStack {
                                        Button(action: {
                                            vm.deleteRecording(url:recording.fileURL, note: note)
                                        }) {
                                            Image(systemName:"xmark.circle.fill")
                                                .foregroundColor(.gray)
                                                .font(.system(size:15))
                                                .offset(x: 14, y: 5)
                                        }
                                        Spacer()
                                    }
                                }
                                
                            }.padding(.horizontal, 35)                                }
                    }
                    .padding(.top, 10)
                }
            }
            
        }
    }
}

struct RecordingListView_Previews: PreviewProvider {
    static var previews: some View {
        RecordingListView(vm: VoiceViewModel(), note: Note.sampleData[0])
    }
}
