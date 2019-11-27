//
//  completePaymentViewController.swift
//  saudiClubs1
//
//  Created by Mohamed Samir on 11/27/19.
//  Copyright © 2019 Mohamed Samir. All rights reserved.
//

import UIKit

class completePaymentViewController: UIViewController {
    
    private var selectedPaymentMethod : String?
    
    @IBOutlet var dashedView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dashedView.addDashedBorder()
    }

}
