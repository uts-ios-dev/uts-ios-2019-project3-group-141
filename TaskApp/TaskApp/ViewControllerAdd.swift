//
//  ViewControllerAdd.swift
//  TaskApp
//
//  Created by Martin Vivanco on 23/5/19.
//  Copyright © 2019 Madeleine Gillard. All rights reserved.
//

import UIKit
import Firebase

class ViewControllerAdd: UIViewController {
    var ref = Database.database().reference()
    var user: User?
    var uid: String?
    var email: String?
    @IBOutlet weak var sub1: UITextField!
    
    @IBOutlet weak var sub4: UITextField!
    @IBOutlet weak var sub3: UITextField!
    @IBOutlet weak var sub2: UITextField!
    @IBOutlet weak var dueDate: UIDatePicker!
    @IBOutlet weak var nameTask: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        if Auth.auth().currentUser != nil {
            // User is signed in.
            user = Auth.auth().currentUser!
            uid = user!.uid
            email = user!.email!
            // ...
        } else {
            // User is not signed in
            //kick them out.
            dismiss(animated: true, completion: nil)
        }
    }
    @IBAction func submitData(_ sender: Any) {

        print(uid!)
        let dateFormat = "\(dueDate.date)"
        ref = Database.database().reference().child(uid!)
        if nameTask.text != "" && sub1.text != ""{
            if sub2.text == "" {
                sub2.text = "n1"
            }
            if sub3.text == "" {
                sub3.text = "n2"
            }
            if sub4.text == "" {
                sub4.text = "n3"
            }
            ref.childByAutoId().setValue([
                "name" : nameTask.text!,
                "date" : dateFormat,
                "subtasks" : [
                    sub1.text : false,
                    sub2.text : false,
                    sub3.text : false,
                    sub4.text : false
                ]
            ]);
            dismiss(animated: true, completion: nil)
        }
        else {
            nameTask.backgroundColor = UIColor.red
        }
    }
    
    @IBAction func funcBack(_ sender: Any) {
        dismiss(animated: true, completion: nil)
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
