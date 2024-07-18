//
//  AudioManager.swift
//  iAm
//
//  Created by Raphael on 14/07/24.
//

import Foundation
import AVFoundation

class VoiceViewModel : NSObject, RecordProtocol, PlaybackProtocol, AudioFileProtocol , ObservableObject , AVAudioPlayerDelegate {
    
    var audioRecorder : AVAudioRecorder!
    var audioPlayer : AVAudioPlayer!
    
    @Published var isRecording : Bool = false
    
    @Published var recordingsList = [Recording]()
    
    
    override init(){
        super.init()
    }
    
    
    func startRecording(note: Note){
        
        let recordingSession = AVAudioSession.sharedInstance()
        do {
            try recordingSession.setCategory(.playAndRecord, mode: .default)
            try recordingSession.setActive(true)
        } catch {
            print("Can not setup the Recording")
        }
        
        let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        let fileName = path.appendingPathComponent("\(Date().toString(dateFormat: "dd-MM-YY 'at' HH:mm:ss")).m4a")
        
        // simpen filename
        note.audioFileName.append(fileName)
        
        let settings = [
            AVFormatIDKey: Int(kAudioFormatMPEG4AAC),
            AVSampleRateKey: 12000,
            AVNumberOfChannelsKey: 1,
            AVEncoderAudioQualityKey: AVAudioQuality.high.rawValue
        ]
        
        
        do {
            audioRecorder = try AVAudioRecorder(url: fileName, settings: settings)
            audioRecorder.prepareToRecord()
            audioRecorder.record()
            isRecording = true
            
        } catch {
            print("Failed to Setup the Recording")
        }
    }
    
    
    func stopRecording(){
        audioRecorder.stop()
        isRecording = false
    }
    
    func fetchAllRecording(audioURLs: [URL]) {
        recordingsList = []
        
        if (audioURLs.count > 0) {
            for i in audioURLs {
                recordingsList.append(Recording(fileURL: i, createdAt: getFileDate(for: i), isPlaying: false))
                print(i)
            }
            
            recordingsList.sort(by: { $0.createdAt.compare($1.createdAt) == .orderedDescending })
        }
    }
    
    func startPlaying(url : URL) {
        
        let playSession = AVAudioSession.sharedInstance()
        
        do {
            try playSession.overrideOutputAudioPort(AVAudioSession.PortOverride.speaker)
        } catch {
            print("Playing failed in Device")
        }
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf : url)
            audioPlayer.prepareToPlay()
            audioPlayer.play()
            
            for i in 0..<recordingsList.count{
                if recordingsList[i].fileURL == url{
                    recordingsList[i].isPlaying = true
                }
            }
            
        } catch {
            print("Playing Failed")
        }
        
    }
    
    func stopPlaying(url : URL){
        
        audioPlayer.stop()
        
        for i in 0..<recordingsList.count {
            if recordingsList[i].fileURL == url {
                recordingsList[i].isPlaying = false
            }
        }
        
    }
    
    func deleteRecording(url : URL, note: Note){
        
        do {
            try FileManager.default.removeItem(at : url)
        } catch {
            print("Can't delete")
        }
        
        for i in 0..<note.audioFileName.count {
            
            if note.audioFileName[i] == url {
                note.audioFileName.remove(at : i)
                break
            }
        }
        
        fetchAllRecording(audioURLs: note.audioFileName)
    }
    
    func getFileDate(for file: URL) -> Date {
        if let attributes = try? FileManager.default.attributesOfItem(atPath: file.path) as [FileAttributeKey: Any],
           let creationDate = attributes[FileAttributeKey.creationDate] as? Date {
            return creationDate
        } else {
            return Date()
        }
    }
}

