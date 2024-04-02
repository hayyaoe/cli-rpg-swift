//
//  Slime.swift
//  AFL2
//
//  Created by RabiRabi Channel on 31/03/24.
//

import Foundation

class Slime: Enemy{
    var itemDrop: [EnemyDrop]
    
    var maxHp: Int
    
    var name: String
    
    var atk: Int
    
    var hp: Int
    
    var expDrop: Int
    
    var weakness: String
    
    var attack: String
    
    init(name: String = "Slime", atk: Int = Int.random(in: 1...3), hp: Int = Int.random(in: 10...20), expDrop: Int = Int.random(in: 5...8), weakness: String = "Slime has no Weakness", attack: String = "Headbuts") {
        self.name = name
        self.atk = atk
        self.hp = hp
        self.expDrop = expDrop
        self.weakness = weakness
        self.attack = attack
        self.maxHp = hp
        self.itemDrop = [Gel(), SlimeCrystal()]
    }

}
