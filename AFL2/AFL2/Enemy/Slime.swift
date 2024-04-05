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
    
    var hp: Int
    
    var expDrop: Int
    
    var weakness: String
    
    init(name: String = "Slime", hp: Int = Int.random(in: 10...20), expDrop: Int = Int.random(in: 5...8), weakness: String = "Slime has no Weakness") {
        self.name = name
        self.hp = hp
        self.expDrop = expDrop
        self.weakness = weakness
        self.maxHp = hp
        self.itemDrop = [Gel(), SlimeCrystal()]
    }
    
    func attackPlayer(player: Player, multiplier: Double) {
        print("\(name) attacks!")
        let attacks = [
                acidSlime,
                headButt,
                suffocate
            ]
            
            let randomIndex = Int.random(in: 0..<attacks.count)
            
            let damage = Double (attacks[randomIndex]()) * Double(multiplier)
            
            print("Damage: \(Int (damage))")
            player.hp -= Int(damage)
    }
    
    func acidSlime()->Int{
        print("\(name) spits acid!")
        return Int.random(in: 6...8)
    }
    
    func headButt()-> Int{
        print("\(name) head butts!")
        return Int.random(in: 2...3)
    }
    
    func suffocate()-> Int{
        print("\(name) jumps to your face!")
        return Int.random(in: 8...10)
    }

}
