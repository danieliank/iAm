//
//  AudioRecordToolbarView.swift
//  iAm
//
//  Created by Raphael on 10/07/24.
//

import SwiftUI

struct AudioRecordToolbarView: View {
    @State private var pulsate:Bool = false
    @State private var animate = false
    @ObservedObject var vm: VoiceViewModel
    
    var note: Note
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(.blue)
                .frame(width: 140)
                .foregroundStyle(.blue)
                .scaleEffect(pulsate ? 1.4 : 1)
                .opacity(pulsate ? 0 : 1)
                .animation(.easeInOut(duration: 2.5).repeatForever(autoreverses: false).speed(1))
            Circle()
                .stroke(.blue)
                .frame(width: 140)
                .foregroundStyle(.blue)
                .scaleEffect(pulsate ? 1.5 : 1)
                .opacity(pulsate ? 0 : 1)
                .animation(.easeInOut(duration: 3).repeatForever(autoreverses: false).speed(1))
            Circle()
                .frame(width: 140)
                .foregroundStyle(animate ? .white : .blue)
                .overlay(
                        Circle()
                            .stroke(animate ? Color.blue : Color.clear, lineWidth: animate ? 1 : 0)
                    )
            Image(systemName: animate ? "stop.fill" : "mic.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 25, height: 40)
                .foregroundStyle(animate ? .blue : .white)
                .symbolEffect(.scale)
        }
        .onAppear() {
            self.pulsate.toggle()
        }
        .onTapGesture {
            print("start recording")
            animate.toggle()
            if vm.isRecording == true {
                vm.stopRecording()
                vm.fetchAllRecording(audioURLs: note.audioFileName)
            } else {
                vm.startRecording(note: note)
                
            }
            
        }
        .padding(.vertical, 40)
    }
}

#Preview {
    AudioRecordToolbarView(vm: VoiceViewModel(), note: Note.sampleData[0])
}
