//
//  LoginViewController.swift
//  saudiClubs1
//
//  Created by Mohamed Samir on 11/26/19.
//  Copyright © 2019 Mohamed Samir. All rights reserved.
//

import UIKit
import Alamofire

class LoginViewController: UIViewController {
    
    let APIobj = API()
    //Mark :- IBOutlets
    @IBOutlet var phoneNumberTF: UITextField!
    @IBOutlet var passwordTF: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.isModalInPresentation = true
        title = "تطبيق الأنديه السعوديه "
        
        
    }
    
    //Mark :- IBActios
    
    @IBAction func forgetPasswordButton(_ sender: UIButton) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "ResetPasswordViewController1") as! ResetPasswordViewController1
        present(storyBoard, animated: true, completion: nil)
    }
    @IBAction func signInBut(_ sender: UIButton) {
        self.view.endEditing(true)
        if let phone = phoneNumberTF.text, let password = passwordTF.text {
            if phone.isEmpty && password.isEmpty{
                phoneNumberTF.shake()
                passwordTF.shake()
            }else if phone.isEmpty {
                phoneNumberTF.shake()
            }else if password.isEmpty {
                passwordTF.shake()
            }else{
                ///////////////////
                /////////////////////
                ///////////////////
                let url = saudiBaseUrl + "/user/login"
                let parameter = ["phone":phone, "password":password]
                DispatchQueue.main.async {
                    API.post(url, parameter: parameter, headers: nil) { (check, Response:LogInResponse?) in
                        if check{
                            
                            guard let response = Response else {return}
                            let statusCode = response
                            let MyID = response.data?.id
                            let ApiToken = response.data?.token
                            let isVerified = response.data?.isVerified
                            
                            UserDefaults.standard.set(MyID , forKey: "myId")
                            UserDefaults.standard.synchronize()
                            UserDefaults.standard.set(ApiToken , forKey: "ApiToken")
                            UserDefaults.standard.synchronize()
                            UserDefaults.standard.set(isVerified , forKey: "isVerified")
                            UserDefaults.standard.synchronize()
                            self.GoingToMainScreen()
                        }else{
                            
                        }
                    }
                }
            }
        }
    }
   
    @IBAction func signUpButtton(_ sender: UIButton) {
        let stroyBoard = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "SignUpViewController") as! SignUpViewController
        present(stroyBoard, animated: true, completion: nil)
    }
    @IBAction func logInAsVisitors(_ sender: UIButton) {
        GoingToMainScreen()
    }
    
    func GoingToMainScreen(){
        let storyBoard = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "TabBarController") as! TabBarController
        present(storyBoard, animated: true, completion: nil)
    }
    
    func PrintAlert(){
 
     }
}
