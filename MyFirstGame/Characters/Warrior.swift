//
//  File.swift
//  MyFirstGame
//
//  Created by Anne-Elisabeth on 12/12/2018.
//  Copyright © 2018 Anne-Elisabeth. All rights reserved.
//

import Foundation

class Warrior: Character {
    
    public init(characterName: String) {
        let livesMax = 100
        super.init(name: characterName , lives: livesMax, weapon: Sword())
        self.livesMax = livesMax
    }
}



