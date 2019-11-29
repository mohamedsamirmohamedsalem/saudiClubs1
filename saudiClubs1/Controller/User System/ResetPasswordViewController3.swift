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
            }else if confirmNewPassword.isEmpty {
                confirmNewPasswordTF.shake()
            }else if newpassword != confirmNewPassword {
                let alert = UIAlertController(title: "Warnning", message: "passwords are not matche", preferredStyle: .alert)
                                  let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
                                  alert.addAction(action)
                                  self.present(alert, animated: true, completion: nil)
            }else{
                  let storyBoard = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "selectPaymentViewController") as! selectPaymentViewController
                             present(storyBoard, animated: true, completion: nil)
            }
        }else{
            print("go")
        }
    }
    @IBAction func loginAsVisitor(_ sender: UIButton) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "TabBarController") as! TabBarController
               present(storyBoard, animated: true, completion: nil)
    }
    
    @IBAction func signUpViewController(_ sender: UIButton) {
           let stroyBoard = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "SignUpViewController") as! SignUpViewController
           present(stroyBoard, animated: true, completion: nil)
       }
}
