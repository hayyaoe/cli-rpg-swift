//
//  Game.swift
//  AFL2
//
//  Created by RabiRabi Channel on 22/03/24.
//

import Foundation

struct Game{
    
    var player:Player = Player()

    func welcomeScreen(){
        var isContinue = false
        repeat{
            print("""
            You are dead 💀
            
            You find yourself in a peculiar situation. Instead of passing on to the afterlife, you've been mysteriously transported to a fantastical realm. Here, you're hailed as a hero summoned by the inhabitants to vanquish the dreaded demon lord. However, there's a catch – much to their dismay, you're anything but powerful. To fulfill your destiny and overcome this mighty foe, you must undergo rigorous training to hone your skills and grow strong enough to face the demon lord head-on.
            
            press [return] to continue:
            """, terminator: " ")
            if let input = readLine(), input.isEmpty {
                isContinue = true
            }
        }while !isContinue
    }
    
    func welcomingScreen(){
        var isContinue = false
        repeat{
            print("""
            
            'the people of this realm wants to know your name, hero'
            the name is
            """, terminator: " ")
            if let input = readLine(), !input.isEmpty && input.allSatisfy({ $0.isLetter }){
                isContinue = true
                player.name = input
            }
        }while !isContinue
        
        sleep(1)
        
        print("\nWhat a gorgeous name\n")
        sleep(1)
        print("Welcome to Blahaj!, \(player.name)\n")
        sleep(1)
    }
    
    func journeyScreen(){
        var isQuit = false
        var choice = ""
        repeat{
            player.levelUp()
            choice = ""
            switch player.level{
            case 4..<6:
                print("You're pretty strong now, you can train even faster by hunting some trolls")
            case 6..<8:
                print("You're strong enough to defeat some trolls esily by yourself, you try to hunt some golems to improve faster")
            case 8...:
                print("You're really strong now, you can start your campaign to defeat the demon lord")
            default:
                print("You are really weak, you should practice by hunting some slimes")
            }
            
            print("""
            
            What do you want to do?
            [C]heck stats and health
            [H]eal wounds with potions
            [I]nventory
            [P]asar
            [O]nsen
            """)
            print("[S]wamp of Slimes")
            if player.level>3{
                print("[F]orest of Trolls")
            }
            if player.level>5{
                print("[M]ountain of Golems")
            }
            if player.level>7{
                print("[D]efeat the Demon Lord!")
            }
            print("""
            [Q]uit
            
            Your Choice ?
            """, terminator: " ")
            if let input = readLine(), !input.isEmpty && input.allSatisfy({ $0.isLetter }){
                choice = input.uppercased(with: .autoupdatingCurrent)
            }
            
            if choice == "S"{
                swampOfSlimes()
            }else if choice == "C"{
                checkStats()
            }else if choice == "O"{
                onsen()
            }else if choice == "P"{
                market()
            }else if choice == "I"{
                inventory()
            }else if choice == "Q"{
                isQuit = true
            }else if choice == "H"{
                healWounds()
            }else if choice == "F" && player.level > 3{
                forestOfTrolls()
            }else if choice == "M" && player.exp > 5{
                mountainOfGolems()
            }else if choice == "D" && player.exp > 7{
                isQuit = campaignToDefeatDemonLord()
            }else{
                print("input error")
            }
            
            if player.hp <= 0{
                isQuit = true
                print("Game Over!")
            }
        }while !isQuit
    }
    
    private func checkStats(){
        var isGoBack = false
        repeat{
            player.stats()
            print("\npress [return] to go back:")
            if let input = readLine(), input.isEmpty {
                isGoBack = true
            }
        }while !isGoBack
    }
    
    private func healWounds(){
        player.healWounds()
    }
    
    private func swampOfSlimes(){
        var enemies: [Enemy] = []
        let numOfEnemy = Int.random(in: 1...4)
        for index in 1...numOfEnemy{
            enemies.append(Slime(name: "Slime \(index)"))
        }
        var battle = Battle(battleField: "Swamp of Slimes", player: player, enemies: enemies,selectedEnemy: Slime())
        battle.intro(message: "You go to the swamp of slimes and fight some slimes here.")
        battle.fight()
    }
    
