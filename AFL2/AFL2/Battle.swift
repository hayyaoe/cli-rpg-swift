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
    let enemy: Enemy
    var turn: Int
    
    func intro(message: String){
        print(message)
    }
    
    func fight(){
        var finishBattle = false
        repeat{
            var choice = ""
            print("""
            
            Name: \(enemy.name)
            Health: \(enemy.hp)
            
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
                    print("You \(ability.attack) the \(enemy.name) hard")
                    print("Damage done: \(ability.damage)")
                    
                    // damage count
                    enemy.hp -= ability.damage + (ability.damage * (player.exp/100))
                    
                    // enemy counter attack
                    if Double (enemy.hp) > Double (enemy.hp/2){
                        print("The \(enemy.name) is still stood strong")
                        finishBattle = enemyTurn(atkMultiplier: 1)
                    }else if Double (enemy.hp) < Double (enemy.hp/2){
                        print("The \(enemy.name) starts to shake")
                        finishBattle = enemyTurn(atkMultiplier: 1/2)
                    }else if Double (enemy.hp) < Double (enemy.hp/4){
                        print("The \(enemy.name) slows down and shake hard")
                        finishBattle = enemyTurn(atkMultiplier: 1/4)
                    }else{
                        print("You have defeated the \(enemy.name)")
                        print("You earned \(enemy.expDrop) exp")
                        
                        player.exp += enemy.expDrop
                        finishBattle = true
                    }
                    break
                }
            }
            
            if choice == "U"{
                useItem()
            }else if choice == "F"{
                flee()
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
                print("""
                
                Inventory:
                """)
                for (index,_item) in player.items.enumerated(){
                    print("[\(index+1)]\(_item.name) - \(_item.description)")
                }
                
                print("Select item or [return] to cancle")
                
            }while(!used)
        }
    }
    
    func defend()-> Bool{
        print("You prepare your defence")
        return enemyTurn(atkMultiplier: 0)
    }
    
    func flee(){
        var _continue = false
        repeat{
            print("""
        You trying to run away from the \(enemy.name), you successfully leave the \(battleField), you should be more prepared next time!.
        
        press [return] to continue.
        """)
            if let input = readLine(), input.isEmpty{
                _continue = true
            }
        }while(!_continue)
    }
    
    
    func checkEnemy(){
        
    }
    
    func enemyTurn(atkMultiplier: Int)-> Bool{
        print("The \(enemy.name) \(enemy.attack) you")
        print("Damage done: \(enemy.atk * atkMultiplier)")
        
        player.hp -= (enemy.atk * atkMultiplier)
        
        if player.hp <= 0{
            print("You're tired and needed rest, go rest permanently in the afterlife")
            return false
        }else if player.hp < player.maxHp/2{
            print("You're hurt, go heal yourself!.")
            return false
        }else{
            print("You still stand Strong")
            return true
        }
    }
    
}
