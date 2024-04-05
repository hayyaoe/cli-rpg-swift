//
//  AncientRune.swift
//  AFL2
//
//  Created by RabiRabi Channel on 05/04/24.
//

import Foundation

class AncientRune: AncientScroll, EnemyDrop{
    var price = Int.random(in: 100...120)
    
    var dropRate = 0.1
    
    func sell(player: Player) {
        player.coin += price
        print("You sold an \(name) for \(price) coins")
    }
    
    
}
