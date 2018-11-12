//
//  Game.swift
//  MyFirstGame
//
//  Created by Anne-Elisabeth on 06/11/2018.
//  Copyright © 2018 Anne-Elisabeth. All rights reserved.
//

import Foundation

func startGame () {
    print("Welcome to my First Game!")
    
    print("Player 1, what is your name?")
    var player1Name: String = ""
    player1Name = readLine()!
   print("Welcome \(player1Name)")
    
    print("Player 2, what is your name?")
    var player2Name: String = ""
    player2Name = readLine()!
    print("Welcome \(player2Name)")
}
