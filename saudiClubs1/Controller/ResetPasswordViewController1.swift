//
//  ResetPasswordViewController.swift
//  saudiClubs1
//
//  Created by Mohamed Samir on 11/26/19.
//  Copyright © 2019 Mohamed Samir. All rights reserved.
//

import UIKit

class ResetPasswordViewController1: UIViewController {
    
    //Mark :- IBOutlets
    @IBOutlet var emailTF: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    //MARK:- IBAction
    @IBAction func sendVerificationCode(_ sender: UIButton) {
        self.view.endEditing(true)
        if let email = emailTF.text {
            if email.isEmpty || !ResetPasswordViewController1.isValidEmail(emailStr: email){
                emailTF.shake()
            }else{
                let storyBoard = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "ResetPasswordViewController2") as! ResetPasswordViewController2
                present(storyBoard, animated: true, completion: nil)
                
            }
        }
    }
    
    //MArk :- Methods
    
    //to check for validation of email
     class func isValidEmail(emailStr:String) -> Bool {
         let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
         let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
         return emailPred.evaluate(with: emailStr)
     }
}
