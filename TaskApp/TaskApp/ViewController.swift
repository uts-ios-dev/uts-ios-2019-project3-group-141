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
    var allowlogin:Bool

    required init?(coder aDecoder: NSCoder) {
        self.allowlogin = false
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        }
         //1
        Auth.auth().addStateDidChangeListener() { auth, user in
            // 2
            if user != nil {
                print("LOG: authenticated ")
                // 3
                self.allowlogin = true
                self.usernameTF.text = ""
                self.passwordTF.text = ""
                self.performSegue(withIdentifier: "wholeScene", sender: nil)
            }
            else {
                self.allowlogin = false
            }
        }
    }
    
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var usernameTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    
    @IBAction func loginClicked(_ sender: UIButton) {
        login()
    }
    
    @IBAction func signupClicked(_ sender: UIButton) {
        signup()
    }
    
    func login(){
        if self.usernameTF.text == "" || self.passwordTF.text == "" {
            print("LOG: empty box")
            let alertController = UIAlertController(title: "Error", message: "Please enter your email and password", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            present(alertController, animated: true, completion: nil)
        } else {
            print("LOG: running the signin else part 1")
            //this is running too long.
            Auth.auth().signIn(withEmail: self.usernameTF.text!, password: self.passwordTF.text!) { (user, error) in
                if error == nil {
                    print("LOG:You have successfully logged in")
                } else {
                    print("LOG: error with login")
                    print(error!.localizedDescription)
                }
            }
        }
    }
    
    func signup(){
        if usernameTF.text == "" || passwordTF.text == "" {
            print("username is empty")
            let alertController = UIAlertController(title: "Error", message: "Please enter your email and password", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            present(alertController, animated: true, completion: nil)
        } else {
            Auth.auth().createUser(withEmail: usernameTF.text!, password: passwordTF.text!) { (user, error) in
                
                if error == nil {
                    print("You have successfully signed up")
                    Auth.auth().signIn(withEmail: self.usernameTF.text!, password: self.passwordTF.text!)
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
