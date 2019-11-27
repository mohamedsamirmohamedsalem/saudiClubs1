//
//  SignUpViewController.swift
//  saudiClubs1
//
//  Created by Mohamed Samir on 11/26/19.
//  Copyright © 2019 Mohamed Samir. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {

    //MARK :- IBoutlets
    @IBOutlet var nameTF: UITextField!
    @IBOutlet var phoneTF: UITextField!
    @IBOutlet var ConfirmPasswordTF: UITextField!
    @IBOutlet var passwordTF: UITextField!
    @IBOutlet var emailTF: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

     
    }
    
    //MARK :- IBActions
    @IBAction func signUpBut(_ sender: UIButton) {
        self.view.endEditing(true)
        if let name = nameTF.text , let phone = phoneTF.text , let password = passwordTF.text , let confirmPassword = ConfirmPasswordTF.text , let email = emailTF.text {
            //shake() all textFields if there are empty
                  if (email.isEmpty && name.isEmpty && password.isEmpty && confirmPassword.isEmpty  && phone.isEmpty){
                     emailTF.shake()
                     nameTF.shake()
                     passwordTF.shake()
                     ConfirmPasswordTF.shake()
                     phoneTF.shake()
                 }
            
            if !(email.isEmpty || phone.isEmpty || name.isEmpty || password.isEmpty || confirmPassword.isEmpty) &&  password == confirmPassword && SignUpViewController.isValidEmail(emailStr: email){
                print("sign up success")
                let storyBoard = UIStoryboard(name: "Main", bundle: nil
                ).instantiateViewController(identifier: "ResetPasswordViewController1") as! ResetPasswordViewController1
                present(storyBoard, animated: true, completion: nil)
                
            }else{
            if name.isEmpty {
                nameTF.shake()
            }
            else if email.isEmpty || !SignUpViewController.isValidEmail(emailStr: email){
                emailTF.shake()
            }else if password.isEmpty{
                passwordTF.shake()
            }else if confirmPassword.isEmpty || password != confirmPassword {
                ConfirmPasswordTF.shake()
            }else if phone.isEmpty {
                phoneTF.shake()
            }else {
                print("UnKnown Error")
            }

            }
            
        }
    }
    @IBAction func haveAnAccount(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    //MARK :- methods
    //to check for validation of email
       class func isValidEmail(emailStr:String) -> Bool {
           let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
           let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
           return emailPred.evaluate(with: emailStr)
       }
}
