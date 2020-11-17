//
//  ViewController.swift
//  LoginApp
//
//  Created by Ashisish on 11/6/20.
//

import UIKit
import Firebase
import SwiftSpinner
class ViewController: UIViewController {
    
    @IBOutlet weak var txtEmail: UITextField!
    
    @IBOutlet weak var txtPassword: UITextField!
    
    @IBOutlet weak var lblStatus: UILabel!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    @IBAction func loginAction(_ sender: Any) {
        
        let email = txtEmail.text
        let password = txtPassword.text
        
        if email == "" || password!.count < 6 {
            lblStatus.text = "Please enter email and correct password"
            return
        }
        if email?.isEmail == false {
            lblStatus.text = "Please enter valid e mail"
            return
        }
        
//        SwiftSpinner.show("Logging in...")
        Auth.auth().signIn(withEmail: email!, password: password!) { [weak self] authResult, error in
            SwiftSpinner.hide()
            guard let strongSelf = self else { return }
            
            if error != nil {
                strongSelf.lblStatus.text = error?.localizedDescription
                return
            }
            
            self?.txtPassword.text = ""
            
            // I have successfully logged in  go to Dashboard
            self!.performSegue(withIdentifier: "loginSegue", sender: strongSelf)
            
        }

}


    @IBAction func signup(_ sender: Any) {
                let email = txtEmail.text
                let password = txtPassword.text
                
                if email == "" || password!.count < 6 {
                    lblStatus.text = "Please enter email and correct password"
                    return
                }
                if email?.isEmail == false {
                    lblStatus.text = "Please enter valid e mail"
                    return
                }
                
                Auth.auth().createUser(withEmail: email!, password: password!) { [weak self] authResult, error in
                    guard let strongSelf = self else { return }
                    
                    if error != nil {
                        strongSelf.lblStatus.text = error?.localizedDescription
                        return
                    }
                    
                    self?.txtPassword.text = ""
                    self!.performSegue(withIdentifier: "signupSegue", sender: strongSelf)
                    
        }
    
}
    
    @IBAction func reset(_ sender: Any) {
        let email = txtEmail.text
                
                if email == "" {
                    lblStatus.text = "Please enter email and correct password"
                    return
                }
                if email?.isEmail == false {
                    lblStatus.text = "Please enter valid e mail"
                    return
                }
                
                Auth.auth().sendPasswordReset(withEmail: email!) { error in
        //            guard let strongSelf = self else { return }
                    
                    if error != nil {
                        self.lblStatus.text = error?.localizedDescription
                        return
                    } else {
                        self.lblStatus.text = "Success"
                    }
                }
                    
        }
}
