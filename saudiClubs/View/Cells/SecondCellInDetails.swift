//
//  SecondCellInDetails.swift
//  saudiClubs
//
//  Created by Mohamed Samir on 12/2/19.
//  Copyright © 2019 Mohamed Samir. All rights reserved.
//

import UIKit

class SecondCellInDetails: UIView {

        @IBOutlet var ContainerView: UIView!

       required init?(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)
            print("It is working")
            commonInit()
        }
        
        func commonInit(){
            if let nibView = Bundle.main.loadNibNamed("SecondCellInDetails", owner: self, options: nil)?.first as? UIView{
                nibView.frame = self.bounds
                self.addSubview(nibView)
                ContainerView = nibView
            }
        }
    }
