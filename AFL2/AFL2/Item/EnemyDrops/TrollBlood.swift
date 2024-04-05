//
//  TrollBlood.swift
//  AFL2
//
//  Created by RabiRabi Channel on 05/04/24.
//

import Foundation

class TrollBlood: EnemyDrop{
    var dropRate = 0.5

    var price = Int.random(in: 10...15)
    
    var name = "Troll Blood"
    
    var description = "The thing is nasty"
    
    var hpRecovered = Int.random(in: 25...28)
    
    func sell(player: Player) {
        player.coin += price
        print("You sold a jug of \(name) for \(price) coins")
    }
    
    func use(player: Player) {
        print("you rub the \(name) to your wounds")
        sleep(1)
        let healthRecovered = hpRecovered
        
        if healthRecovered > 0{
            print("you feel the \(name) heals your wound")
            print("hp +\(healthRecovered)")
            player.hp += healthRecovered
            if player.hp > player.maxHp{
                player.hp = player.maxHp
            }
        }
    }
    
    
}
