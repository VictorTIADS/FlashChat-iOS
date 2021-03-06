//
//  MessageCell.swift
//  Flash Chat iOS13
//
//  Created by Victor Batista on 27/02/21.
//  Copyright © 2021 Angela Yu. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    

    @IBAction func loginPressed(_ sender: UIButton) {
        logIn()
    }
    
    func logIn(){
        if let email = emailTextfield.text, let password = passwordTextfield.text {
            Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
                if let e = error {
                    self.showError(error: e)
                } else {
                    self.navigateToChat()
                }
            }
        }
    }
    
    func showError(error: Error){
        print(error.localizedDescription)
    }
    
    func navigateToChat(){
        performSegue(withIdentifier: K.loginSegue, sender: self)
    }
    
}
