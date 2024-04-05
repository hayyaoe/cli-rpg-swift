//
//  TrollMeat.swift
//  AFL2
//
//  Created by RabiRabi Channel on 05/04/24.
//

import Foundation

class TrollMeat: EnemyDrop{
    var dropRate = 0.7

    var price = Int.random(in: 20...28)
    
    var name = "Troll Meat"
    
    var description = "The thing is nasty"
    
    var hpRecovered = Int.random(in: 20...22)
    
    func sell(player: Player) {
        player.coin += price
        print("You sold a pile of \(name) for \(price) coins")
    }
    
    func use(player: Player) {
        print("you ate the \(name) to recover your health")
        sleep(1)
        let healthRecovered = hpRecovered
        
        if healthRecovered > 0{
            print("The \(name) taste pretty bad.")
            print("hp +\(healthRecovered)")
            player.hp += healthRecovered
            if player.hp > player.maxHp{
                player.hp = player.maxHp
            }
        }
    }
    
    
}
