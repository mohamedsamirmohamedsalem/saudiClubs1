//
//  ResetPasswordViewController3.swift
//  saudiClubs1
//
//  Created by Mohamed Samir on 11/27/19.
//  Copyright © 2019 Mohamed Samir. All rights reserved.
//

import UIKit

class ResetPasswordViewController3: UIViewController {
    
    // MARK :- IBOutlets
    @IBOutlet var NewPasswordTF: UITextField!
    @IBOutlet var confirmNewPasswordTF: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        NewPasswordTF.underlined()
        confirmNewPasswordTF.underlined()
       
    }
    
    
    // MARK :- IBActions
    @IBAction func saveBut(_ sender: UIButton) {
        if let newpassword = NewPasswordTF.text , let confirmNewPassword = confirmNewPasswordTF.text {
            if (newpassword.isEmpty && confirmNewPassword.isEmpty){
                NewPasswordTF.shake()
                confirmNewPasswordTF.shake()
            }else if newpassword.isEmpty{
                NewPasswordTF.shake()
            }else if confirmNewPassword.isEmpty  || newpassword != confirmNewPassword {
                confirmNewPasswordTF.shake()
            }else{
                  let storyBoard = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "selectPaymentViewController") as! selectPaymentViewController
                             present(storyBoard, animated: true, completion: nil)
            }
        }else{
            print("go")
        }
    }
    
}
