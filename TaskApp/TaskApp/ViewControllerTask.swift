//
//  ViewControllerTask.swift
//  TaskApp
//
//  Created by Martin Vivanco on 23/5/19.
//  Copyright © 2019 Madeleine Gillard. All rights reserved.
//

import UIKit
import Foundation
import Firebase


class ViewControllerTask : UIViewController, UITableViewDelegate, UITableViewDataSource {
    var ref = Database.database().reference()
    var user: User?
    var uid: String?
    var email: String?
    var databaseHandle: DatabaseHandle?
    var postData = [String]()
    var identifiers = [String]()
    @IBOutlet weak var table: UITableView!
    
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
        self.table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        self.table.dataSource=self
        self.table.delegate=self
        // Do any additional setup after loading the view.
        databaseHandle = ref.child(uid!).observe(.childAdded, with: {(snapshot) in
            //print(snapshot)
            let value = snapshot.value as? NSDictionary
            self.postData.append(value?["name"] as! String)
            self.identifiers.append(snapshot.key)
            print(self.postData)
            self.table.reloadData()
        })
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postData.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Create an object of the dynamic cell "PlainCell"
        let cell = self.table.dequeueReusableCell(withIdentifier: "cell")! as UITableViewCell
        cell.textLabel!.text = postData[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(identifiers[indexPath[1]])
        /*perform segue here sending identifiers in index path[1]*/
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
