//
//  Extension+AVPlayerItem.swift
//  AppleMusicStApp
//
//  Created by 민성홍 on 2021/04/02.
//

import AVFoundation
import UIKit

extension AVPlayerItem {
    func converToTrack() -> Track? {
        let metadataList = asset.metadata
        
        var trackTitle: String?
        var trackArtist: String?
        var trackAlbumName: String?
        var trackArtwork: UIImage?
        
        for metadata in metadataList {
            if let title = metadata.title {
                trackTitle = title
            }
            
            if let artist = metadata.artist {
                trackArtist = artist
            }
            if let albumeName = metadata.albumName {
                trackAlbumName = albumeName
            }
            
            if let artwork = metadata.atrwork {
                trackArtwork = artwork
            }
        }
        
        guard let title = trackTitle,
              let artist = trackArtist,
              let albumName = trackAlbumName,
              let artwork = trackArtwork else {
            return nil
        }
        return Track(title: title, artist: artist, albumName: albumName, artwork: artwork)
    }
}

extension AVMetadataItem {
    var title: String? {
        guard let key = commonKey?.rawValue, key == "title" else { return nil }
        return stringValue
    }
    
    var artist: String? {
        guard let key = commonKey?.rawValue, key == "artist" else { return nil }
        return stringValue
    }
    
    var albumName: String? {
        guard let key = commonKey?.rawValue, key == "albumName" else { return nil }
        return stringValue
    }
    
    var atrwork: UIImage? {
        guard let key = commonKey?.rawValue, key == "artwork", let data = dataValue, let image = UIImage(data: data) else { return nil }
        return image
    }
}

extension AVPlayer {
    var isPlaying: Bool {
        guard self.currentItem != nil else { return false }
        return self.rate != 0
    }
}
