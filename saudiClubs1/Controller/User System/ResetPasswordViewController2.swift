//
//  ResetPasswordViewController2.swift
//  saudiClubs1
//
//  Created by Mohamed Samir on 11/26/19.
//  Copyright © 2019 Mohamed Samir. All rights reserved.
//

import UIKit

class ResetPasswordViewController2: UIViewController {

    @IBOutlet var codeTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        codeTF.underlined()
    }
    

    
    // MARK: - IBActions
 
    @IBAction func completeBut(_ sender: UIButton) {
        if let code = codeTF.text {
            if code.isEmpty {
                codeTF.shake()
            }else{
                let storyBoard = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "ResetPasswordViewController3") as! ResetPasswordViewController3
                present(storyBoard, animated: true, completion: nil)
            }
        }
    }
    @IBAction func signUpBut(_ sender: UIButton) {
        presentingViewController?.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func loginAsVisitor(_ sender: UIButton) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "TabBarController") as! TabBarController
               present(storyBoard, animated: true, completion: nil)
    }
}
