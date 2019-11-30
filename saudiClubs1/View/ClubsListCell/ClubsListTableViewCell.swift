//
//  ClubsListTableViewCell.swift
//  saudiClubs
//
//  Created by Mohamed Samir on 11/30/19.
//  Copyright © 2019 Mohamed Samir. All rights reserved.
//

import UIKit

class ClubsListTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
           self.backgroundColor = UIColor.clear
              self.backgroundView = UIView()
              self.contentView.backgroundColor = UIColor.clear
    }
    
}
