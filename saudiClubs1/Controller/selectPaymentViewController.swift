//
//  selectPaymentViewController.swift
//  saudiClubs1
//
//  Created by Mohamed Samir on 11/27/19.
//  Copyright © 2019 Mohamed Samir. All rights reserved.
//

import UIKit

class selectPaymentViewController: UIViewController {
    
    private var selectedPaymentMethod : String?
    
    @IBOutlet var rightView: ViewCorners!
    @IBOutlet var leftView: ViewCorners!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func payBySendMessageBut(_ sender: UIButton) {
        selectedPaymentMethod = "sms"
        UIView.animate(withDuration: 1) {
            self.rightView.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
            self.leftView.backgroundColor = #colorLiteral(red: 0.9411764706, green: 0.9411764706, blue: 0.9411764706, alpha: 1)
            }
        }

    @IBAction func payThroughBank(_ sender: UIButton) {
         selectedPaymentMethod = "bank"
        UIView.animate(withDuration: 1) {
            self.rightView.backgroundColor = #colorLiteral(red: 0.9411764706, green: 0.9411764706, blue: 0.9411764706, alpha: 1)
            self.leftView.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        }
    }
    
    @IBAction func completeBut(_ sender: UIButton) {
        performSegue(withIdentifier: "completePaymentViewController", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "completePaymentViewController"{
            if let destinationViewController = segue.destination as? completePaymentViewController {
                destinationViewController.selectedPaymentMethod = selectedPaymentMethod
            }
        }
    }
    
}
