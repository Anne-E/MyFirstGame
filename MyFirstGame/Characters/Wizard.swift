//
//  Wizard.swift
//  MyFirstGame
//
//  Created by Anne-Elisabeth on 12/12/2018.
//  Copyright © 2018 Anne-Elisabeth. All rights reserved.
//

import Foundation

class Wizard: Character {
    public init(characterName: String) {
        super.init(name: characterName, lives: 150, weapon: Wand())
    }
}
