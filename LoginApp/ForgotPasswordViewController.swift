//
//  ForgotPasswordViewController.swift
//  LoginApp
//
//  Created by Maxim on 11/16/20.
//

    import UIKit
    import Firebase


    class ForgotPasswordViewController: UIViewController {
        
        @IBOutlet weak var txtEmail: UITextField!
        @IBOutlet weak var lblStatus: UILabel!
        
        override func viewDidLoad() {
            super.viewDidLoad()
        }
        
        @IBAction func resetPw(_ sender: Any) {
            let email = txtEmail.text
            
            if email == "" {
                lblStatus.text = "Please enter email and valid password"
                return
            }
            
            if email?.isEmail == false {
                lblStatus.text = "Please enter valid email"
                return
            }
            
            Auth.auth().sendPasswordReset(withEmail: email!) { error in
                if error != nil {
                    self.lblStatus.text = error?.localizedDescription
                    return
                } else {
                    self.lblStatus.text = "Reset Email Sent Successfully"
                }
            }
        }
        
    }
