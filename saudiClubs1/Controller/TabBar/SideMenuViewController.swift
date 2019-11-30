//
//  SideMenuViewController.swift
//  saudiClubs1
//
//  Created by Mohamed Samir on 11/28/19.
//  Copyright © 2019 Mohamed Samir. All rights reserved.
//

import UIKit

class SideMenuViewController: UIViewController , UITabBarControllerDelegate  {
    
    
    @IBOutlet var personalImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    @IBAction func sideMenuButtons(_ sender: UIButton) {
        
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        
        if sender.tag == 1 {
          self.tabBarController?.selectedIndex = 2
        }else if sender.tag == 3 {
            let vc = storyBoard.instantiateViewController(identifier: "MyFollowlistViewController") as! MyFollowlistViewController
                       present(vc, animated: true, completion: nil)
        }else if sender.tag == 4 {
            let vc = storyBoard.instantiateViewController(identifier: "AppTermsViewController") as! AppTermsViewController
                       present(vc, animated: true, completion: nil)
        }else if sender.tag == 5 {
            let vc = storyBoard.instantiateViewController(identifier: "AboutAppViewController") as! AboutAppViewController
                                 present(vc, animated: true, completion: nil)
        }else if sender.tag == 6 {
            let vc = storyBoard.instantiateViewController(identifier: "ContactUsViewController") as! ContactUsViewController
            present(vc, animated: true, completion: nil)
        }else if sender.tag == 7 {
            print("you have been sighned out ")
            let vc = storyBoard.instantiateViewController(identifier: "SplashViewController") as! SplashViewController
            present(vc, animated: true, completion: nil)
        }else {
            print("======>>Unknown Error")
        }
        
       
    }
    
}
