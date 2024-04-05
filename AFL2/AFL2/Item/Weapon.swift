//
//  Weapon.swift
//  AFL2
//
//  Created by RabiRabi Channel on 04/04/24.
//

import Foundation

protocol Weapon: Item{
    
    var damage: Int {get set}
    
    func unuse(player: Player)
}