    private func forestOfTrolls(){
        var enemies: [Enemy] = []
        let numOfEnemy = Int.random(in: 1...3)
        for index in 1...numOfEnemy{
            enemies.append(Troll(name: "Troll \(index)"))
        }
        var battle = Battle(battleField: "Forest of Trolls", player: player, enemies: enemies,selectedEnemy: Troll())
        battle.intro(message: "You go to the forest of trolls and fight some trolls here.")
        battle.fight()
    }
    
    private func mountainOfGolems(){
        var enemies: [Enemy] = []
        let numOfEnemy = Int.random(in: 1...2)
        for index in 1...numOfEnemy{
            enemies.append(Golem(name: "Golem \(index)"))
        }
        var battle = Battle(battleField: "Mountain of Golems", player: player, enemies: enemies,selectedEnemy: Golem())
        battle.intro(message: "You go to the mountain of golems and fight some golems here.")
        battle.fight()
    }
    
    private func campaignToDefeatDemonLord()-> Bool{
        print("you embark your journey to defeat the demon lord alone.")
        sleep(2)
        print("you went to a dark forest.")
        sleep(2)
        var enemies = createRandomEnemies(numOfEnemies: 3)
        var battle = Battle(battleField: "Dark Forest", player: player, enemies: enemies, selectedEnemy: enemies[0])
        battle.intro(message: "You stuble uppon some foes, you better defeat them!")
        battle.fight()
        if player.hp <= 0{
            print("You are really weak and helpless that you could even finish your duty as the hero of this world.")
            sleep(2)
            return true
        }
        
        print("you continue your journey to the place called The Gate of Hell.")
        sleep(2)
        print("this place emits a manacing aura from the being living here.")
        sleep(2)
        enemies = createRandomEnemies(numOfEnemies: 5)
        battle = Battle(battleField: "Gate of Hell", player: player, enemies: enemies, selectedEnemy: enemies[0])
        battle.intro(message: "You are being blocked by the inhabitants of this place.")
        battle.fight()
        if player.hp <= 0{
            return true
        }
        
        print("you continue your journey to the place called Hells Gate.")
        sleep(2)
        print("this place emits a manacing aura from the being living here.")
        sleep(2)
        battle = Battle(battleField: "Demon Lord's Castle", player: player, enemies: [DemonLord()], selectedEnemy: DemonLord())
        battle.intro(message: "You stuble uppon some foes, you better defeat them!")
        battle.fight()
        if player.hp <= 0{
            return true
        }
        
        return true
    }
    
    private func market(){
        let market=Market()
        market.market(player: player)
    }
    
    private func inventory(){
        player.inventory()
    }
    
    private func onsen(){
        print("you went to the onsen, to recover your body")
        sleep(2)
        print("you feel a bit better.")
        sleep(2)
        let hpRecovered = Double (player.maxHp) * 0.1
        let mpRecovered = Double (player.maxMp) * 0.1
        player.hp += Int (hpRecovered)
        if player.hp > player.maxHp{
            player.hp = player.maxHp
        }
        
        player.mp += Int (mpRecovered)
        if player.mp > player.maxMp{
            player.mp = player.maxMp
        }
        print("\(Int(hpRecovered))hp recovered")
        print("\(Int(mpRecovered))mp recovered")
    }
    
    private func createRandomEnemies(numOfEnemies: Int) -> [Enemy] {
        var enemies: [Enemy] = []
        let numOfEnemies = Int.random(in: 1...numOfEnemies)
        
        for index in 1...numOfEnemies {
            let enemyType = Int.random(in: 1...3)
            
            switch enemyType {
            case 1:
                enemies.append(Slime(name: "Slime \(index)"))
            case 2:
                enemies.append(Troll(name: "Troll \(index)"))
            case 3:
                enemies.append(Golem(name: "Golem \(index)"))
            default:
                break
            }
        }
        
        return enemies
    }
}
