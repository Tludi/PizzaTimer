//
//  DataManager.swift
//  PizzaTimer
//
//  Created by Timothy Ludi on 3/1/18.
//  Copyright © 2018 Timothy Ludi. All rights reserved.
//

import Foundation
import RealmSwift

class DataManager {
    // get data from json file
    class func getDataFromFileWithSuccess() {
        
        let jsonPath = Bundle.main.path(forResource: "papamurphytest", ofType: "json")
        let url = URL(fileURLWithPath: jsonPath!)
        let data = try! Data.init(contentsOf: url)
        let pizzaJSONList = try! JSONDecoder().decode([PizzaStruct].self, from: data)
        print(pizzaJSONList.count)
        
        let firstPizzaInList = pizzaJSONList[0]
        
        let realm = try! Realm()
        
        for pizza in pizzaJSONList {
            print(pizza.name)
            let newPizza = Pizza()
            try! realm.write {
                newPizza.id = pizza.id
                newPizza.name = pizza.name
                newPizza.brand = pizza.brand
                newPizza.lowCookingTime = pizza.lowCookingTime
                newPizza.highCookingTime = pizza.highCookingTime
                newPizza.temperature = pizza.temperature
                realm.add(newPizza)
            }
        }
        
        //    URLSession.shared.dataTask(with: url) { (data, response, err) in
        //      guard let data = data else {return}
        //    }.resume()
        
        func decodeJson(data: Data) {
            //      var pizzaJSONList: [String:String]
            //      let realm = try! Realm()
            
            
            
            //        do {
            //      let pizzaJSONList = try! JSONSerialization.jsonObject(with: data, options: [])
            //        let pizzaJSONList = try! JSONDecoder().decode([PizzaStruct].self, from: data)
            
            //          for pizza in pizzaJSONList {
            //            print(pizza.name)
            //          }
            //          try! realm.write {
            //            for pizza in pizzaJSONList {
            //              let newPizza = Pizza(value: pizza)
            //              print(newPizza)
            ////              realm.create(Pizza.self, value: , update: true)
            //            }
            //          }
            
            //          return pizzaJSONList
            //        } catch let jsonErr {
            //          print("Error serializing JSON:", jsonErr)
            //        return pizzaJSONList
            //        }
        } // end decodeJson
        
        //    return data
        //    return decodeJson(data: data)
    }
    
    class func populateRealm() {
        let items = try! Realm().objects(Pizza.self)
        print("\(items.count) items in database")
        
        self.getDataFromFileWithSuccess()
        //    print("\(dataToPopulate.count) items to populate")
    }
    
    
}
