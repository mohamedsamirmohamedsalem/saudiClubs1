//
//  CollectionViewCell.swift
//  Image Slider
//
//  Created by Abdalla on 1/18/19.
//  Copyright © 2019 Abdalla. All rights reserved.
//

import UIKit

class newcell: UICollectionViewCell {
    
    
    @IBOutlet weak var image: UIImageView!
    
    var image_: UIImage! {
        didSet {
            image.image = image_
        }
    }
    
    
}
