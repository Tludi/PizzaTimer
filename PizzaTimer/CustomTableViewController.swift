//
//  CustomTableViewController.swift
//  PizzaTimer
//
//  Created by Timothy Ludi on 3/2/18.
//  Copyright © 2018 Timothy Ludi. All rights reserved.
//

import UIKit
import RealmSwift

class CustomTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    let realm = try! Realm()
    let customList = try! Realm().objects(CustomPizza.self)
    
    
    @IBOutlet weak var customPizzaTable: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        self.customPizzaTable.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if customList.count > 0 {
            return customList.count
        } else {
            return 2
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = customPizzaTable.dequeueReusableCell(withIdentifier: "customPizzaCell", for: indexPath)
        
        if customList.count > 0 {
            let pizza = customList[indexPath.row]
            cell.textLabel?.text = pizza.name
            cell.detailTextLabel?.text = pizza.brand
        } else {
            cell.textLabel?.text = "Oatmeal"
            cell.detailTextLabel?.text = "Labs"
        }
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toPizzaTimerFromCustom" {
            if let destinationController = segue.destination as? TimerViewController {
                if let tableIndex = customPizzaTable.indexPathForSelectedRow {
                    let customPizza = customList[tableIndex.row]
                    destinationController.customPizza = customPizza
                }
            }
        }
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]?
    {
        let deleteCellAction = UITableViewRowAction(style: .normal, title: "Delete")
        { action, index in
            print("Delete Action")
            let deleteAlert = UIAlertController(title: "Confirm Delete", message: "Selected Item Will Be Deleted!", preferredStyle: .alert)
            deleteAlert.addAction(UIAlertAction(title: "Remove", style: .default, handler: {(action:UIAlertAction) in
                
                let selectedCell = self.customList[indexPath.row]
                try! self.realm.write {
                    self.realm.delete(selectedCell)
                }
                if self.customList.count > 0 {
                    tableView.deleteRows(at: [indexPath], with: .fade)
                } else {
                    self.customPizzaTable.reloadData()
                }
            }))
            deleteAlert.addAction(UIAlertAction(title: "Cancel", style: .default, handler: {(action:UIAlertAction) in
                return
            }))
            self.present(deleteAlert, animated: true, completion: nil)
        }
        
        
        let editCellAction = UITableViewRowAction(style: .normal, title: "Edit")
        { action, index in
            print("Edit Action")
            let selectedCell = self.customList[indexPath.row]
            print(selectedCell.name)
        }
        return [deleteCellAction, editCellAction]
    }
    
}
