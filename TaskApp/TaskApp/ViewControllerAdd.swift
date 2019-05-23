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

    override func viewDidLoad() {
        super.viewDidLoad()
        let ref = Database.database().reference()
        ref.childByAutoId().setValue("Mike")

        // Do any additional setup after loading the view.
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
