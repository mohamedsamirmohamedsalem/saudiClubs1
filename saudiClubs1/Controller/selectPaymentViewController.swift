//
//  selectPaymentViewController.swift
//  saudiClubs1
//
//  Created by Mohamed Samir on 11/27/19.
//  Copyright © 2019 Mohamed Samir. All rights reserved.
//

import UIKit

class selectPaymentViewController: UIViewController {
    @IBOutlet var rightView: ViewCorners!
    
    @IBOutlet var leftView: ViewCorners!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func payBySendMessageBut(_ sender: UIButton) {
        rightView.backgroundColor = #colorLiteral(red: 0.8351856872, green: 0.8351856872, blue: 0.8351856872, alpha: 1)
         leftView.backgroundColor = #colorLiteral(red: 0.9411764706, green: 0.9411764706, blue: 0.9411764706, alpha: 1)
    }

    @IBAction func payThroughBank(_ sender: UIButton) {
       rightView.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        leftView.backgroundColor = #colorLiteral(red: 0.8351856872, green: 0.8351856872, blue: 0.8351856872, alpha: 1)
    }
}
