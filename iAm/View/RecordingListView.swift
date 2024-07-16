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
    
    @ObservedObject var vm = VoiceViewModel()
    @State private var configuration: Waveform.Configuration = Waveform.Configuration(
        style: .striped(Waveform.Style.StripeConfig(color: .gray, width: 4, lineCap: .round)),
        verticalScalingFactor: 1
    )
    
    var body: some View {
        NavigationView {
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
                                    VStack {
                                        Button(action: {
                                            vm.deleteRecording(url:recording.fileURL)
                                        }) {
                                            Image(systemName:"xmark.circle.fill")
                                                .foregroundColor(.gray)
                                                .font(.system(size:15))
                                                .offset(x: 14, y: 5)
                                        }
                                        Spacer()
                                    }
                                    
                                }.padding(.horizontal, 35)                                }
                        }
                        
                    }
                }
                
            }
        }
    }
}

struct RecordingListView_Previews: PreviewProvider {
    static var previews: some View {
        RecordingListView()
    }
}
