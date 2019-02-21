//
//  Treasure.swift
//  MyFirstGame
//
//  Created by Anne-Elisabeth on 21/01/2019.
//  Copyright © 2019 Anne-Elisabeth. All rights reserved.
//

import Foundation

class TreasureManager {
    
    // array of weapons meant for attacking that the character might find
    lazy private var weaponsDamageTreasure: [Weapon] = [
        Weapon(name: "fork", damage: 2),
        Weapon(name: "knife", damage: 25),
        Weapon(name: "mass", damage: 40),
        Weapon(name: "bow", damage: 50),
        Weapon(name: "golden sword", damage: 100)
    ]
    
    // array of "weapons" meant for healing that the character might find
    lazy private var weaponsHealTreasure: [Weapon] = [
        Weapon(name: "broken wand", damage: -2),
        Weapon(name: "potion", damage: -40),
        Weapon(name: "silver wand", damage: -50),
        Weapon(name: "golden wand", damage: -100)
    ]
    
    // searchTreasure func
    public func searchTreasure(character: Character) {
        
        // random number called between 0 and 100
        let number = Int.random(in: 0 ..< 100)
        
        // if this number is greater than 30, the character doesn't get a treasure so return
        if number > 30 {
            return
        }
        // if not he gets a treasure
        print("\(character.name) found a treasure")
        
        let treasure: Weapon!
        // if the chosen character is an attackant, choose randomly a weapon in the corresponding array
        if character.weapon.damage > 0 {
            treasure = weaponsDamageTreasure.randomElement()
        } else {
            // if the character is a healer, choose randomly a healing element in the corresponding array
            treasure = weaponsHealTreasure.randomElement()
        }
        print("treasure contains \(treasure.name) damage : \(treasure.damage)")
        print("\(character.name) changes his weapon for \(treasure.name)")
        // the new treasure weapon is assigned to the character
        character.weapon = treasure
    }
    
}
