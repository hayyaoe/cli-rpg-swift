//
//  Ability.swift
//  AFL2
//
//  Created by RabiRabi Channel on 23/03/24.
//

import Foundation

class Ability{
    var name: String
    var damage: Int
    var mpUsage: Int
    var description: String
    var attack: String
    
    init(name: String, damage: Int, mpUsage: Int, description: String, attack: String) {
        self.name = name
        self.damage = damage
        self.mpUsage = mpUsage
        self.description = description
        self.attack = attack
    }
}
