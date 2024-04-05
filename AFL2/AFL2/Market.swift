//
//  Market.swift
//  AFL2
//
//  Created by RabiRabi Channel on 03/04/24.
//

import Foundation

struct Market{
    
    func market(player: Player){
        var back = false
        repeat{
            var choice = ""
            print("""
            [S]ell
            [B]uy
            
            choose or press [return] to go back?
            """,terminator: " ")
            if let input = readLine(), !input.isEmpty{
                choice = input.uppercased()
            }else{
                back = true
            }
            
            if choice == "B"{
                buy(player: player)
            }else if choice == "S"{
                sell(player: player)
            }
        }while(!back)
    }
    
    private func buy(player: Player){
        var back = false
        repeat{
            var choice = ""
            print("""
            Your Coin: \(player.coin)
            Items:
            [H]ealing Potion - 20 coin
            [M]ana Regen Potion - 20 coin
            [I]ron Sword - 50 coin
            [A]ncient Scroll - 100 coin
            """)
            print("Choose or press [return] to go back?", terminator: " ")
            if let input = readLine(), !input.isEmpty{
                choice = input.uppercased()
            }else{
                back = true
            }
            
            if choice == "H"{
                if player.coin >= 20{
                    print("you bought a Lesser Healing Potion for 20 coins")
                    player.items.append(Heal(name: "Lesser Healing Potion", description: "Recover 50 hp", healthRecovered: 50))
                    player.coin -= 20
                }else{
                    print("not enough coin")
                }
                
            }else if choice == "M"{
                if player.coin >= 20{
                    print("you bought a Lesser Mana Potion for 20 coins")
                    player.items.append(ManaRecovery(manaRecovered: 50, description: "Recover 50 mp", name: "Lesser Mana Potion"))
                    player.coin -= 20
                }else{
                    print("not enough coin")
                }
            }else if choice == "I"{
                if player.coin >= 50{
                    print("you bought an Iron Sword for 50 coins")
                    player.items.append(IronSword())
                    player.coin -= 50
                }else{
                    print("not enough coin")
                }
            }else if choice == "A"{
                if player.coin >= 100{
                    print("you bought a forbidden scroll for 100 coins")
                    player.items.append(AncientScroll(name: "Syams Al Maarif", description: "Ancient scroll that contains forbidden magic"))
                    player.coin -= 100
                }else{
                    print("not enough coin")
                }
            }
        }while(!back)

    }
    
    private func sell(player: Player){
        var back = false
        
        repeat{
            var choice = ""
            let enemyDrops = player.items.compactMap{$0 as? EnemyDrop }
            
            if !enemyDrops.isEmpty{
                for (index,_item) in enemyDrops.enumerated(){
                    print("[\(index+1)]\(_item.name) - \(_item.price) coin")
                }
                print("Choose or press [return] to go back?", terminator: " ")
                if let input = readLine(), !input.isEmpty{
                    choice = input.uppercased()
                }else{
                    back = true
                }
                
                var itemName = ""
                for (index,_item) in enemyDrops.enumerated(){
                    if choice == "\(index+1)"{
                        _item.sell(player: player)
                        itemName = _item.name
                    }
                }
                
                for (index,_item) in player.items.enumerated(){
                    if _item.name == itemName{
                        player.items.remove(at: index)
                        break
                    }
                }
            }else{
                print("You Don't Have anything to sell")
                break
            }
            
        }while(!back)

    }
}
