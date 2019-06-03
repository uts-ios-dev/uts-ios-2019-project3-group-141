//
//  DetailTaskViewController.swift
//  TaskApp
//
//  Created by jean on 26/5/2562 BE.
//  Copyright © 2562 Madeleine Gillard. All rights reserved.
//

import UIKit
<<<<<<< HEAD
import Firebase

class DetailTaskViewController: UIViewController {
    
    var countFired: CGFloat = 0
    var identifier: String?
    var ref = Database.database().reference()
    var user: User?
    var uid: String?
    var email: String?
    var databaseHandle: DatabaseHandle?
=======
import os.log
class DetailTaskViewController: UIViewController {
    
     var countFired: CGFloat = 0
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var dueDateLabel: UILabel!
>>>>>>> b0caa73cfcfc77f3f6b9693092eac1c2183c0c18
    
    @IBOutlet weak var taskProgress: ProgressView!
    
    @IBOutlet weak var firstTaskClicked: UIButton!
    
    
    @IBOutlet weak var secondTaskClicked: UIButton!
    
    
    @IBOutlet weak var thirdTaskClicked: UIButton!
    
    
    @IBOutlet weak var fourthTaskClicked: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
<<<<<<< HEAD
        if Auth.auth().currentUser != nil {
            // User is signed in.
            user = Auth.auth().currentUser!
            uid = user!.uid
            email = user!.email!
            // ...
        } else {
            dismiss(animated: true, completion: nil)
        }
=======
       // nameLabel.text = postData
>>>>>>> b0caa73cfcfc77f3f6b9693092eac1c2183c0c18
        // Do any additional setup after loading the view.
        print(identifier!)
        databaseHandle = ref.child(uid!).child(identifier!).observe(.childAdded, with: {(snapshot) in
            print(snapshot)
            let value = snapshot.value as? NSDictionary
            print(value)
        })
    }
    
    @IBAction func firstSubtask(_ sender: UIButton) {
        Timer.scheduledTimer(withTimeInterval: 0.08, repeats: true){ (timer) in
            self.countFired += 1
            
            DispatchQueue.main.async {
                
                self.taskProgress.progress = min(0.01 * self.countFired, 0.25)
                
                if self.taskProgress.progress == 0.25 {
                    
                    timer.invalidate()
                }
                
            }
        }
        firstTaskClicked.isEnabled = false
    }
    

    @IBAction func secondSubtask(_ sender: UIButton) {
        Timer.scheduledTimer(withTimeInterval: 0.08, repeats: true){ (timer) in
            
            self.countFired += 1
            
            DispatchQueue.main.async {
                
                self.taskProgress.progress = min(0.01 * self.countFired, 0.50)
                
                if self.taskProgress.progress == 0.50 {
                    
                    timer.invalidate()
                }
                
            }
        }
        secondTaskClicked.isEnabled = false
    }
    
    
    @IBAction func thirdSubtask(_ sender: UIButton) {
        Timer.scheduledTimer(withTimeInterval: 0.08, repeats: true){ (timer) in
            
            self.countFired += 1
            
            DispatchQueue.main.async {
                
                self.taskProgress.progress = min(0.01 * self.countFired, 0.75)
                
                if self.taskProgress.progress == 0.75 {
                    
                    timer.invalidate()
                }
                
            }
        }
        thirdTaskClicked.isEnabled = false
    }
    
    @IBAction func fourthSubtask(_ sender: UIButton) {
        Timer.scheduledTimer(withTimeInterval: 0.08, repeats: true){ (timer) in
            
            self.countFired += 1
            
            DispatchQueue.main.async {
                
                self.taskProgress.progress = min(0.01 * self.countFired, 1)
                
                if self.taskProgress.progress == 1{
                    
                    timer.invalidate()
                }
                
            }
        }
        
        fourthTaskClicked.isEnabled = false
    }
   
   
    
    @IBAction func saveButton(_ sender: Any) {
    }
    
    
    @IBAction func doneButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    
<<<<<<< HEAD
    @IBAction func funcBack(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
=======
>>>>>>> b0caa73cfcfc77f3f6b9693092eac1c2183c0c18
}

  

