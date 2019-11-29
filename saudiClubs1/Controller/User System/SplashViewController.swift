//
//  ViewController.swift
//  saudiClubs1
//
//  Created by Mohamed Samir on 11/26/19.
//  Copyright © 2019 Mohamed Samir. All rights reserved.
//

import UIKit

class SplashViewController : UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    
    override func viewWillAppear(_ animated: Bool) {
       
    }
    func goToLoginViewController(){
        let storyBoard = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "LoginViewController") as! LoginViewController
        self.present(storyBoard, animated: true, completion: nil)
    }
}

