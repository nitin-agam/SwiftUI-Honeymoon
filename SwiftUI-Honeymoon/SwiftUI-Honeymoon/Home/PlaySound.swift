//
//  PlaySound.swift
//  SwiftUI-Honeymoon
//
//  Created by Nitin Aggarwal on 14/12/22.
//

import AVFoundation

var audioPlayer: AVAudioPlayer?

func playSound(sound: String, type: String) {
    if let path = Bundle.main.path(forResource: sound, ofType: type) {
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            audioPlayer?.play()
        } catch {
            print("error: could not find and play the sound file...")
        }
    }
}
