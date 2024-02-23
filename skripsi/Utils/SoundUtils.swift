//
//  SoundUtils.swift
//  skripsi
//
//  Created by Rival Fauzi on 24/01/24.
//

import Foundation
import AVFoundation

var player: AVAudioPlayer?

func playSound(name: String) {
    let url = Bundle.main.url(forResource: name, withExtension: "m4a")
    do {
        try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
        player = try AVAudioPlayer(contentsOf: url!, fileTypeHint: AVFileType.mp3.rawValue)
        player!.play()
    } catch let error {
        print(error.localizedDescription)
    }
}
