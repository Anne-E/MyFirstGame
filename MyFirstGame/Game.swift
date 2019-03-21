//
//  Game.swift
//  MyFirstGame
//
//  Created by Anne-Elisabeth on 06/11/2018.
//  Copyright © 2018 Anne-Elisabeth. All rights reserved.
//

import Foundation

// class Game declaration
class Game {
    // properties assigned
    private var player1: Player!
    private var player2: Player!
    private var nameManager = NameManager()
    private var treasureManager = TreasureManager()
    private var statisticsManager = StatisticsManager()
    private var player1Turn = Bool.random()
    
    // startGame method that includes setUpGame func + runGame func
    public func startGame() {
        print("Welcome to my First Game!")
        setupGame()
        print("Let the game begin!")
        runGame()
    }
    
    // setupGame Method (to set up the 2 players)
    private func setupGame() {
        
        // instance of Player assigned to player1 property
        player1 = setupPlayer(playerNumber: 1)
        
        // instance of Player assigned to player2 property
        player2 = setupPlayer(playerNumber: 2)
    }
    
    
    // setupPlayer method : to choose the playerName + the playerTeam
    private func setupPlayer(playerNumber: Int) -> Player {
        // playerName variable (String) that returns choosePlayerName method
        let playerName: String = choosePlayerName(playerNumber: playerNumber)
        // playerTeam variable (characters array) that returns chooseTeam method
        let playerTeam: [Character] = chooseTeam(playerName: playerName)
        
        return Player(name: playerName, team: playerTeam)
    }
    
    
    // runGame Method
    private func runGame() {
        // variable currentPlayer
        var currentPlayer: Player!
        // while loop : the game goes on as long as none of the players die
        while !player1.isDead && !player2.isDead {
            // actifPlayer func called that returns currentPlayer
            currentPlayer = actifPlayer()
            // printGame func called to display the current state of the game
            printGame()
            print("\(currentPlayer.name) it's your turn")
            // playerAction func called to perform the action decided by the player
            playerAction(playingPlayer: currentPlayer)
        }
        // if player1 is dead congratulation to player2 else congratulation to player1
        if player1.isDead {
            print("Congratulation \(player2.name) you win !!")
        } else {
            print("Congratulation \(player1.name) you win !!")
        }        
        statisticsManager.printStatistics()
    }
    
    
    // PlayerAction Method
    private func playerAction(playingPlayer: Player){
        // the player chooses a character (chooseCharacterUse called)
        print("Which character do you want to use?")
        let attacker = chooseCharacterUse(player: playingPlayer)
        
        // searchTreasure called to determine if the character found a treasure
        treasureManager.searchTreasure(character: attacker)
        
        let playerVictim: Player!
        
        //the non playing player is the victim
        if player1.name == playingPlayer.name {
            playerVictim = player2
        } else {
            playerVictim = player1
        }
        
        let victimChosen: Character!
        
        // if the character is not the healer (wizard)
        if attacker.weapon.damage > 0 {
            // the player chooses a character to attack in the opposing team
            print("which character do you want to attack?")
            victimChosen = chooseCharacterUse(player: playerVictim)
        } else {
            // if the chosen character is the healer, the player chooses a character in his/her own team to heal
            print("which character do you want to heal?")
            victimChosen = chooseCharacterUse(player: playingPlayer)
        }
        
        // attacking or healing action called
        attacker.attackOrHeal(victim: victimChosen)
        
        // statisticsManager.updateStatistics called
        statisticsManager.updateStatistics(attackerPlayer: playingPlayer, attacker: attacker,
                                           defenderPlayer: playerVictim, defender: victimChosen)
    }
    
    
    // chooseCharacterUse Method
    private func chooseCharacterUse(player: Player) -> Character {
        // the player needs to type the name of the chosen character
        let characterName = getLine()
        // if the name is in the team array
        for character in player.team {
            if characterName == character.name {
                // return the character
                if character.isDead {
                    print("The character chosen is dead. Please choose another one.")
                    return chooseCharacterUse(player:player)
                }
                return character
            }
        }
        // if not try again
        print("Character not found. Please try again.")
        return chooseCharacterUse(player:player)
    }
    
    
    // printGame Method
    private func printGame() {
        // function to display infos of both players/teams
        let players: [Player] = [player1, player2]
        for player in players {
            print("------------ \(player.name) ------------")
            print("- Name -------- Lives ----- damage")
            print("---------------------------------- ")
            for character in player.team {
                if !character.isDead {
                    print("-\(character.name)\t\t\t\(character.lives)\t\t\(character.weapon.damage)")
                }
            }
        }
    }
    
    
    // actifPlayer Method
    private func actifPlayer() -> Player {
        // return the actifPlayer
       
        // inverse the value of the player1turn boolean
        player1Turn = !player1Turn
        
        
        if player1Turn {
            return player1
        } else {
            return player2
        }
    }
    
    
    // getLine Method
    private func getLine() -> String {
        //  calls readLine to get a user keyboard input
        if let choice = readLine() {
            // if it is not nil then return
            return choice
        } else {
            // else try again
            print("wrong choice, start again")
            return getLine()
        }
    }
    
    
    // chooseplayerName Method
    private func choosePlayerName(playerNumber: Int) -> String {
        print("Player \(playerNumber), what is your name?")
        //getLine func called. If getLine returns a value (not nil) then assigned to playerName variable and the actions between the brackets are performed
        let playerName = getLine()
        // if the player choses a name already used by the player1 : return choosePlayerName
        if !nameManager.isValid(name: playerName) {
            print("Your name was already taken by Player 1. Please choose another one")
            return choosePlayerName(playerNumber:playerNumber)
        }
        
        print("Welcome \(playerName)")
        return playerName
    }
    
    
    // chooseCharacterName Method
    private func chooseCharacterName(characterNumber: Int, playerName: String) -> String {
        print("\(playerName), what is the name of your character \(characterNumber)?")
        //readLine func called. If readLine returns a value (not nil) then assigned to playerName variable and the actions between the brackets are performed
        let characterName = getLine()
        if !nameManager.isValid(name: characterName) {
            print("Your character name was already taken. Please choose another one")
            return chooseCharacterName(characterNumber: characterNumber, playerName: playerName)
        }
        return characterName
    }
    
    
    // createCharacter Method (paramater = characterName)
    private func createCharacter(characterName: String) -> Character {
        print("Choose the character's type for \(characterName). \n You can choose between those different types : warrior, wizard, dwarf and giant.")
        // Player has to choose which type of character he/she wants to use for the characterName
        let characterType = getLine()
        // character created (corresponds to the chosen type)
        if characterType == "warrior" {
            return Warrior(characterName: characterName)
        } else if characterType == "wizard" {
            return Wizard(characterName: characterName)
        } else if characterType == "dwarf" {
            return Dwarf(characterName: characterName)
        } else if characterType == "giant" {
            return Giant(characterName: characterName)
        } else {
            // if the type chosen returned doesn't exist return createCharacter
            print("The type entered is not a valid one. Please try again.")
            return createCharacter(characterName:characterName)
        }
    }
    
    
    // chooseTeam Method returns array of characters
    private func chooseTeam(playerName: String) -> [Character] {
        
        var team: [Character] = []
        var characterName: String!
        var character: Character!
        
        var number = 1
        //While Loop to limit the number of character chosen to 3 + added the team array
        while (number != 4) {
            characterName = chooseCharacterName(characterNumber: number, playerName: playerName)
            character = createCharacter(characterName: characterName)
            team.append(character)
            number = number + 1
        }
    
        return team
    }
    
}
