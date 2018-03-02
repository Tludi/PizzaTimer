//
//  ViewController.swift
//  PizzaTimer
//
//  Created by Timothy Ludi on 3/1/18.
//  Copyright © 2018 Timothy Ludi. All rights reserved.
//

import UIKit
import RealmSwift



class ViewController: UIViewController {

    let realm = try! Realm()
    @IBAction func CleanDBButton(_ sender: UIButton) {
        try! realm.write {
            realm.deleteAll()
        }

    }
    
    @IBAction func MasterListButton(_ sender: Any) {
        print("pushed master list button")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let realm = try! Realm()
        let pizzas = realm.objects(Pizza.self)
        if pizzas.count == 0 {
            DataManager.populateRealm()
        } else {
            print("\(pizzas.count) pizzas in the database")
        }
    }


}

