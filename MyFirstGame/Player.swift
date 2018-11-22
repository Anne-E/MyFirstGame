//
//  Player.swift
//  MyFirstGame
//
//  Created by Anne-Elisabeth on 22/11/2018.
//  Copyright © 2018 Anne-Elisabeth. All rights reserved.
//

import Foundation

class Player {
    var name: String?
    var team: [Character] = []
    
    init(name: String, team:[Character] ) {
        self.name = name
        self.team = team
    }
}
