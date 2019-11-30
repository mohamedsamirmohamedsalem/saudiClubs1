//
//  AppTermsViewController.swift
//  saudiClubs
//
//  Created by Mohamed Samir on 11/30/19.
//  Copyright © 2019 Mohamed Samir. All rights reserved.
//

import UIKit

class AppTermsViewController: UIViewController {

    var selectedButtton = 0 //
    
    @IBOutlet var AutoSizingView: ViewCorners!
    @IBOutlet var AutoSizingViewConstrain: NSLayoutConstraint!
    @IBOutlet var AutoHideAndShowLB: UILabel!
    
    @IBOutlet var showAnhHideLabelBut: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        AutoHideAndShowLB.isHidden = true

    }
    

     // MARK: - IBActions
    @IBAction func ShowAndHideLabel(_ sender: UIButton) {
        UIView.animate(withDuration: 0.7) {
            if self.selectedButtton == 0 {
                  self.selectedButtton = 1
                if let plusImage = UIImage(systemName: "plus.circle") {
              //  self.showAnhHideLabelBut.setImage(plusImage, for: .normal)
                }
                self.AutoSizingViewConstrain.constant =  0.1 * SCREEN_HEIGHT
                self.AutoHideAndShowLB.isHidden = false
                
            }else{
                self.selectedButtton = 0
                if let minusImage = UIImage(systemName: "minus.circle") {
              //  self.showAnhHideLabelBut.setImage(minusImage, for: .normal)
                }
                self.AutoSizingViewConstrain.constant = 0.009 *  SCREEN_HEIGHT
                self.AutoSizingViewConstrain.constant =  self.AutoSizingViewConstrain.constant
                self.AutoHideAndShowLB.isHidden = true
            }
            self.view.layoutIfNeeded()
        }
    }
   

}
