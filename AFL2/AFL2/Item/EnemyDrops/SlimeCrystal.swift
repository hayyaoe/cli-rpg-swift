//
//  SlimeCrystal.swift
//  AFL2
//
//  Created by RabiRabi Channel on 02/04/24.
//

import Foundation

class SlimeCrystal: EnemyDrop{
    var dropRate = 0.2
    
    var price = Int.random(in: 10...20)
    
    var name = "Slime Crystal"
    
    var description = "Emits slimy aura, you could use it for something..."
    
    var manaRecovered = Int.random(in: 0...10)
    
    func sell(player: Player) {
        player.coin += price
        print("You sold a \(name) for \(price) coins")
    }
    
        func use(player: Player) {
            print("you absorb the \(name).")
            sleep(1)
            let manaRecovered = manaRecovered
            
            if manaRecovered > 0{
                print("you feel the \(name) increase your mana aura")
                sleep(1)
                print("mp +\(manaRecovered)")
                player.mp += manaRecovered
                if player.mp > player.maxMp{
                    player.mp = player.maxMp
                }
            }else{
                print("it does nothing.")
            }
        }
    
    
    
}
