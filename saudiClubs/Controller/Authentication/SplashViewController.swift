//
//  ViewController.swift
//  saudiClubs1
//
//  Created by Mohamed Samir on 11/26/19.
//  Copyright © 2019 Mohamed Samir. All rights reserved.
//

import UIKit

class SplashViewController : UIViewController {
    
    @IBOutlet var widthConstrain: NSLayoutConstraint!
    @IBOutlet var hightConstrain: NSLayoutConstraint!
    
    @IBOutlet var photoView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        makeImageAnimate()
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.goToLoginViewController()
        }
    }
    
    func makeImageAnimate(){
        self.photoView.alpha = 0
        UIView.animate(withDuration: 2, delay: 0, options: UIView.AnimationOptions.showHideTransitionViews, animations: { () -> Void in
            self.photoView.alpha = 1
        }, completion: { (Bool) -> Void in})
        
    }
    func goToLoginViewController(){
        
        if let ApiToken  = UserDefaults.standard.string(forKey: "ApiToken"){
            if  UserDefaults.standard.object(forKey: "ApiToken") != nil {
                let storyBoard = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "TabBarController") as! TabBarController
                self.present(storyBoard, animated: true, completion: nil)
                
            }else{
                let storyBoard = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "LoginViewController") as! LoginViewController
                self.present(storyBoard, animated: true, completion: nil)
            }
        }else{
            let storyBoard = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "LoginViewController") as! LoginViewController
            self.present(storyBoard, animated: true, completion: nil)
        }
        
    }
}

