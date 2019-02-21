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
    
    // called after lives change (reset if lives is greater than livesMax)
    public var lives: Int {
        didSet {
             if lives > livesMax {
                lives = livesMax
            }
        }
    }
    
    public var weapon: Weapon
    
    // Bool to check if one of the characters is dead or not
    public var isDead: Bool {
        get {
            if lives <= 0 {
                return true
            }
            return false
        }
    }
    
    // to create a character (a constructor)
    public init(name: String, lives: Int, weapon: Weapon) {
        self.name = name
        self.lives = lives
        self.weapon = weapon
        self.livesMax = 100
    }
   
    // attack function taking as a parameter the victim character and applying to the victim's life the weapon's damage of the current attacker
    public func attackOrHeal(victim: Character){
        victim.lives -= self.weapon.damage
    }
    
    
    // implementation of the hashable protocol
    static func == (lhs: Character, rhs: Character) -> Bool {
        return lhs.name == rhs.name
    }
    
    //
    func hash(into hasher: inout Hasher) {
        hasher.combine(self.name)
    }
}

