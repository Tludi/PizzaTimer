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
    let name: String
    let brand: String
    let temperature: String
    let cookingTime: String
}

class Pizza: Object, Decodable {
    @objc dynamic var id: String = "defaultID"
    @objc dynamic var name: String = " "
    @objc dynamic var brand: String = " "
    @objc dynamic var temperature: String = "400"
    @objc dynamic var cookingTime: String = "12"
    
    override static func primaryKey() -> String? {
        return "id"
    }
}

struct CustomPizzaStruct: Decodable {
    let id: String
    let name: String
    let brand: String
    let temperature: String
    let cookingTime: String
}

class CustomPizza: Object, Decodable {
    @objc dynamic var id: String = "defaultID"
    @objc dynamic var name: String = "Custom Pizza"
    @objc dynamic var brand: String = " "
    @objc dynamic var temperature: String = "400"
    @objc dynamic var cookingTime: String = "12"
    
    override static func primaryKey() -> String? {
        return "id"
    }
}

class Pizzas {
    var id = UUID().uuidString
    var name = "base pizza"
    var brand = "Oatmeal Labs"
    var temperature = "555"
    var cookingTime = "5"
    
    init(id: String?, name: String?, brand: String?, temperature: String?, cookingTime: String?)
    {
        self.id = id ?? UUID().uuidString
        self.name = name ?? ""
        self.brand = brand ?? ""
        self.temperature = temperature ?? ""
        self.cookingTime = cookingTime ?? ""
    }
}
