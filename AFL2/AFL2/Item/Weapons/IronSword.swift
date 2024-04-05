//
//  IronSword.swift
//  AFL2
//
//  Created by RabiRabi Channel on 04/04/24.
//

import Foundation

class IronSword: Weapon{
    var damage = 20
    
    var maxDamage = 50
    
    var name = "Iron Sword"
    
    var description = "Sharp and shiny iron sword, when equipped gives you some new attacks"
    
    func use(player: Player) {
        if player.weapon != nil{
            player.weapon?.unuse(player: player)
        }
        print("You Equipped the Iron Sword")
        player.weapon = self.self
        player.abilities.append(Ability(name: "Slash", damage: Int(Double(damage)*1.2), mpUsage: 0, description: "Slash the enemy using your sword", attack: "slash"))
        player.abilities.append(Ability(name: "Stab", damage: Int(Double(damage)*1.4), mpUsage: 0, description: "Stab the enemy using your sword", attack: "stab"))
    }
    
    func unuse(player: Player) {
        print("You Uneqquipped the Iron Sword")
        player.items.append(player.weapon!)
        player.weapon = nil
        for (index,ability) in player.abilities.enumerated(){
            if ability.name == "Slash"{
                player.abilities.remove(at: index)
            }
        }
        for (index,ability) in player.abilities.enumerated(){
            if ability.name == "Stab"{
                player.abilities.remove(at: index)
            }
        }
    }
    
    func sharpen(ironSword:IronSword){
        if ironSword.damage < maxDamage{
            print("You sharpened your iron sword, iron sword damage +5")
            ironSword.damage += 5
        }else{
            print("Can't sharpen the sword any further")
        }
        
    }
}
