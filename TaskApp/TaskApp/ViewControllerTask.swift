//
//  ViewControllerTask.swift
//  TaskApp
//
//  Created by Martin Vivanco on 23/5/19.
//  Copyright © 2019 Madeleine Gillard. All rights reserved.
//

import UIKit

class ViewControllerTask: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func changetoAdd(_ sender: Any) {
        print("change")
        performSegue( withIdentifier: "segueAdd", sender: self)
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
