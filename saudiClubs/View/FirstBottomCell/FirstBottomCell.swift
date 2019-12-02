//
//  FirstBottomCell.swift
//  saudiClubs
//
//  Created by Mohamed Samir on 12/1/19.
//  Copyright © 2019 Mohamed Samir. All rights reserved.
//

import UIKit

class FirstBottomCell: UITableViewCell  {

    @IBOutlet var firstView: UIView!
    @IBOutlet var secobdView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBAction func buttonAction(_ sender: UIButton) {
        if sender.tag == 0 {
            firstView.isHidden = true
            secobdView.isHidden = false
        }else if sender.tag == 1 {
            firstView.isHidden = false
                      secobdView.isHidden = true
        }else if sender.tag == 2 {
            firstView.isHidden = true
                      secobdView.isHidden = false
        }else {
            firstView.isHidden = false
                      secobdView.isHidden = true
        }
    }
    
}
