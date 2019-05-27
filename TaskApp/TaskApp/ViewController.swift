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
        if self.usernameTF.text == "" || self.passwordTF.text == "" {
            
            //Alert to tell the user that there was an error because they didn't fill anything in the textfields because they didn't fill anything in
            print("empty box")
//            let alertController = UIAlertController(title: "Error", message: "Please enter an email and password.", preferredStyle: .alert)
//            
//            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
//            alertController.addAction(defaultAction)
//            
//            self.present(alertController, animated: true, completion: nil)
            
        } else {
            
            Auth.auth().signIn(withEmail: self.usernameTF.text!, password: self.passwordTF.text!) { (user, error) in
                
                if error == nil {
                    
                    //Print into the console if successfully logged in
                    print("You have successfully logged in")
                    
//                    //Go to the HomeViewController if the login is sucessful
//                    let vc = self.storyboard?.instantiateViewController(withIdentifier: "Home")
//                    self.present(vc!, animated: true, completion: nil)
                    
                } else {
                    print("error wit login")
                    print(error)
                    //Tells the user that there is an error and then gets firebase to tell them the error
//                    let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
//                    
//                    let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
//                    alertController.addAction(defaultAction)
//                    
//                    self.present(alertController, animated: true, completion: nil)
                }
            }
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
