//
//  ViewControllerTask.swift
//  TaskApp
//
//  Created by Martin Vivanco on 23/5/19.
//  Copyright © 2019 Madeleine Gillard. All rights reserved.
//

import UIKit
import Firebase


class ViewControllerTask: UIViewController {

    let ref = Database.database().reference()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("loaded")
        getTasks()
        if Auth.auth().currentUser != nil {
            // User is signed in.
//            let user = Auth.auth().currentUser
//            let uid = user!.uid
//            let email = user!.email
        } else {
            // User is not signed in
        }

        // Do any additional setup after loading the view.
    }
    
    @IBAction func logoutClicked(_ sender: Any) {
        let firebaseAuth = Auth.auth()
        var error = false
        do {
            try firebaseAuth.signOut()
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
            error = true
        }
        if !error {
            dismiss(animated: true, completion: nil)
        }
        print("you have logged out")
    }
    @IBAction func changetoAdd(_ sender: Any) {
        print("change")
        performSegue( withIdentifier: "segueAdd", sender: self)
    }
    
    func getTasks(){
        let userID = Auth.auth().currentUser?.uid
        let getList = ref.child(userID!).description()
        print("the list..")
        print(getList)
    }
    @IBAction func changeToAdd(_ sender: Any) {
        print("change")
        performSegue( withIdentifier: "segueAdd", sender: self)
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
