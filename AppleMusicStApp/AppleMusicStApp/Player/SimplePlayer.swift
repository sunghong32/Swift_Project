//
//  SimplePlayer.swift
//  AppleMusicStApp
//
//  Created by 민성홍 on 2021/04/02.
//

import AVFoundation

class SimplePlayer {
    // TODO: 싱글톤 만들기, 왜 만드는가?
    static let shared = SimplePlayer()
    
    private let player = AVPlayer()
    
    var currentTime: Double {
        // TODO: currentTime 구하기
        return currentItem?.currentTime().seconds ?? 0
    }
    
    var totalDurationTime: Double {
        // TODO: totalDurationTime 구하기
        return player.currentItem?.duration.seconds ?? 0
    }
    
    var isPlaying: Bool {
        // TODO: isPlaying 구하기
        return player.isPlaying
    }
    
    var currentItem: AVPlayerItem? {
        // TODO: currentItem 구하기
        return player.currentItem
    }
    
    init() { }
    
    func pause() {
        // TODO: pause 구현
        player.pause()
    }
    
    func play() {
        // TODO: play 구현
        player.play()
    }
    
    func seek(to time: CMTime) {
        // TODO: seek 구현
        player.seek(to: time)
    }
    
    func replaceCurrentItem(with item: AVPlayerItem?) {
        // TODO: replace current item 구현
        player.replaceCurrentItem(with: item)
    }
    
    func addPeriodicTimeObserver(forInterver: CMTime, queue: DispatchQueue?, using: @escaping (CMTime) -> Void) {
        player.addPeriodicTimeObserver(forInterval: forInterver, queue: queue, using: using)
    }
    
}
