//
//  SimplePlayer.swift
//  AppleMusicStApp
//
//  Created by 민성홍 on 2021/04/02.
//

import AVFoundation

class SimplePlayer {
    // TODO: 싱글톤 만들기, 왜 만드는가?
    
    private let player = AVPlayer()
    
    var currentTime: Double {
        // TODO: currentTime 구하기
        return 0.0
    }
    
    var totalDurationTime: Double {
        // TODO: totalDurationTime 구하기
        return 0.0
    }
    
    var isPlaying: Bool {
        // TODO: isPlaying 구하기
        return false
    }
    
    var currentItem: AVPlayerItem? {
        // TODO: currentItem 구하기
        return nil
    }
    
    init() { }
    
    func pause() {
        // TODO: pause 구현
        
    }
}
