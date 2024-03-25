//
//  Game.swift
//  AFL2
//
//  Created by RabiRabi Channel on 22/03/24.
//

import Foundation

struct Game{
    
    var player:Player = Player()
    
    func inputCheck()->String{
        
        return ""
    }
    
    func welcomeScreen(){
        var isContinue = false
        repeat{
            print("""
            You are dead 💀
            
            You find yourself in a peculiar situation. Instead of passing on to the afterlife, you've been mysteriously transported to a fantastical realm. Here, you're hailed as a hero summoned by the inhabitants to vanquish the dreaded demon lord. However, there's a catch – much to their dismay, you're anything but powerful. To fulfill your destiny and overcome this mighty foe, you must undergo rigorous training to hone your skills and grow strong enough to face the demon lord head-on.
            
            press [return] to continue:
            """)
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
            """)
            if let input = readLine(), !input.isEmpty && input.allSatisfy({ $0.isLetter }){
                isContinue = true
                player.name = input
            }
        }while !isContinue
        
        print("What a gorgeous name")
        print("Welcome to Blahaj!, \(player.name)")
    }
    
    func journeyScreen(){
        var isQuit = false
        var choice = ""
        repeat{
            switch player.exp{
            case 100..<400:
                print("You're pretty strong now, you can train even faster by hunting some trolls")
            case 400..<800:
                print("You're strong enough to defeat some trolls esily by yourself, you try to hunt some golems to improve faster")
            case 800..<1000:
                print("You're really strong now, you can start your campaign to defeat the demon lord")
            default:
                print("You are really weak, you should practice by hunting some slimes")
            }
            
            print("""
            [C]heck stats and health
            [H]eal wounds with potions
            """)
            switch player.exp{
            case 100..<400:
                print("[F]orest of Trolls")
            case 400..<800:
                print("[M]ountain of Golems")
            case 800..<1000:
                print("[D]efeat the Demon Lord!")
            default:
                print("[S]wamp of Slimes")
            }
            print("""
            [Q]uit
            
            Your Choice ?
            """, terminator: " ")
            if let input = readLine(), !input.isEmpty && input.allSatisfy({ $0.isLetter }){
                choice = input
            }
            
            if choice == "S"{
                swampOfSlimes()
            }else if choice == "C"{
                checkStats()
            }else if choice == "Q"{
                isQuit = true
            }else if choice == "H"{
                healWounds()
            }else if choice == "F" && player.exp > 100{
                forestOfTrolls()
            }else if choice == "M" && player.exp > 400{
                mountainOfGolems()
            }else if choice == "D" && player.exp > 800{
                campaignToDefeatDemonLord()
            }else{
                print("input error")
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
        
    }
    
    private func swampOfSlimes(){
        
    }
    
    private func forestOfTrolls(){
        
    }
    
    private func mountainOfGolems(){
        
    }
    
    private func campaignToDefeatDemonLord(){
        
    }
    
    private func market(){
        
    }
}
