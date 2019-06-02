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
        ref = Database.database().reference().child(uid!)
        if nameTask.text != "" {
            ref.childByAutoId().setValue([
                "name" : nameTask.text!,
                "date" : dueDate.countDownDuration,
                "subtasks" : [
                    sub1.text : false                ]
            ]);
            dismiss(animated: true, completion: nil)
        }
        else{
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
