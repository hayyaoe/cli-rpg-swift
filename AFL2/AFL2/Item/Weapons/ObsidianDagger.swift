//
//  ObsidianDagger.swift
//  AFL2
//
//  Created by RabiRabi Channel on 05/04/24.
//

import Foundation

class ObsidianDagger: Weapon {
    var damage = 50
    
    var maxDamage = 100
    
    var name = "Obsidian Dagger"
    
    var description = "Small black dagger made out of obsidian, when equipped gives you some new attacks"
    
    func use(player: Player) {
        if player.weapon != nil{
            player.weapon?.unuse(player: player)
        }
        
        print("You equipped the Obsidian Dagger")
        player.weapon = self
        player.abilities.append(Ability(name: "Rip", damage: Int(Double(damage)*1.4), mpUsage: 0, description: "Rips the enemy apart using your dagger", attack: "rips apart "))
        player.abilities.append(Ability(name: "Strike", damage: Int(Double(damage)*1.5), mpUsage: 0, description: "Strikes the enemy using your dagger", attack: "strike"))
    }
    
    func unuse(player: Player) {
        print("You unequipped the Obsidian Dagger")
        player.items.append(player.weapon!)
        player.weapon = nil
        for (index,ability) in player.abilities.enumerated(){
            if ability.name == "Rip"{
                player.abilities.remove(at: index)
            }
        }
        for (index,ability) in player.abilities.enumerated(){
            if ability.name == "Strike"{
                player.abilities.remove(at: index)
            }
        }
    }
    
    func enchant(obsidianDagger: ObsidianDagger) {
        if obsidianDagger.damage < maxDamage {
            print("You enchanted your obsidian dagger, obsidian dagger damage +5")
            obsidianDagger.damage += 5
        } else {
            print("Can't enchant the dagger any further")
        }
        
    }
}
