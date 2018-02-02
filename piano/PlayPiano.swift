//
//  PlayPiano.swift
//  piano
//
//  Created by wilson on 2018/1/31.
//  Copyright © 2018年 wilson. All rights reserved.
//

import Foundation
import AVFoundation
var KeycountTotal:Int = 0
var Scores:Int = 0
var SpectrumArray = [Int]()
var RightSpectrumArray = [1,1,5,5,6,6,5,4,4,3,3,2,2,1,5,5,4,4,3,3,2,5,5,4,4,3,3,2,1,1,5,5,6,6,5,4,4,3,3,2,2,1]
var soundName:String? = nil

//func播放聲音
var player: AVAudioPlayer?
func playSound(soundName:String) {
    guard let url = Bundle.main.url(forResource: soundName, withExtension: "mp3") else { return }
    do {
        try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
        try AVAudioSession.sharedInstance().setActive(true)
        player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
        guard let player = player else { return }
        player.play()
    }catch let error {
        print(error.localizedDescription)
    }
}

//func
func keyCal() -> Int{
    KeycountTotal += 1
    if KeycountTotal == 42 {
        KeycountTotal = 0
        Scores = 0
        playSound(soundName:"Mozart1")
        SpectrumArray.removeSubrange(0...41)
    }
    return KeycountTotal
}
