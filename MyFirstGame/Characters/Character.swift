//
//  Character.swift
//  MyFirstGame
//
//  Created by Anne-Elisabeth on 22/11/2018.
//  Copyright © 2018 Anne-Elisabeth. All rights reserved.
//

import Foundation

class Character: Hashable {
    
    public var name: String
    public var livesMax: Int
    
    public var lives: Int {
        didSet {
             if lives > livesMax {
                lives = livesMax
            }
        }
    }
    
    public var weapon: Weapon
    public var isDead: Bool {
        get {
            if lives <= 0 {
                return true
            }
            return false
        }
    }
    
    public init(name: String, lives: Int, weapon: Weapon) {
        self.name = name
        self.lives = lives
        self.weapon = weapon
        self.livesMax = 100
    }
   
    // création fonction attack qui prend comme paramètre victime de type Character 
    public func attack(victim: Character){
        victim.lives -= self.weapon.damage
    }
    
    static func == (lhs: Character, rhs: Character) -> Bool {
        return lhs.name == rhs.name
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(self.name)
    }
}

