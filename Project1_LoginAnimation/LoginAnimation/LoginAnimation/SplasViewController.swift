//
//  SplasViewController.swift
//  LoginAnimation
//
//  Created by  Harold LIU on 2/16/16.
//  Copyright © 2016 Tongji Apple Club. All rights reserved.
//

import UIKit

class SplasViewController: UIViewController {

    @IBOutlet weak var SignUpButton: UIButton!
    @IBOutlet weak var LoginButton: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        SignUpButton.layer.cornerRadius = 5
        LoginButton.layer.cornerRadius = 5
        
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }

}
