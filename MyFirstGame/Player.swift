//
//  Player.swift
//  MyFirstGame
//
//  Created by Anne-Elisabeth on 22/11/2018.
//  Copyright © 2018 Anne-Elisabeth. All rights reserved.
//

import Foundation

class Player {
    public var name: String
    public var team: [Character] = []
    public var isDead: Bool {
        get {
            for character in team {
                if !character.isDead {
                    return false
                }
            }
            return true
        }
    }
    
    public init(name: String, team:[Character] ) {
        self.name = name
        self.team = team
    }
}
