//
//  Character.swift
//  MyFirstGame
//
//  Created by Anne-Elisabeth on 22/11/2018.
//  Copyright © 2018 Anne-Elisabeth. All rights reserved.
//

import Foundation

class Character {
    var name: String
    var lives: Int
    var weapon: Weapon
    
    init(name: String, lives: Int, weapon: Weapon) {
        self.name = name
        self.lives = lives
        self.weapon = weapon
    }
   
}
