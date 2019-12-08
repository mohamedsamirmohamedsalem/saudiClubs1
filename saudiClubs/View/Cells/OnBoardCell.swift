//
//  Cell.swift
//  projectV1
//
//  Created by Mohamed Samir on 9/16/19.
//  Copyright © 2019 Mohamed Samir. All rights reserved.
//

import UIKit

class OnBoardCell: UICollectionViewCell {
 
    
     let butContent = [" نبذه عن النادي "," رياضات داخل النادي "," أخبار النادي "," المسابقات والانشطه "]
    @IBOutlet var ButOut: UIButton!{
    didSet {
        self.frame.size.width = SCREEN_WIDTH
         }
     }
    
    @IBOutlet var setViewsButton: UIButton!
    
}
