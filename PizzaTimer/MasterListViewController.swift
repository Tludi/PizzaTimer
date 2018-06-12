//
//  MasterListViewController.swift
//  PizzaTimer
//
//  Created by Timothy Ludi on 3/1/18.
//  Copyright © 2018 Timothy Ludi. All rights reserved.
//

import UIKit
import RealmSwift

class MasterListController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    let realm = try! Realm()
    let masterList = try! Realm().objects(Pizza.self)
    
    
    @IBOutlet weak var masterListTable: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("Master Pizza List")
        for pizza in masterList {
            print(pizza.name)
        }
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return masterList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = masterListTable.dequeueReusableCell(withIdentifier: "pizzaCell", for: indexPath)
        let pizza = masterList[indexPath.row]
        
        cell.textLabel?.text = pizza.name
        cell.detailTextLabel?.text = "\(pizza.brand) - \(pizza.temperature)"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let pizza = masterList[indexPath.row]
        print(pizza)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toPizzaTimer" {
            if let destinationController = segue.destination as? TimerViewController {
                if let tableIndex = masterListTable.indexPathForSelectedRow {
                    let pizza = masterList[tableIndex.row]
                    destinationController.singlePizza = pizza
                }
            }
        }
    }
    
}
