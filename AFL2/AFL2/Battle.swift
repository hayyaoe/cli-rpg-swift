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
    var turn: Int
    
    func intro(message: String){
        var isContinue = false
        repeat{
            print(message)
            if let input = readLine(), input.isEmpty {
                isContinue = true
            }
        }while !isContinue
    }
    
    mutating func fight(){
        var finishBattle = false
        repeat{
            var choice = ""
            
            for enemy in enemies{
                print("""
                \(enemy.name) - Health: \(enemy.hp)
                
                """)
            }
            print("""
            
            Choose your action:
            """)
            
            for (index,ability) in player.abilities.enumerated(){
                print("[\(index+1)]\(ability.description)")
            }
            
            print("""
            
            [D]efend
            [U]se Item
            [C]heck Enemy Stats
            [F]lee
            
            Your choice?
            """)
            if let input = readLine(), !input.isEmpty{
                choice = input
            }
            
            for (index,ability) in player.abilities.enumerated(){
                // Attack Selection
                if choice == "\(index+1)"{
                    
                    selectEnemy()
                    
                    print("You \(ability.attack) the \(selectedEnemy.name) hard")
                    print("Damage done: \(ability.damage)")
                    
                    // damage count
                    selectedEnemy.hp -= ability.damage + (ability.damage * (player.exp/100))
                    
                    // player mp reduce
                    player.mp -= ability.mpUsage
 
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
                    }else if Double (selectedEnemy.hp) < Double (selectedEnemy.maxHp/4){
                        print("The \(selectedEnemy.name) slows down and shake hard")
                    }else if Double (selectedEnemy.hp) < Double (selectedEnemy.maxHp/2){
                        print("The \(selectedEnemy.name) starts to shake")
                    }else{
                        print("The \(selectedEnemy.name) still stood strong")
                    }
                    
                    for enemy in enemies{
                        finishBattle = enemyTurn(enemy: enemy)
                    }
                    
                    if enemies.isEmpty{
                        finishBattle = true
                    }
                    
                    break
                }
            }
            
            if choice == "U"{
                useItem()
            }else if choice == "F"{
                finishBattle = flee()
            }else if choice == "C"{
                checkEnemy()
            }else if choice == "D"{
                finishBattle = defend()
            }
            
            
            
        }while(!finishBattle)
    }
    
    func useItem(){
        if player.items.isEmpty{
            print("""
            
            Inventory:
            !!Empty!!
            """)
        }else{
            var used = false
            repeat{
                var choice = ""
                print("""
                
                Inventory:
                """)
                for (index,_item) in player.items.enumerated(){
                    print("[\(index+1)]\(_item.name) - \(_item.description)")
                }
                
                print("Select item or [return] to cancel")
                if let input = readLine(){
                    choice = input
                }
                
                print(choice)
                
                if !choice.isEmpty{
                    for (index,_item) in player.items.enumerated(){
                        if choice == "\(index+1)"{
                            _item.use(player: player)
                            player.items.remove(at: index)
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
    
    func defend()-> Bool{
        var finishBattle = false
        print("You prepare your defence")
        for enemy in enemies{
            finishBattle = enemyTurn(enemy: enemy)
        }
        return finishBattle
    }
    
    func flee()-> Bool{
        var _continue = false
        repeat{
            print("""
        You trying to run away from the foes, you successfully leave the \(battleField), you should be more prepared next time!.
        
        press [return] to continue.
        """)
            if let input = readLine(), input.isEmpty{
                _continue = true
            }
        }while(!_continue)
        
        return _continue
    }
    
    
    func checkEnemy(){
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
    
    func enemyTurn(enemy: Enemy)-> Bool{
        var atkMultiplier = 0.0
        if Double (enemy.hp) < Double (enemy.maxHp/4){
            atkMultiplier = 0.25
        }else if Double (selectedEnemy.hp) < Double (selectedEnemy.maxHp/2){
            atkMultiplier = 0.5
        }else{
            atkMultiplier = 1.0
        }
        var damage = Double (enemy.atk) * atkMultiplier
        print("The \(enemy.name) \(enemy.attack) you")
        print("Damage done: \(Int (damage))")
        
        player.hp -= Int (damage)
        
        if player.hp <= 0{
            print("You're tired and needed rest, go rest permanently in the afterlife")
            return true
        }else if player.hp < player.maxHp/2{
            print("You're hurt, go heal yourself!.")
            return false
        }else{
            print("You still stand Strong")
            return false
        }
    }
    
    func itemDrop(enemyDrops: [EnemyDrop], player: Player){
        let dropSystem = RandomDropSystem(enemyDrops: enemyDrops)
        
        if let item = dropSystem.dropItem() {
            print("You got a \(item.name)")
            player.items.append(item)
        } else {
            print("No item dropped")
        }
    }
    
    mutating func selectEnemy(){
        var selected = false
        repeat{
            for (index,enemy) in enemies.enumerated(){
                print("""
                [\(index+1)]\(enemy.name) - Health: \(enemy.hp)
                """)
            }
            
            if let input = readLine(), let selectedIndex = Int(input), (1...enemies.count).contains(selectedIndex) {
                selectedEnemy = enemies[selectedIndex - 1]
                selected = true
            }
        } while !selected
    }
    
}
