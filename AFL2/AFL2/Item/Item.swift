//
//  Item.swift
//  AFL2
//
//  Created by RabiRabi Channel on 23/03/24.
//

import Foundation

protocol Item{
    var name: String {get set}
    var description: String {get set}
    
    func use(player: Player)
}
