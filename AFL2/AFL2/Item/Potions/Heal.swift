//
//  Heal.swift
//  AFL2
//
//  Created by RabiRabi Channel on 23/03/24.
//

import Foundation

class Heal:Potion{
    var name: String
    
    var description: String
    
    let healthRecovered: Int
    
    init(name: String, description: String, healthRecovered: Int) {
        self.name = name
        self.description = description
        self.healthRecovered = healthRecovered
    }
    
    func drink(player: Player) {
        print("You drink the \(name) potion, \(healthRecovered) hp recovered")
        player.hp += healthRecovered
        if player.hp > player.maxHp{
            player.hp = player.maxHp
        }
    }
    
    func use(player: Player) {
        self.drink(player: player)
    }
}
