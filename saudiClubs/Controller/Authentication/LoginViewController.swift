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
    
    var message:String?
    
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
                    API.post(url, parameter: parameter, headers: nil) { (check, Response:LogInResponse?,HttpStatusCode) in

                            guard let response = Response else {return}
                            let MyID = response.data?.id
                            let ApiToken = response.data?.token
                            let isVerified = response.data?.isVerified
                            let Mymessage = response.message
                            let errorMessage = response.errors?.password
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
                            case 200: self.GoingToMainScreen()
                            self.PrintAlert()
                            case 444: self.message = "هذاالكودغير صالح أو منهي الصلاحية"
                            self.PrintAlert()
                            case 401: self.message = Mymessage
                            self.PrintAlert()
                            self.PrintAlert()
                            case 422,404:
                                self.message = errorMessage?[1]
                            self.PrintAlert()
                            case 500: self.message = "لا نسطيع الاتصال بال خادم"
                            self.PrintAlert()
                            default:
                                print("============>Status Code Not Identified")
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
        let alert = UIAlertController(title: "تحذير", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
}
