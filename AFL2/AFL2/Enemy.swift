//
//  Enemy.swift
//  AFL2
//
//  Created by RabiRabi Channel on 22/03/24.
//

import Foundation

class Enemy{
    let name: String
    let atk: Int
    var hp: Int
    var expDrop: Int
    var weakness: String
    var attack: String
    
    init(name: String, atk: Int, hp: Int, expDrop: Int, weakness: String, attack: String) {
        self.name = name
        self.atk = atk
        self.hp = hp
        self.expDrop = expDrop
        self.weakness = weakness
        self.attack = attack
    }
}
