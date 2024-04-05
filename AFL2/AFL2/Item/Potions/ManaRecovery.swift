//
//  ManaRecovery.swift
//  AFL2
//
//  Created by RabiRabi Channel on 23/03/24.
//

import Foundation

class ManaRecovery:Potion{
    
    var name: String
    
    var description: String
    
    let manaRecovered: Int
    
    init(manaRecovered: Int, description: String, name: String) {
        self.manaRecovered = manaRecovered
        self.description = description
        self.name = name
    }
    
    func drink(player: Player){
        print("You drink the \(name) potion, \(manaRecovered) mana recovered")
        player.mp = manaRecovered
        if player.mp > player.maxMp{
            player.mp = player.maxMp
        }
    }
    
    func use(player: Player) {
        self.drink(player: player)
    }
}
