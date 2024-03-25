//
//  Heal.swift
//  AFL2
//
//  Created by RabiRabi Channel on 23/03/24.
//

import Foundation

class Heal:Item{
    let healthRecovered: Int
    
    init(healthRecovered: Int, description: String, name: String) {
        self.healthRecovered = healthRecovered
        super.init(description: description, name: name)
    }
    
    func use()-> Int {
        print("You drink the \(name) potion, hp+ \(healthRecovered)")
        return healthRecovered
    }
}
