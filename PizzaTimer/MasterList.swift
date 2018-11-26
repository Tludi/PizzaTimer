//
//  File.swift
//  PizzaTimer
//
//  Created by Timothy Ludi on 3/1/18.
//  Copyright © 2018 Timothy Ludi. All rights reserved.
//

import Foundation
import RealmSwift

struct PizzaStruct: Decodable {
    let id: String
    let brand: String
    let name: String
    let style: String
    let pizzaSize: String
    let temperature: String
    let lowCookingTime: String
    let highCookingTime: String
    let ovenRack: String
    let servings: String
    let caloriePerServing: String
    let calorieFromFat: String
}

class Pizza: Object, Decodable {
    @objc dynamic var id: String = "defaultID"
    @objc dynamic var brand: String = " "
    @objc dynamic var name: String = " "
    @objc dynamic var style: String = " "
    @objc dynamic var pizzaSize: String = " "
    @objc dynamic var temperature: String = "400"
    @objc dynamic var lowCookingTime: String = "12"
    @objc dynamic var highCookingTime: String = "12"
    @objc dynamic var ovenRack: String = " "
    @objc dynamic var servings: String = "5"
    @objc dynamic var caloriePerServing: String = " "
    @objc dynamic var calorieFromFat: String = " "
    
    override static func primaryKey() -> String? {
        return "id"
    }
}

struct CustomPizzaStruct: Decodable {
    let id: String
    let brand: String
    let name: String
    let style: String
    let pizzaSize: String
    let temperature: String
    let lowCookingTime: String
    let highCookingTime: String
    let ovenRack: String
    let servings: String
    let caloriePerServing: String
    let calorieFromFat: String
}

class CustomPizza: Object, Decodable {
    @objc dynamic var id: String = "defaultID"
    @objc dynamic var brand: String = " "
    @objc dynamic var name: String = " "
    @objc dynamic var style: String = " "
    @objc dynamic var pizzaSize: String = " "
    @objc dynamic var temperature: String = "400"
    @objc dynamic var lowCookingTime: String = "12"
    @objc dynamic var highCookingTime: String = "12"
    @objc dynamic var ovenRack: String = " "
    @objc dynamic var servings: String = "5"
    @objc dynamic var caloriePerServing: String = " "
    @objc dynamic var calorieFromFat: String = " "
    
    override static func primaryKey() -> String? {
        return "id"
    }
}

class Pizzas {
    var id = UUID().uuidString
    var brand = "Oatmeal Labs"
    var name = "base pizza"
    var style = "Oatmeal Labs"
    var pizzaSize: String = "classic"
    var temperature = "555"
    var lowCookingTime = "5"
    var highCookingTime = "5"
    var ovenRack: String = "center"
    var servings: String = "5"
    var caloriePerServing: String = "350 "
    var calorieFromFat: String = "100"
    
    init(id: String?, brand: String?, name: String?, style: String?, pizzaSize: String?, temperature: String?, lowCookingTime: String?, highCookingTime: String?, ovenRack: String?, servings: String?, caloriePerServing: String?, calorieFromFat: String?)
    {
        self.id = id ?? UUID().uuidString
        self.brand = brand ?? ""
        self.name = name ?? ""
        self.style = style ?? ""
        self.pizzaSize = pizzaSize ?? ""
        self.temperature = temperature ?? ""
        self.lowCookingTime = lowCookingTime ?? ""
        self.highCookingTime = highCookingTime ?? ""
        self.ovenRack = ovenRack ?? ""
        self.servings = servings ?? ""
        self.caloriePerServing = caloriePerServing ?? ""
        self.calorieFromFat = calorieFromFat ?? ""
    }
}
