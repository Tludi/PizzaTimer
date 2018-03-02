//
//  TimerViewController.swift
//  PizzaTimer
//
//  Created by Timothy Ludi on 3/1/18.
//  Copyright © 2018 Timothy Ludi. All rights reserved.
//

import UIKit

class TimerViewController: UIViewController {

    var singlePizza = Pizza()
    var customPizza = CustomPizza()
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var customLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("From the Timer view")
        print(singlePizza.name)
        print(customPizza.name)
        
        if singlePizza.id != "defaultID" {
            nameLabel.text = singlePizza.name
        } else {
            nameLabel.text = customPizza.name
        }
        
        customLabel.text = customPizza.name
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
