//
//  MagicCrystal.swift
//  AFL2
//
//  Created by RabiRabi Channel on 05/04/24.
//

import Foundation

class MagicCrystal: EnemyDrop{
    var dropRate = 0.5
    
    var price = Int.random(in: 30...40)
    
    var name = "Magic Crystal"
    
    var description = "Emits strong mana aura, you could absorb it to recover some mana."
    
    var manaRecovered = Int.random(in: 50...75)
    
    func sell(player: Player) {
        player.coin += price
        print("You sold a \(name) for \(price) coins")
    }
    
    func use(player: Player) {
        print("you absorb the \(name).")
        sleep(1)
        let manaRecovered = manaRecovered
        
            print("you feel the \(name) increase your mana aura")
            sleep(1)
            print("mp +\(manaRecovered)")
            player.mp += manaRecovered
            if player.mp > player.maxMp{
                player.mp = player.maxMp
            }
        
    }
}
