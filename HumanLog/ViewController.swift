//
//  ViewController.swift
//  HumanLog
//
//  Created by Tonoy Rahman on 2020-09-24.
//

import UIKit
import Firebase
import FirebaseAuth


class ViewController: UIViewController {
    
    
    @IBOutlet var email: UITextField!
    @IBOutlet var password: UITextField!
    @IBOutlet var signIn: UIButton!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        signIn.isEnabled = false
        email.addTarget(self, action: #selector(ViewController.textFieldDidChange(_:)), for: .editingChanged)
        password.addTarget(self, action: #selector(ViewController.textFieldDidChange(_:)), for: .editingChanged)
        
        // Do any additional setup after loading the view.
    }


    @objc func textFieldDidChange(_ textField: UITextField) {
        
        if email.text == "" || password.text == "" {
            
            signIn.isEnabled = false
        } else {
            
            signIn.isEnabled = true
        }
    }
    
    
    @IBAction func singin(_ sender: Any) {
        
        Auth.auth().signIn(withEmail: email.text!, password: password.text!) { (authResult, error) in
            if (error == nil) {
                
                // sign in -> perform segue to home page
                self.performSegue(withIdentifier: "signin", sender: self)
            } else {
                
                let alert = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
        }
    }
}

