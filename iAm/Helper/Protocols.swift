//
//  Protocols.swift
//  iAm
//
//  Created by Alfadli Maulana Siddik on 18/07/24.
//

import Foundation
import AVFoundation

protocol RecordProtocol {
    var audioRecorder: AVAudioRecorder! {get set}
    func startRecording(note: Note)
    func stopRecording()
}

protocol PlaybackProtocol {
    var audioPlayer: AVAudioPlayer! {get set}
    func startPlaying(url : URL)
    func stopPlaying(url : URL)
}

protocol AudioFileProtocol {
    func fetchAllRecording(audioURLs: [URL])
    func deleteRecording(url : URL, note: Note)
    func getFileDate(for file: URL) -> Date
}
