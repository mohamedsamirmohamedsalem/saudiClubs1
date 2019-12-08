//
//  SignUpViewController.swift
//  saudiClubs1
//
//  Created by Mohamed Samir on 11/26/19.
//  Copyright © 2019 Mohamed Samir. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {

     var message:String?
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
    @IBAction func loginAsVisitor(_ sender: UIButton) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "TabBarController") as! TabBarController
               present(storyBoard, animated: true, completion: nil)
    }
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
                /////////////////////////////////////////
                
                DispatchQueue.main.async{
                    let url = saudiBaseUrl + "/user/register"
                    let parameter = ["username":name, "password":password,"password_confirmation":confirmPassword ,"email":email ,"phone":phone]
                    API.post(url, parameter: parameter, headers: nil) { (check, Response:RegisterResponse?,HttpStatusCode) in
                        print(HttpStatusCode)
                        guard let response = Response else {print("Unable to get reponse");return}
                           let signUpErrorPhone = response.errors?.phone?[1]
                        let signUpErrorEmail = response.errors?.email?[1]
                        print(signUpErrorEmail)
                            switch HttpStatusCode {
                            case 200:   self.GoingToSecondScreen()
                            self.PrintAlert()
                            case 444: self.message = "هذاالكودغير صالح أو منهي الصلاحية"
                          //  self.PrintAlert()
                            //case 401: self.message = Mymessage
                            self.PrintAlert()
                            self.PrintAlert()
                            case 422,404:
                                self.message = "hu"
                                self.PrintAlert()
                            case 500: self.message = "لا نسطيع الاتصال بال خادم"
                            self.PrintAlert()
                            default:
                                print("============>Status Code Not Identified")
                            }
                    }
                }
                
                
            }else{
                if name.count < 3 {
                    PrintAlert("يجب أن يكون طول النص اسم المُستخدم ورقم الهاتف على الأقل 3 حروف")
                }else if name.isEmpty {
                nameTF.shake()
            }
            else if email.isEmpty{
                emailTF.shake()
            }else if password.isEmpty{
                passwordTF.shake()
            }else if password.count < 8{
                PrintAlert("يجب الا تقل كلمة المرور عن ٨ حروف")
            }else if confirmPassword.isEmpty{
                ConfirmPasswordTF.shake()
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
    @IBAction func haveAnAccount(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    func GoingToSecondScreen(){
    let storyBoard = UIStoryboard(name: "Main", bundle: nil
    ).instantiateViewController(identifier: "ResetPasswordViewController1") as! ResetPasswordViewController1
    present(storyBoard, animated: true, completion: nil)
    }
    
    
    func PrintAlert(){
          let alert = UIAlertController(title: "تحذير", message: message, preferredStyle: .alert)
          let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
          alert.addAction(action)
          self.present(alert, animated: true, completion: nil)
      }
    func PrintAlert(_ initialMessage:String){
            let alert = UIAlertController(title: "تحذير", message: initialMessage, preferredStyle: .alert)
            let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
            alert.addAction(action)
            self.present(alert, animated: true, completion: nil)
        }
    //MARK :- methods
    //to check for validation of email
       class func isValidEmail(emailStr:String) -> Bool {
           let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
           let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
           return emailPred.evaluate(with: emailStr)
       }
}
