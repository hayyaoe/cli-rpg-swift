//
//  Golem.swift
//  AFL2
//
//  Created by RabiRabi Channel on 31/03/24.
//

import Foundation

class Golem: Enemy{
    var itemDrop: [EnemyDrop]
    
    var name: String
    
    var atk: Int
    
    var hp: Int
    
    var expDrop: Int
    
    var weakness: String
    
    var attack: String
    
    var maxHp: Int
    
    init(name: String = "Golem", atk: Int = Int.random(in: 50...70), hp: Int = Int.random(in: 200...250), expDrop: Int = Int.random(in: 50...60), weakness: String = "The weakness is the legs", attack: String = "crush") {
        self.name = name
        self.atk = atk
        self.hp = hp
        self.expDrop = expDrop
        self.weakness = weakness
        self.attack = attack
        self.maxHp = hp
        self.itemDrop = []
    }
}
