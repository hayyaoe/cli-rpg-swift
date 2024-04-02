//
//  Troll.swift
//  AFL2
//
//  Created by RabiRabi Channel on 31/03/24.
//

import Foundation

class Troll: Enemy{
    var itemDrop: [EnemyDrop]
    
    var name: String
    
    var atk: Int
    
    var hp: Int
    
    var expDrop: Int
    
    var weakness: String
    
    var attack: String
    
    var maxHp: Int
    
    init(name: String = "Troll", atk: Int = Int.random(in: 10...15), hp: Int = Int.random(in: 50...75), expDrop: Int = Int.random(in: 20...25), weakness: String = "The weakness is the head", attack: String = "Punch" ) {
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
