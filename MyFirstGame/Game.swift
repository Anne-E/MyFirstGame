//
//  Game.swift
//  MyFirstGame
//
//  Created by Anne-Elisabeth on 06/11/2018.
//  Copyright © 2018 Anne-Elisabeth. All rights reserved.
//

import Foundation

class Game {
    var player1: Player!
    var player2: Player!
    
    func startGame() {
        print("Welcome to my First Game!")
        
        let playerName: String = choosePlayerName(playerNumber: 1)
        let playerTeam: [Character] = chooseTeam()
        player1 = Player(name: playerName, team: playerTeam)
        
    }
    
    func choosePlayerName(playerNumber: Int) -> String{
        print("Player \(playerNumber), what is your name?")
        if let playerName = readLine() {
            print("Welcome \(playerName)")
            return playerName
        }
        return ""
    }
    
    func chooseCharacterName(characterNumber: Int) -> String{
        print("Player, what is the name of your character \(characterNumber)?")
        if let characterName = readLine() {
           return characterName
        }
        return ""
    }
    
    func chooseTeam() -> [Character]{
        var team: [Character] = []
        
        var characterName: String!
        var character: Character!
        
        let weapon: Weapon = Weapon(name: "sword", damage: 10)
    
        var characterNumber = 1
        while (characterNumber != 4) {
            characterName = chooseCharacterName(characterNumber: characterNumber)
            character = Character(name: characterName, lives: 100, weapon: weapon)
            team.append(character)
            characterNumber = characterNumber + 1
        }
        
        
        
       
        return team
    }

}


