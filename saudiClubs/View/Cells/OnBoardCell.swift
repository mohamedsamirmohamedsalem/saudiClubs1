//
//  Cell.swift
//  projectV1
//
//  Created by Mohamed Samir on 9/16/19.
//  Copyright © 2019 Mohamed Samir. All rights reserved.
//

import UIKit

class OnBoardCell: UICollectionViewCell {
    
    @IBOutlet weak var image: UIImageView!
    
    var image_: UIImage! {
        didSet {
            image.image = image_
        }
    }
    

}
