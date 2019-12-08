//
//  ResetPasswordViewController.swift
//  saudiClubs1
//
//  Created by Mohamed Samir on 11/26/19.
//  Copyright © 2019 Mohamed Samir. All rights reserved.
//

import UIKit

class ResetPasswordViewController1: UIViewController {
    
    var  AlertMessage:String?
    //Mark :- IBOutlets
    @IBOutlet var emailTF: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    //MARK:- IBAction
    @IBAction func sendVerificationCode(_ sender: UIButton) {
        self.view.endEditing(true)
        if let email = emailTF.text {
            if email.isEmpty{
                emailTF.shake()
            }else if !SignUpViewController.isValidEmail(emailStr: email){
                let alert = UIAlertController(title: "Warnning", message: "Email not Valid", preferredStyle: .alert)
                let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
                alert.addAction(action)
                self.present(alert, animated: true, completion: nil)
            }else{
                DispatchQueue.main.async{
                    let url = saudiBaseUrl + "/user/verify"
                    let parameter = ["username":email]
                    API.post(url, parameter: parameter, headers: nil) { (check, Response:EmailVerificationResponse?,HttpStatusCode) in
                        
                        guard let response = Response else {return}
                        let MyID = response.data?.id
                        let ApiToken = response.data?.token
                        let isVerified = response.data?.isVerified
                        let Mymessage = response.errorMessage
                        UserDefaults.standard.set(MyID , forKey: "myId")
                        UserDefaults.standard.synchronize()
                        UserDefaults.standard.set(ApiToken , forKey: "ApiToken")
                        UserDefaults.standard.synchronize()
                        UserDefaults.standard.set(isVerified , forKey: "isVerified")
                        UserDefaults.standard.synchronize()
                        UserDefaults.standard.set(isVerified , forKey: "errorMessage")
                        UserDefaults.standard.synchronize()
                        
                        print(HttpStatusCode)
                        switch HttpStatusCode {
                        case 200:   self.goingToNextViewController()
                        self.PrintAlert()
                        case 444: self.AlertMessage = "هذاالكودغير صالح أو منهي الصلاحية"
                        //  self.PrintAlert()
                        //case 401: self.message = Mymessage
                        self.PrintAlert()
                        self.PrintAlert()
                        case 500: self.AlertMessage = "لا نسطيع الاتصال بال خادم"
                        self.PrintAlert()
                        default:
                            print("============>Status Code Not Identified")
                        }
                    }
                }
           }
        }
    }
    
    @IBAction func signUpBut(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func loginAsVisitor(_ sender: UIButton) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "TabBarController") as! TabBarController
        present(storyBoard, animated: true, completion: nil)
    }
    //MArk :- Methods
    
    func goingToNextViewController(){
        let storyBoard = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "ResetPasswordViewController2") as! ResetPasswordViewController2
        present(storyBoard, animated: true, completion: nil)
        
    }
    func PrintAlert(){
        
    }
    //to check for validation of email
    class func isValidEmail(emailStr:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: emailStr)
    }
}
