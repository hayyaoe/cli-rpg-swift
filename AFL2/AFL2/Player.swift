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
    var coin: Int = 10
    var exp: Int = 1
    var abilities: [Ability] = [Ability(name: "Punch" ,damage: 5, mpUsage: 0, description: "Use your fist to slay enemies!. deals 5 damage.", attack:"Punched")]
    var items: [Item] = []
    
    func stats(){
        print("""
        Hero: \(name)
        
        HP: \(hp)
        MP: \(mp)
        EXP: \(exp)

        """)
        if !abilities.isEmpty{
            print("Ability:")
            for ability in abilities{
                print("- \(ability.description)")
            }
        }
        
        if !items.isEmpty{
            print("Inventory:")
            for _item in items{
                print("- \(_item)")
            }
        }
        
    }
}
