//
//  VideoSplashViewController.swift
//  Project2_VideoBackground
//
//  Created by  Harold LIU on 2/17/16.
//  Copyright © 2016 Tongji Apple Club. All rights reserved.
//

import UIKit
import MediaPlayer
import AVKit


public enum ScalingMode {
    case Resize
    case ResizeAspect
    case ResizeAspectFill
}

class VideoSplashViewController: UIViewController {
    
    private let moviePlayer = AVPlayerViewController()
    private var moviePlayerSoundLevel:Float = 1.0
    
    var contentURL : NSURL = NSURL() {
        didSet{
            setMoviePlayer(contentURL)
        }
    }
    
    var videoFrame = CGRect()
    var startTime:CGFloat = 0.0
    var duration:CGFloat = 0.0
    var sound : Bool = true {
        didSet {
            if sound {
                moviePlayerSoundLevel = 1.0
            }
            else
            {
                moviePlayerSoundLevel = 0.0
            }
        }
    }
    
    var alpha = CGFloat() {
        didSet{
            moviePlayer.view.alpha = alpha
        }
    }
    
    var alwaysRepeat : Bool = true {
        didSet {
            if alwaysRepeat
            {
                NSNotificationCenter.defaultCenter().addObserver(self, selector: "playerItemDidReachEnd", name: AVPlayerItemDidPlayToEndTimeNotification, object: moviePlayer.player?.currentItem)
            }
        }
    }
    
    var fillMode:ScalingMode = .ResizeAspectFill {
        didSet{
            switch fillMode {
            case .Resize:
                moviePlayer.videoGravity = AVLayerVideoGravityResize
            case .ResizeAspect:
                moviePlayer.videoGravity = AVLayerVideoGravityResizeAspect
            case .ResizeAspectFill:
                moviePlayer.videoGravity = AVLayerVideoGravityResizeAspectFill
            }
        }
    }
    
    override func viewDidAppear(animated: Bool) {
       // super.viewDidAppear(animated)
        moviePlayer.view.frame = videoFrame
        moviePlayer.showsPlaybackControls = false
        view.addSubview(moviePlayer.view)
        view.sendSubviewToBack(moviePlayer.view)
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
    
    private func setMoviePlayer(url: NSURL){
        let videoCutter = VideoCutter()
        videoCutter.cropVideoWithUrl(videoUrl: url, startTime: startTime, duration: duration) { (videoPath, error) -> Void in
            if let path = videoPath as NSURL? {
                let priority = DISPATCH_QUEUE_PRIORITY_DEFAULT
                dispatch_async(dispatch_get_global_queue(priority, 0)) {
                    dispatch_async(dispatch_get_main_queue()) {
                        self.moviePlayer.player = AVPlayer(URL: path)
                        self.moviePlayer.player?.play()
                        self.moviePlayer.player?.volume = self.moviePlayerSoundLevel
                    }
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func playerItemDidReachEnd() {
        moviePlayer.player?.seekToTime(kCMTimeZero)
        moviePlayer.player?.play()
    }

    
}
