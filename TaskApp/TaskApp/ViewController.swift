//
//  ViewController.swift
//  TaskApp
//
//  Created by Madeleine Gillard on 22/5/19.
//  Copyright © 2019 Madeleine Gillard. All rights reserved.
//

import UIKit
import Firebase
//import FirebaseUI


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBOutlet weak var usernameTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    
    @IBAction func changetoTask(_ sender: Any) {
//        signup()
        login()
        
//         performSegue( withIdentifier: "segueTask", sender: self)
    }
    
    func login(){
        var errorBool = false
        if self.usernameTF.text == "" || self.passwordTF.text == "" {
            print("empty box")
            let alert = UIAlertController(title: "Error", message: "Please enter an email and password", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .cancel, handler: { _ in
                NSLog("The \"no email or password\" alert occured.")
            }))
            self.present(alert, animated: true, completion: nil)
            
        } else {
            Auth.auth().signIn(withEmail: self.usernameTF.text!, password: self.passwordTF.text!) { (user, error) in
                if error == nil {
                    //Print into the console if successfully logged in
                    print("You have successfully logged in")
                    
//                    //Go to the HomeViewController if the login is sucessful
//                    let vc = self.storyboard?.instantiateViewController(withIdentifier: "Home")
//                    self.present(vc!, animated: true, completion: nil)
                    
                } else {
                    errorBool = true
                    print("error with login")
                    print(error?.localizedDescription)
                }
            }
        }
        if errorBool {
            let errAlert = UIAlertController(title: "Login Error", message: "Incorrect Creds", preferredStyle: .alert)
            errAlert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(errAlert, animated: true, completion: nil)
            errAlert.show(self, sender: self)
        }
    }
    
    func signup(){
        if usernameTF.text == "" {
            print("username is empty")
            let alertController = UIAlertController(title: "Error", message: "Please enter your email and password", preferredStyle: .alert)
            
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            
            present(alertController, animated: true, completion: nil)
            
        } else {
            Auth.auth().createUser(withEmail: usernameTF.text!, password: passwordTF.text!) { (user, error) in
                
                if error == nil {
                    print("You have successfully signed up")
                    
                } else {
                    print("error in signing up")
                    print(error!)
                    let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                    
                    let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    alertController.addAction(defaultAction)
                    
                    self.present(alertController, animated: true, completion: nil)
                }
            }
        }
        
    }
}
