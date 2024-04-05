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
    var coin: Int = 0
    var exp: Int = 1000
    var level: Int = 1
    var expUp: Int = 50
    var weapon: Weapon?
    var abilities: [Ability] = [Ability(name: "Punch" ,damage: 5, mpUsage: 0, description: "Use your fist to slay enemies!.", attack:"Punched")]
    var items: [Item] = [ObsidianDagger(), IronSword(), AncientRune(name:"Ancient Rune", description: "Contains magical power that you can learn"),AncientScroll(name:"Syams Al Maarif",description: "Cursed ancient occult book that contains forbidden magic"),TrollMeat(),TrollBlood(),MagicCrystal()]
    
    func stats(){
        print("""
        Hero: \(name)
        
        HP: \(hp)/\(maxHp)
        MP: \(mp)/\(maxMp)
        LVL: \(level)
        EXP: \(exp)/\(expUp)
        Coin: \(coin)

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
    
    func inventory(){
        if self.items.isEmpty{
            var back = false
            repeat{
                print("You don't have anything in your inventory\n")
                print("Press [return] to go back", terminator: " ")
                if let input = readLine(), input.isEmpty{
                    back = true
                }
            }while(!back)
        }else{
            var used = false
            repeat{
                var choice = ""
                print("""
                
                Inventory:
                """)
                for (index,_item) in self.items.enumerated(){
                    print("[\(index+1)]\(_item.name) - \(_item.description)")
                }
                
                print("Select item or [return] to cancel: ", terminator: "")
                if let input = readLine(){
                    choice = input
                }
                
                if !choice.isEmpty{
                    for (index,_item) in self.items.enumerated(){
                        if choice == "\(index+1)"{
                            _item.use(player: self.self)
                            self.items.remove(at: index)
                            used = true
                            break
                        }
                    }
                }else{
                    break
                }
            }while(!used)
        }
    }
    
    func levelUp(){
        if exp >= expUp{
            exp -= expUp
            level += 1
            expUp += Int(50.0 * 0.5)
            let hpIncrease = Double (100) * 0.5
            let mpIncrease = Double (50) * 0.5
            maxHp += Int (hpIncrease)
            maxMp += Int (mpIncrease)
            
            print("Level Up!, you're now level \(level)")
        }
    }
    
    func attack(enemy: inout Enemy, ability: Ability){
        
        // damage count
        let damage = (Double (ability.damage) * (1.0 + (Double (level)*0.2)))
        
        // player mp reduce
        mp -= ability.mpUsage
        
        enemy.hp -= Int (damage)
        
        print("")
        print("You \(ability.attack) the \(enemy.name)")
        print("Damage done: \(Int (damage))")
        if ability.mpUsage != 0{
        print("mana used \(ability.mpUsage)")
        }
        print("")
        sleep(1)
    }
    
    func healWounds(){
        var back = false
        
        repeat{
            var choice = ""
            var confirm = ""
            let healItems = items.compactMap{$0 as? Heal }
            
            if !healItems.isEmpty{
                for (index,_item) in healItems.enumerated(){
                    print("[\(index+1)]\(_item.name) - \(_item.healthRecovered)hp")
                }
                print("Choose or press [return] to go back?", terminator: " ")
                if let input = readLine(), !input.isEmpty{
                    choice = input.uppercased()
                }else{
                    back = true
                }
                
                if (maxHp - hp) >= healItems[(Int(choice)!-1)].healthRecovered{
                    var sure = false
                    repeat{
                        print("Are You sure to use \(healItems[Int(choice)!-1].name) to heal ?")
                        if let input = readLine(), !input.isEmpty{
                            confirm = input.uppercased()
                            
                            if confirm == "N" || confirm == "Y"{
                                sure = true
                            }
                        }
                        
                    }while(!sure)
                    
                }
                
                if confirm == "Y"{
                    var itemName = ""
                    for (index,_item) in healItems.enumerated(){
                        if choice == "\(index+1)"{
                            _item.drink(player: self)
                            itemName = _item.name
                        }
                    }
                    
                    for (index,_item) in items.enumerated(){
                        if _item.name == itemName{
                            items.remove(at: index)
                            break
                        }
                    }
                    
                }
               
            }else{
                print("You don't have any healing potion\n")
                print("Press [return] to go back", terminator: " ")
                if let input = readLine(), input.isEmpty{
                    back = true
                }
            }
            
        }while(!back)

    }
}
