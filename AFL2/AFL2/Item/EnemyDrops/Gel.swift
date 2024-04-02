//
//  Gel.swift
//  AFL2
//
//  Created by RabiRabi Channel on 02/04/24.
//

import Foundation

class Gel: EnemyDrop{
    var dropRate = 0.7

    var price = Int.random(in: 5...7)
    
    var name = "Gel"
    
    var description = "The thing is sticky"
    
    func sell(player: Player) {
        player.coin += price
        print("You sold a \(name) for \(price) coins")
    }
    
    func use(player: Player) {
        print("you rub the \(name) to your wounds")
        sleep(1)
        let healthRecovered = Int.random(in: 0...5)
        
        if healthRecovered > 0{
            print("you feel the \(name) makes your wound a bit better")
            print("hp +\(healthRecovered)")
            player.hp += healthRecovered
            if player.hp > player.maxHp{
                player.hp = player.maxHp
            }
        }else{
            print("it does nothing.")
        }
    }
    
    
}
