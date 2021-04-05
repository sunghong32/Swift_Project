//
//  TrackColletionHeaderView.swift
//  AppleMusicStApp
//
//  Created by 민성홍 on 2021/04/02.
//

import UIKit
import AVFoundation

class TrackColletionHeaderView: UICollectionReusableView {
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var item: AVPlayerItem?
    var tapHandler: ((AVPlayerItem) -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        thumbnailImageView.layer.cornerRadius = 4
    }
    
    func update(with item: AVPlayerItem) {
        // TODO: 헤더뷰 업데이트 하기
        self.item = item
        guard let track = item.converToTrack() else { return }
        self.thumbnailImageView.image = track.artwork
        self.descriptionLabel.text = "Today's pick is \(track.artist)'s album - \(track.albumName), Let's listen"
    }
    
    @IBAction func cardTapped(_ sender: UIButton) {
        // TODO: 탭 했을 때 처리
        guard let todaysItem = item else { return }
        tapHandler?(todaysItem)
    }
}
