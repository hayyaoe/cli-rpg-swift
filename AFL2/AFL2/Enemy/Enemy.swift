//
//  Enemy.swift
//  AFL2
//
//  Created by RabiRabi Channel on 22/03/24.
//

import Foundation

protocol Enemy{
    var name: String { set get }
    var hp: Int { set get }
    var expDrop: Int { set get }
    var weakness: String { set get }
    var maxHp: Int {set get}
    var itemDrop: [EnemyDrop] {get set}
    
    func attackPlayer(player: Player, multiplier:Double)
}
