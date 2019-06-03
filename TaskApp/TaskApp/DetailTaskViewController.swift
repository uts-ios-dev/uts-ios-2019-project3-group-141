//
//  DetailTaskViewController.swift
//  TaskApp
//
//  Created by jean on 26/5/2562 BE.
//  Copyright © 2562 Madeleine Gillard. All rights reserved.
//

import UIKit
import Firebase

class DetailTaskViewController: UIViewController {
    
    var countFired: CGFloat = 0
    var identifier: String?
    var ref = Database.database().reference()
    var user: User?
    var uid: String?
    var email: String?
    var databaseHandle: DatabaseHandle?

    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var taskNameLabel: UILabel!
    @IBOutlet weak var taskProgress: ProgressView!
    @IBOutlet weak var firstTaskClicked: UIButton!
    @IBOutlet weak var secondTaskClicked: UIButton!
    @IBOutlet weak var thirdTaskClicked: UIButton!
    @IBOutlet weak var fourthTaskClicked: UIButton!
    @IBOutlet weak var firstLabel: UILabel!
    @IBOutlet weak var secondLabel: UILabel!
    @IBOutlet weak var thirdLabel: UILabel!
    @IBOutlet weak var fourthLabel: UILabel!
    
    
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

        firstLabel.isHidden = true
        firstTaskClicked.isHidden = true
        secondLabel.isHidden = true
        secondTaskClicked.isHidden = true
        thirdLabel.isHidden = true
        thirdTaskClicked.isHidden = true
        fourthLabel.isHidden = true
        fourthTaskClicked.isHidden = true

        ref.child(uid!).child(identifier!).observeSingleEvent(of: .value, with: { (snapshot) in
            print(snapshot)
            let value2 = snapshot.value as? NSDictionary
            let nameValue = value2?["name"] as? String ?? ""
            self.taskNameLabel.text = nameValue
            let dateValue = value2?["date"] as? String ?? ""
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd-mm-yyyy"
            dateFormatter.date(from: dateValue)
            let date = dateFormatter.date(from: dateValue)?.description
            self.dateLabel.text = dateValue
        })
        ref.child(uid!).child(identifier!).child("subtasks").observeSingleEvent(of: .value, with: { (snapshot) in
            let value3 = snapshot.value as? NSDictionary
            var subArray = value3?.allKeys
            var text1:String = ""
            var text2: String = ""
            var text3: String = ""
            var text4: String = ""
            print("subtasks are:\(subArray)")
            if subArray![0] != nil || subArray![0] as! String != "n1"{
                 text1 = subArray![0] as! String
                if !text1.isEmpty{
                    self.firstLabel.text = text1
                    self.firstLabel.isHidden = false
                    self.firstTaskClicked.isHidden = false
                }
            }
            if subArray![1] != nil || subArray![1] as! String != "n1"{
                text2 = subArray![1] as! String
                if !text2.isEmpty{
                    self.secondLabel.text = text2
                    self.secondLabel.isHidden = false
                    self.secondTaskClicked.isHidden = false
                }
            }
            if subArray![2] != nil || subArray![2] as! String != "n2"{
                text3 = subArray![2] as! String
                if !text3.isEmpty{
                    self.thirdLabel.text = text3
                    self.thirdLabel.isHidden = false
                    self.thirdTaskClicked.isHidden = false
                }
            }
            if subArray![3] != nil || subArray![3] as! String != "n3"{
                text4 = subArray![3] as! String
                if !text4.isEmpty{
                    self.fourthLabel.text = text4
                    self.fourthLabel.isHidden = false
                    self.fourthTaskClicked.isHidden = false
                }
            }
        })
        
        // Do any additional setup after loading the view.
        print("identifier is: \(identifier!)")
        databaseHandle = ref.child(uid!).child(identifier!).observe(.childAdded, with: {(snapshot) in
            print(snapshot)
            _ = snapshot.value as? NSDictionary
//            print("access value name:")
//            print(value)
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
    
    
    @IBAction func funcBack(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}

  

