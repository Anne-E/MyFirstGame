//
//  Weapon.swift
//  MyFirstGame
//
//  Created by Anne-Elisabeth on 22/11/2018.
//  Copyright © 2018 Anne-Elisabeth. All rights reserved.
//

import Foundation

class Weapon {
    public var name: String
    public var damage: Int
    
    public init(name: String, damage: Int) {
        self.name = name
        self.damage = damage
    }
}
