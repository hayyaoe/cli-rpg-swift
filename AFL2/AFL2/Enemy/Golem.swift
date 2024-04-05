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
    
    var hp: Int
    
    var expDrop: Int
    
    var weakness: String
    
    var maxHp: Int
    
    init(name: String = "Golem", hp: Int = Int.random(in: 200...250), expDrop: Int = Int.random(in: 50...60), weakness: String = "The weakness is the legs") {
        self.name = name
        self.hp = hp
        self.expDrop = expDrop
        self.weakness = weakness
        self.maxHp = hp
        self.itemDrop = [MagicCrystal(),AncientRune(name: "Ancient Rune", description: "Contains some magical ability that you can learn.")]
    }
    
    func attackPlayer(player: Player, multiplier: Double) {
        print("\(name) attacks!")
        let attacks = [
                    rockThrow,
                    charge,
                    groundSlam
                ]
                
                let randomIndex = Int.random(in: 0..<attacks.count)
                
                let damage = Double(attacks[randomIndex]()) * multiplier
                
                print("Damage: \(Int(damage))")
                player.hp -= Int(damage)
    }
    
    func rockThrow() -> Int {
        print("\(name) throws a rock!")
        return Int.random(in: 30...36)
    }
    
    func groundSlam() -> Int {
        print("\(name) slams the ground!")
        return Int.random(in: 30...38)
    }
    
    func charge() -> Int {
        print("\(name) charges at you!")
        return Int.random(in: 33...38)
    }
}
