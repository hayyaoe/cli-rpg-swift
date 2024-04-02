//
//  Player.swift
//  AFL2
//
//  Created by RabiRabi Channel on 22/03/24.
//

import Foundation

class Player{
    var name: String = ""
    var hp: Int = 100
    var maxHp: Int = 100
    var mp: Int = 50
    var maxMp: Int = 50
    var coin: Int = 10
    var exp: Int = 1
    var abilities: [Ability] = [Ability(name: "Punch" ,damage: 5, mpUsage: 0, description: "Use your fist to slay enemies!. deals 5 damage.", attack:"Punched")]
    var items: [Item] = []
    
    func stats(){
        print("""
        Hero: \(name)
        
        HP: \(hp)/\(maxHp)
        MP: \(mp)/\(maxMp)
        EXP: \(exp)

        """)
        if !abilities.isEmpty{
            print("Ability:")
            for ability in abilities{
                print("- \(ability.name). \(ability.description)")
            }
        }
        
        if !items.isEmpty{
            print("Inventory:")
            for _item in items{
                print("- \(_item.name). \(_item.description)")
            }
        }
        
    }
}
