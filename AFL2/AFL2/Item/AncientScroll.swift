//
//  AncientScroll.swift
//  AFL2
//
//  Created by RabiRabi Channel on 04/04/24.
//

import Foundation

class AncientScroll: Item{
    var name: String
    
    var description: String
    
    let abilities: [Ability] = [
        Ability(name: "Curse of LeMans", damage: 50, mpUsage: 20, description: "Slam the enemy into the ground", attack: "chant the Curse of LeMans to"),
        Ability(name: "Banaspati", damage: 250, mpUsage: 100, description: "Summons a great fireball to hit the enemy", attack: "summon Banspati to burn"),
        Ability(name: "Ice Spikes", damage: 30, mpUsage: 10, description: "Summons ice spikes from the ground", attack: "chant Ice Spikes from the ground to hit"),
        Ability(name: "Thunderstorm", damage: 55, mpUsage: 25, description: "Summons a powerful thunderstorm to strike the enemy", attack: "summon the Thunderstorm to "),
        Ability(name: "Inferno Blast", damage: 500, mpUsage: 200, description: "Engulfs the enemy in flames", attack: "chant the Inferno Blast to burn"),
        Ability(name: "Soul Drain", damage: 25, mpUsage: 12, description: "Drains the enemy's life force and adds it to the player's health", attack: "chant Soul Drain to drain the soul of "),
    ]
    
    init(name: String, description: String) {
        self.name = name
        self.description = description
    }
    
    func use(player: Player) {
        
        let uniqueAbilities = abilities.filter { ability in
            !player.abilities.contains { $0.name == ability.name }
        }
       
        if let randomAbility = uniqueAbilities.randomElement() {
            print("You read the \(name)")
            sleep(2)
            print("You got a new magical ability \(randomAbility.name)")
            player.abilities.append(randomAbility)
        }
    }
}
