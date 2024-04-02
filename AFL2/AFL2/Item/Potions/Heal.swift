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
    
    init(healthRecovered: Int, description: String, name: String) {
        self.healthRecovered = healthRecovered
        self.description = description
        self.name = name
    }
    
    func drink(player: Player) {
        print("You drink the \(name) potion, hp+ \(healthRecovered)")
        player.hp += healthRecovered
        if player.hp > player.maxHp{
            player.hp = player.maxHp
        }
    }
    
    func use(player: Player) {
        self.drink(player: player)
    }
}
