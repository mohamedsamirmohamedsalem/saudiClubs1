//
//  TabBarController.swift
//  saudiClubs1
//
//  Created by Mohamed Samir on 11/28/19.
//  Copyright © 2019 Mohamed Samir. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {

    @IBOutlet var TabBar: UITabBar!
    @IBInspectable var defininedIndex = 2
    
    override func viewDidLoad() {
        super.viewDidLoad()
        selectedIndex = defininedIndex
        
       
        
    }
    
}
