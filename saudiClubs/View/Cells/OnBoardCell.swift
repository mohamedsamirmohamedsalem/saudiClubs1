//
//  Cell.swift
//  projectV1
//
//  Created by Mohamed Samir on 9/16/19.
//  Copyright © 2019 Mohamed Samir. All rights reserved.
//

import UIKit

class OnBoardCell: UICollectionViewCell {
 
    
    @IBOutlet var labelOut: UILabel!{
        didSet {
            self.cornerRadius = 20 
        }
    }
    
    @IBOutlet var ButOut: UIButton!{
    didSet {
        self.frame.size.width = SCREEN_WIDTH
         }
     }
}
