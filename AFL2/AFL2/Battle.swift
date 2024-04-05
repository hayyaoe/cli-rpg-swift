//
//  Battle.swift
//  AFL2
//
//  Created by RabiRabi Channel on 22/03/24.
//

import Foundation

struct Battle{
    let battleField: String
    let player: Player
    var enemies: [Enemy]
    var selectedEnemy: Enemy
    
    func intro(message: String){
        var isContinue = false
        repeat{
            print(message)
            print("""
                
                press [return] to continue
                """, terminator: "")
            if let input = readLine(), input.isEmpty {
                isContinue = true
            }
        }while !isContinue
    }
    
    mutating func fight(){
        var finishBattle = false
        repeat{
            var choice = ""
            
            print("""
            \(player.name)
            health: \(player.hp)/\(player.maxHp)
            mana: \(player.mp)/\(player.maxMp)
            """)
            
            print("Enemies:")
            for enemy in enemies{
                print("""
                \(enemy.name) - Health: \(enemy.hp)
                """)
            }
            print("""
            
            Choose your action:
            """)
            
            for (index,ability) in player.abilities.enumerated(){
                print("[\(index+1)]\(ability.name) - \(ability.description)")
            }
            
            print("""
            
            [D]efend
            [U]se Item
            [H]eal Wounds
            [C]heck Enemy Stats
            [F]lee
            """)
            if selectedEnemy.name == "Alvida" && selectedEnemy.hp <= selectedEnemy.maxHp/4{
                print("[S]pare???")
            }
            print("\nYour choice?")
            if let input = readLine(), !input.isEmpty{
                choice = input.uppercased()
            }
            
            for (index,ability) in player.abilities.enumerated(){
                // Attack Selection
                if choice == "\(index+1)"{
                    
                    selectEnemy()
                    
                    player.attack(enemy: &selectedEnemy, ability: ability)
 
                    // enemy counter attack
                    if selectedEnemy.hp <= 0 {
                        
                        print("You have defeated the \(selectedEnemy.name)")
                        print("You earned \(selectedEnemy.expDrop) exp")
                        
                        player.exp += selectedEnemy.expDrop
                        itemDrop(enemyDrops: selectedEnemy.itemDrop, player: player)
                        
                        for (index,enemy) in enemies.enumerated(){
                            if enemy.name == selectedEnemy.name{
                                enemies.remove(at: index)
                            }
                        }
                        
                    }else if Double (selectedEnemy.hp) <= Double (selectedEnemy.maxHp/4){
                        print("The \(selectedEnemy.name) slows down and shake hard\n")
                    }else if Double (selectedEnemy.hp) <= Double (selectedEnemy.maxHp/2){
                        print("The \(selectedEnemy.name) starts to shake\n")
                    }else{
                        print("The \(selectedEnemy.name) still stood strong\n")
                    }
                    
                    for enemy in enemies{
                        finishBattle = enemyTurn(enemy: enemy, isDefend: false)
                    }
                    
                    if enemies.isEmpty{
                        finishBattle = true
                        print("You won the battle!")
                    }
                    
                    break
                }
            }
            
            if choice == "U"{
                useItem()
            }else if choice == "F"{
                finishBattle = flee()
            }else if choice == "H"{
                player.healWounds()
            }else if choice == "C"{
                checkEnemy()
            }else if choice == "D"{
                finishBattle = defend()
            }else if choice == "S" && selectedEnemy.name == "Alvida" && selectedEnemy.hp <= selectedEnemy.maxHp/4{
                if let demonLord = selectedEnemy as? DemonLord {
                    demonLord.spare(player: player)
                finishBattle = true
                }
            }
            player.levelUp()
        }while(!finishBattle)
    }
    
    private func useItem(){
        player.inventory()
    }
    
    private func defend()-> Bool{
        var finishBattle = false
        print("You prepare your defence")
        for enemy in enemies{
            finishBattle = enemyTurn(enemy: enemy, isDefend: true)
        }
        return finishBattle
    }
    
    private func flee()-> Bool{
        var _continue = false
        repeat{
        if battleField != "Dark Forest" || battleField != "Gate of Hell" || battleField != "Demon Lord's Castle" {
            print("""
            You trying to run away from the foes, you successfully leave the \(battleField), you should be more prepared next time!.
            
            press [return] to continue.
            """)
            if let input = readLine(), input.isEmpty{
                _continue = true
            }
         } else {
             print("You cannot flee from this battle!")
             break
         }
        

        }while(!_continue)
        
        return _continue
    }
    
    
    private func checkEnemy(){
        print("You're trying to figure out The \(selectedEnemy.name)'s weakness", terminator: "")
        sleep(1)
        print(".", terminator: "")
        sleep(1)
        print(".", terminator: "")
        sleep(1)
        print(".")
        sleep(1)
        print(selectedEnemy.weakness)
    }
    
    private func enemyTurn(enemy: Enemy, isDefend: Bool)-> Bool{
        var atkMultiplier = 0.0
        if !isDefend{
            if Double (enemy.hp) <= Double (enemy.maxHp/4){
                atkMultiplier = 0.25
            }else if Double (selectedEnemy.hp) <= Double (selectedEnemy.maxHp/2){
                atkMultiplier = 0.5
            }else{
                atkMultiplier = 1.0
            }
        }

        enemy.attackPlayer(player: player, multiplier: atkMultiplier)
        sleep(1)
        
        if player.hp <= 0{
            print("You're tired and needed rest")
            sleep(1)
            print("Go rest permanently in the afterlife")
            print("")
            return true
        }else if player.hp < player.maxHp/2{
            print("You're hurt, go heal yourself!")
            sleep(1)
            print("")
            return false
        }else{
            print("You still stand Strong")
            sleep(1)
            print("")
            return false
        }
    }
    
    private func itemDrop(enemyDrops: [EnemyDrop], player: Player){
        let dropSystem = RandomDropSystem(enemyDrops: enemyDrops)
        
        if let item = dropSystem.dropItem() {
            print("You got a \(item.name)")
            player.items.append(item)
        } else {
            print("No item dropped")
        }
        
        print("")
    }
    
    private mutating func selectEnemy(){
        var selected = false
        repeat{
            for (index,enemy) in enemies.enumerated(){
                print("""
                [\(index+1)]\(enemy.name) - Health: \(enemy.hp)
                """)
            }
            print("Select Enemy to Attack: ", terminator: "")
            
            if let input = readLine(), let selectedIndex = Int(input), (1...enemies.count).contains(selectedIndex) {
                selectedEnemy = enemies[selectedIndex - 1]
                selected = true
            }
        } while !selected
    }
    
    
    
}
