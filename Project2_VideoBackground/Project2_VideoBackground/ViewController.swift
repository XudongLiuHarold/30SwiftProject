//
//  ViewController.swift
//  Project2_VideoBackground
//
//  Created by  Harold LIU on 2/17/16.
//  Copyright © 2016 Tongji Apple Club. All rights reserved.
//

import UIKit

class ViewController: VideoSplashViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setupVideoBackground()
    }

    func setupVideoBackground() {
        
        let url = NSURL.fileURLWithPath(NSBundle.mainBundle().pathForResource("moments", ofType: "mp4")!)
        
        videoFrame = view.frame
        fillMode = .ResizeAspectFill
        alwaysRepeat = true
        sound = true
        startTime = 2.0
        alpha = 0.8
        
        contentURL = url
        view.userInteractionEnabled = false
        
    }

    
}

