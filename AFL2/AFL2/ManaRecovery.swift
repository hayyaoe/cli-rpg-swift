//
//  ManaRecovery.swift
//  AFL2
//
//  Created by RabiRabi Channel on 23/03/24.
//

import Foundation

class ManaRecovery:Item{
    let manaRecovered: Int
    
    init(manaRecovered: Int, description: String, name: String) {
        self.manaRecovered = manaRecovered
        super.init(description: description, name: name)
    }
    
    override func use(){
        
    }
}
