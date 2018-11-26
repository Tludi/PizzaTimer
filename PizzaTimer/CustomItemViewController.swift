//
//  CustomItemViewController.swift
//  PizzaTimer
//
//  Created by Timothy Ludi on 3/2/18.
//  Copyright © 2018 Timothy Ludi. All rights reserved.
//

import UIKit
import RealmSwift

class CustomItemViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    let realm = try! Realm()
    
    let tempRange = Array(350...450)
    let timeRange = Array(5...35)
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 {
            return tempRange.count
        }
        return timeRange.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0 {
            return String(tempRange[row]) + "\u{00B0}"
        }
        return String(timeRange[row]) + " min"
    }
    
    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var brandField: UITextField!
    
    @IBOutlet weak var tempTimePicker: UIPickerView!
    
    @IBAction func addCustomPizzaButton(_ sender: UIButton) {
        saveNewCustomPizza()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let customPizzaList = realm.objects(CustomPizza.self)
        tempTimePicker.selectRow(tempRange.count/2, inComponent: 0, animated: true)
        tempTimePicker.selectRow(timeRange.count/2, inComponent: 1, animated: true)
        
        print("\(customPizzaList.count) custom pizzas in DB")
        
        // Do any additional setup after loading the view.
    }
    
    
    
    func saveNewCustomPizza() {
        
        let selectedName = nameField.text
        let selectedBrand = brandField.text
        let selectedTemp = tempTimePicker.selectedRow(inComponent: 0)
        let selectedTime = tempTimePicker.selectedRow(inComponent: 1)
        print(tempRange[selectedTemp])
        print(timeRange[selectedTime])
        print(selectedName ?? "no name")
        print(selectedBrand ?? "no brand")
        
        let newCustomPizza = CustomPizza()
        
        try! realm.write {
            newCustomPizza.id = UUID().uuidString
            newCustomPizza.name = selectedName!
            newCustomPizza.brand = selectedBrand!
            newCustomPizza.temperature = String(tempRange[selectedTemp])
            newCustomPizza.lowCookingTime = String(timeRange[selectedTime])
            realm.add(newCustomPizza)
        }
        print(newCustomPizza)
    }
    
}
