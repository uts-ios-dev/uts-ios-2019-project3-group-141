//
//  ViewController.swift
//  TaskApp
//
//  Created by Madeleine Gillard on 22/5/19.
//  Copyright © 2019 Madeleine Gillard. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        FirebaseApp.configure()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func changetoTask(_ sender: Any) {
        performSegue( withIdentifier: "segueTask", sender: self)
    }
    
}

