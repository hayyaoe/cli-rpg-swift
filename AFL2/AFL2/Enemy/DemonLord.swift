//
//  DemonLord.swift
//  AFL2
//
//  Created by RabiRabi Channel on 05/04/24.
//

import Foundation

class DemonLord: Enemy{
    var itemDrop: [EnemyDrop]
    
    var name: String
    
    var hp: Int
    
    var expDrop: Int
    
    var weakness: String
    
    var maxHp: Int
    
    init(name: String = "Alvida", hp: Int = 1000, expDrop: Int = 500, weakness: String = "the demon lord is actually pretty cute, maybe you could flirt with her?") {
        self.name = name
        self.hp = hp
        self.expDrop = expDrop
        self.weakness = weakness
        self.maxHp = hp
        self.itemDrop = []
    }
    
    func attackPlayer(player: Player, multiplier: Double) {
        print("\(name) attacks!")
        let attacks = [
                    fireBreath,
                    curseOfAlvida,
                    strike
                ]
                
                let randomIndex = Int.random(in: 0..<attacks.count)
                
                let damage = Double(attacks[randomIndex]()) * multiplier
                
                print("Damage: \(Int(damage))")
                player.hp -= Int(damage)
    }
    
    func fireBreath() -> Int {
        print("\(name) used fire breath!")
        return Int.random(in: 50...60)
    }
    
    func curseOfAlvida() -> Int {
        print("\(name) cursed you!")
        print("\(name): come here you lil piece of nugget!")
        print("* you got emotional damage")
        return Int.random(in: 45...50)
    }
    
    func strike() -> Int {
        print("\(name) strikes you with her dragon claw!")
        return Int.random(in: 60...63)
    }
    
    func spare(player: Player){
        print("You decide to spare the Demon Lord, intrigued by her unexpected weakness.")
        sleep(2)
        print("As you approach her, she looks at you with surprise and curiosity.")
        sleep(2)
        print("\(player.name): 'I don't want to fight you. In fact, I find you quite intriguing.'")
        sleep(2)
        print("\(name): 'What do you mean? Why spare me?'")
        sleep(2)
        print("You explain that you see beyond her menacing exterior and believe there is more to her than meets the eye.")
        sleep(3)
         print("Demon Lord, intrigued by your words, agrees to talk. As you spend more time together, you discover that she is not as evil as she seemed.")
        sleep(3)
        print("In time, your conversations turn into friendship, and then into something more.")
        sleep(2)
        print("Eventually, you and the Demon Lord fall in love and decide to get married.")
        sleep(2)
        print("The once fearsome Demon Lord is now your loving partner, and together, you embark on new adventures, proving that love can conquer even the darkest of hearts.")
        sleep(3)
    }
}
