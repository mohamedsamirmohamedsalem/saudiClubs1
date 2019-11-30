//
//  ProfileViewController.swift
//  saudiClubs1
//
//  Created by Mohamed Samir on 11/28/19.
//  Copyright © 2019 Mohamed Samir. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController,UINavigationControllerDelegate {

     let imagePicker = UIImagePickerController()
   
    @IBOutlet var personalImage: UIImageView!
    @IBOutlet var imagePickerBut: UIButton!
    @IBOutlet var nameTF: UITextField!
    @IBOutlet var phoneTF: UITextField!
    @IBOutlet var emailTF: UITextField!
    @IBOutlet var passwordTF: UITextField!
    @IBOutlet var confirmPasswordTF: UITextField!
    
   
    
    @IBOutlet var containerView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
    }
    override func viewDidLayoutSubviews() {
        
    
        
         containerView.layer.cornerRadius = containerView.frame.height / 2
         personalImage.layer.cornerRadius = personalImage.frame.height / 2
         personalImage.clipsToBounds = true
         imagePickerBut.layer.cornerRadius = imagePickerBut.frame.height / 2
     }
    
    //MARK :- IBActions
    @IBAction func imagePickerBut(_ sender: UIButton) {
        print("update image button clicked")
               imagePicker.sourceType = .photoLibrary
        //        imagePicker.allowsEditing = true
                
                self.present(imagePicker, animated: true, completion: nil)
    }
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


extension ProfileViewController :UIImagePickerControllerDelegate{
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let pickerImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
            
            personalImage.image = pickerImage
        }
        
        dismiss(animated: true, completion: nil)
    }
}

