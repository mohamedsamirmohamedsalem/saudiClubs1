//
//  ButtonsCollectionViewCell.swift
//  saudiClubs
//
//  Created by Mohamed Samir on 12/1/19.
//  Copyright © 2019 Mohamed Samir. All rights reserved.
//

import UIKit

class ButtonsCollectionViewCell: UICollectionViewCell {

    @IBOutlet var CollectionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        CollectionLabel.cornerRadius = 20
        CollectionLabel.clipsToBounds = true
    }

  
}
