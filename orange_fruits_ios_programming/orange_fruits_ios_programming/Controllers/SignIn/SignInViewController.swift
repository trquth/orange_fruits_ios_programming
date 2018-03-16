//
//  SignInViewController.swift
//  orange_fruits_ios_programming
//
//  Created by Thien Tran on 3/14/18.
//  Copyright © 2018 Thien Tran. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signInButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(signInTap))
        self.signInButton.addGestureRecognizer(tapGesture)
    }

    //Prive methods
    
   @objc private func signInTap(){
        if let email = emailTextField.text, let password = passwordTextField.text {
            
        }
    }
}
