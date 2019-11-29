//
//  ProfileViewController.swift
//  saudiClubs1
//
//  Created by Mohamed Samir on 11/28/19.
//  Copyright © 2019 Mohamed Samir. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    
    @IBOutlet var personalImage: UIImageView!
    @IBOutlet var nameTF: UITextField!
    @IBOutlet var phoneTF: UITextField!
    @IBOutlet var emailTF: UITextField!
    @IBOutlet var passwordTF: UITextField!
    @IBOutlet var confirmPasswordTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTF.underlined()
        phoneTF.underlined()
        emailTF.underlined()
        passwordTF.underlined()
        confirmPasswordTF.underlined()
    
    }
    
    
    //MARK :- IBActions
    @IBAction func updateDetails(_ sender: UIButton) {
        self.view.endEditing(true)
        if let name = nameTF.text , let phone = phoneTF.text , let password = passwordTF.text , let confirmPassword = confirmPasswordTF.text , let email = emailTF.text {
            //shake() all textFields if there are empty
                  if (email.isEmpty && name.isEmpty && password.isEmpty && confirmPassword.isEmpty  && phone.isEmpty){
                     emailTF.shake()
                     nameTF.shake()
                     passwordTF.shake()
                     confirmPasswordTF.shake()
                     phoneTF.shake()
                 }
            
            if !(email.isEmpty || phone.isEmpty || name.isEmpty || password.isEmpty || confirmPassword.isEmpty) &&  password == confirmPassword && SignUpViewController.isValidEmail(emailStr: email){
                print("profileupdated")
               
                
            }else{
            if name.isEmpty {
                nameTF.shake()
            }
            else if email.isEmpty{
                emailTF.shake()
            }else if password.isEmpty{
                passwordTF.shake()
            }else if confirmPassword.isEmpty{
                confirmPasswordTF.shake()
            }else if phone.isEmpty {
                phoneTF.shake()
            }else if !SignUpViewController.isValidEmail(emailStr: email){
                let alert = UIAlertController(title: "Warnning", message: "Email not Valid", preferredStyle: .alert)
                                  let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
                                  alert.addAction(action)
                                  self.present(alert, animated: true, completion: nil)
            }else if password != confirmPassword {
                let alert = UIAlertController(title: "Warnning", message: "passwords are not matche", preferredStyle: .alert)
                                  let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
                                  alert.addAction(action)
                                  self.present(alert, animated: true, completion: nil)
            }else {
                print("UnKnown Error")
            }

            }
            
        }
    }

}