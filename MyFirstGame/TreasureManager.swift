//
//  Treasure.swift
//  MyFirstGame
//
//  Created by Anne-Elisabeth on 21/01/2019.
//  Copyright © 2019 Anne-Elisabeth. All rights reserved.
//

import Foundation

class TreasureManager {
    
    // searchTreasure func
    public func searchTreasure(character: Character) {
        
        // random number called between 0 and 100
        let number = Int.random(in: 0 ..< 100)
        
        // if this number is greater than 30, the character doesn't get a treasure so return to Game
        if number > 30 {
            return
        }
        // if not he gets a treasure
        print("\(character.name) found a treasure")
        
        // call of getTreasureWeapon func to define the treasure found by the current character
        let treasure: Weapon = getTreasureWeapon(positiveDamage: character.weapon.damage > 0, number: number)
        
        print("treasure contains \(treasure.name) damage : \(treasure.damage)")
        print("\(character.name) changes his weapon for \(treasure.name)")
        
        // the new treasure weapon is assigned to the character
        character.weapon = treasure
    }
    
    // getTreasureWeapon
    private func getTreasureWeapon(positiveDamage: Bool, number: Int) -> Weapon {
        let treasure: Weapon!
        
        //if the weapon's damage are positive then returns true : application of the conditions contained inside the brackets
        if positiveDamage {
            if number < 2 {
                treasure = GoldenSword()
            } else if number < 5 {
                treasure = Bow()
            } else if number < 15 {
                treasure = Mass()
            } else if number < 20 {
                treasure = Knife()
            } else {
                treasure = Fork()
            }
         //if the weapon's damage are negative then returns false : application of the conditions contained inside the brackets
        } else {
            if number < 3 {
                treasure = GoldenWand()
            } else if number < 15 {
                treasure = Potion()
            } else {
                treasure = BrokenWand()
            }
        }
        return treasure
    }
}

