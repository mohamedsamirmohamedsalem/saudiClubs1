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
        if sender.tag == 1 {

        }else if sender.tag == 2 {
            
        }else if sender.tag == 3 {
            
        }else if sender.tag == 4 {
            
        }else if sender.tag == 5 {
            
        }else if sender.tag == 6 {
            
        }else if sender.tag == 7 {
            
        }else {
            print("======>>Unknown Error")
        }
        
    }
    
}
