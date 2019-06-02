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
    var ref = Database.database().reference()
    var user: User?
    var uid: String?
    var email: String?
    var databaseHandle: DatabaseHandle?
    var postData = [String]()
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if Auth.auth().currentUser != nil {
            // User is signed in.
            user = Auth.auth().currentUser!
            uid = user!.uid
            email = user!.email!
            // ...
        } else {
            dismiss(animated: true, completion: nil)
        }
        // Do any additional setup after loading the view.
        databaseHandle = ref.child(uid!).observe(.childAdded, with: {(snapshot) in
            print(snapshot.value)
            //self.postData.append(snapshot.children)
        })
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
