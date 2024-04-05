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
    
    var hp: Int
    
    var expDrop: Int
    
    var weakness: String
    
    var maxHp: Int
    
    init(name: String = "Troll", hp: Int = Int.random(in: 50...75), expDrop: Int = Int.random(in: 20...25), weakness: String = "The weakness is the head") {
        self.name = name
        self.hp = hp
        self.expDrop = expDrop
        self.weakness = weakness
        self.maxHp = hp
        self.itemDrop = [TrollMeat(),TrollBlood()]
    }
    
    func attackPlayer(player: Player, multiplier: Double) {
        print("\(name) attacks!")
        let attacks = [
                    smash,
                    stomp
                ]
                
                let randomIndex = Int.random(in: 0..<attacks.count)
                
                let damage = Double(attacks[randomIndex]()) * multiplier
                
                print("Damage: \(Int(damage))")
                player.hp -= Int(damage)
    }
    
    func smash() -> Int {
        print("\(name) smashes the ground!")
        return Int.random(in: 20...25)
    }
    
    func stomp() -> Int {
        print("\(name) stomps on you!")
        return Int.random(in: 25...30)
    }
    
    
}
