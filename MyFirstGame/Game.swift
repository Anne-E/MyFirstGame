//
//  Game.swift
//  MyFirstGame
//
//  Created by Anne-Elisabeth on 06/11/2018.
//  Copyright © 2018 Anne-Elisabeth. All rights reserved.
//

import Foundation
class Game {
    var player1: Player = Player()
    var player2: Player = Player()
    
    func startGame() {
        print("Welcome to my First Game!")
        
        player1.choosePlayerName(playerNumber: 1)
        player1.chooseTeam()
        player2.choosePlayerName(playerNumber: 2)
        player2.chooseTeam()
        
        
    }

}

class Player {
    var name: String?
    var team: [Character] = []
    
    func choosePlayerName(playerNumber: Int){
        print("Player \(playerNumber), what is your name?")
        if let playerName = readLine() {
            print("Welcome \(playerName)")
            name = playerName
        }
    }
    
    func chooseTeam(){
        var character1: Character = Character()
        var character2: Character = Character()
        var character3: Character = Character()
        
        if let name = name {
            character1.chooseCharacterName(characterNumber: 1, playerName: name)
            character2.chooseCharacterName(characterNumber: 2, playerName: name)
            character3.chooseCharacterName(characterNumber: 3, playerName: name)
        }
        }
}
    

class Character {
    var name: String?
    var lives: Int?
    var weapon: Weapon?
    
    func chooseCharacterName(characterNumber: Int, playerName: String){
        print("Player \(playerName), what is the name of your character \(characterNumber)?")
        if let characterName = readLine() {
            name = characterName
        }
    }
}

class Weapon {
    var name: String?
    var damage: Int?
}
