//
//  ViewController.swift
//  LoginAnimation
//
//  Created by  Harold LIU on 2/16/16.
//  Copyright © 2016 Tongji Apple Club. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var passWord: UITextField!
    
    @IBOutlet weak var centerAlginUserName: NSLayoutConstraint!
    @IBOutlet weak var centerAlginPassword: NSLayoutConstraint!
    
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userName.layer.cornerRadius = 5
        passWord.layer.cornerRadius = 5
        
        loginButton.layer.cornerRadius = 5
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        centerAlginPassword.constant -= view.bounds.width
        centerAlginUserName.constant -= view.bounds.width
        
        loginButton.alpha = 0
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animateWithDuration(0.5,
            delay: 0.00,
            options: UIViewAnimationOptions.CurveEaseOut,
            animations: { () -> Void in
                self.centerAlginPassword.constant += self.view.bounds.width
                self.view.layoutIfNeeded()
            },
            completion: nil)
        
        UIView.animateWithDuration(0.5,
            delay: 0.10,
            options: .CurveEaseOut,
            animations: { () -> Void in
                self.centerAlginUserName.constant += self.view.bounds.width
                self.view.layoutIfNeeded()
            },
            completion: nil)
        
        UIView.animateWithDuration(0.5, delay: 0.20, options: .CurveEaseOut, animations: {
            
            self.loginButton.alpha = 1
            
            }, completion: nil)
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    
    
    @IBAction func back(sender: AnyObject) {
        self.navigationController?.popToRootViewControllerAnimated(true)
    }
    
    @IBAction func Login(sender: AnyObject) {
        
        let bounds = self.loginButton.bounds
        
        UIView.animateWithDuration(1.0,
            delay: 0,
            usingSpringWithDamping: 0.2,
            initialSpringVelocity: 10,
            options: .CurveLinear,
            animations: { () -> Void in
                self.loginButton.bounds = CGRect(x: bounds.origin.x - 20, y: bounds.origin.y, width: bounds.size.width + 60, height: bounds.size.height)
                self.loginButton.enabled = false
            },
            completion: nil)
    }
    
    
}

