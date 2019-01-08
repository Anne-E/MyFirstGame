//
//  Game.swift
//  MyFirstGame
//
//  Created by Anne-Elisabeth on 06/11/2018.
//  Copyright © 2018 Anne-Elisabeth. All rights reserved.
//

import Foundation

// creation de la classe Game
class Game {
    // propriété de la classe game : variable player1 + 2 de type Player (! = sans valeur  pour le moment) + Variable nameManager de type NameManager (classe crée)
    private var player1: Player!
    private var player2: Player!
    private var nameManager = NameManager()
    private var player1Turn = Bool.random()
    
    // Methode startGame qui comprend fonction setupGame + runGame
    public func startGame() {
        print("Welcome to my First Game!")
        setupGame()
        print("Let the game begin!")
        runGame()
    }
    
    // fonction qui met en place les 2 joueurs
    private func setupGame() {
        
        // création d'une instance de Player que l'on assigne à la propriété player1
        player1 = setupPlayer(playerNumber: 1)
        
        // création d'une instance de Player que l'on assigne à la propriété player2
        player2 = setupPlayer(playerNumber: 2)
    }
    
    // fonction setupPlayer : choix du nom du joueur + de l'équipe
    private func setupPlayer(playerNumber: Int) -> Player {
        // variable playerName de type String à laquelle on assigne la valeur de retour de la méthode choosePlayerName
        let playerName: String = choosePlayerName(playerNumber: playerNumber)
        // variable playerTeam de type tableau de Character à laquelle on assigne la valeur de retour de la méthode chooseTeam
        let playerTeam: [Character] = chooseTeam(playerNumber: playerNumber)
        
        return Player(name: playerName, team: playerTeam)
    }
    
    // fonction runGame
    private func runGame() {
        // variable playingPlayer de type Player
        var playingPlayer: Player!
        // boucle while tant qu'aucun des 2 joueurs n'est mort le jeu continue (en cours de développement)
        while !player1.isDead && !player2.isDead {
            playingPlayer = actifPlayer()
            printGame()
            print("\(playingPlayer.name) it's your turn")
            print("Which character do you want to use?")
            var characterName = getLine() 

        }
    }
    
    private func printGame() {
        print("---------- \(player1.name) ---------- ")
        for character in player1.team {
            print("-\(character.name)\t\(character.lives)\t\(character.weapon.damage)")
        }
        print("---------- \(player2.name) ---------- ")
        for character in player2.team {
            print("-\(character.name)\t\(character.lives)\t\(character.weapon.damage)")
        }

    }
    
    private func actifPlayer() -> Player {
        player1Turn = !player1Turn
        if player1Turn {
            return player1
        } else {
            return player2
        }
    }
    
    
    private func getLine() -> String {
        if let choice = readLine() {
            return choice
            
        } else {
                print("wrong choice, start again")
                return getLine()
        }
    }
    
    
    // methode choosePlayerName qui prend comme paramètre playerNumber de type Int et qui retourne un String
    private func choosePlayerName(playerNumber: Int) -> String{
        print("Player \(playerNumber), what is your name?")
        //appel de la fonction readLine, si readLine renvoie une valeur qui n'est pas nil alors elle assigne à la variable playerName et on effectue les actions à l'intérieur des accolades
        let playerName = getLine()
        // si le joueur 1 a déjà choisi le nom renvoyé par la focntion chooseName du player 2 alors on redemande un nom différent au player 2
        if !nameManager.isValid(name: playerName) {
                print("Your name was already taken by Player 1. Please choose another one")
                return choosePlayerName(playerNumber:playerNumber)
        }
        
        print("Welcome \(playerName)")
        return playerName
    }
    
    
    
    // methode chooseCharacterName qui prend comme paramètre charachterNumber de type Int et qui retourne un String
    private func chooseCharacterName(characterNumber: Int) -> String{
        print("Player, what is the name of your character \(characterNumber)?")
        //appel de la fonction readLine, si readLine renvoie une valeur qui n'est pas nil alors elle est assignée à la constante characterName et on effectue les actions à l'intérieur des accolades
        let characterName = getLine()
        if !nameManager.isValid(name: characterName) {
            print("Your character name was already taken. Please choose another one")
            return chooseCharacterName(characterNumber: characterNumber)
        }
        return characterName
    }
    
    private func createCharacter(characterName: String) -> Character {
        print("Choose the character's type for \(characterName). \n You can choose between those different types : warrior, wizard, dwarf and giant.")
        let characterType = getLine()
        if characterType == "warrior" {
            return Warrior(characterName: characterName)
        } else if characterType == "wizard" {
            return Wizard(characterName: characterName)
        } else if characterType == "dwarf" {
            return Dwarf(characterName: characterName)
        } else if characterType == "giant" {
            return Giant(characterName: characterName)
        } else {
            print("The type entered is not valid one. Please try again.")
            return createCharacter(characterName:characterName)
        }
        
    }
    
    // methode chooseTeam qui ne prend pas de paramètres () renvoie un tableau de personnages
    private func chooseTeam(playerNumber: Int) -> [Character]{
        
        // création de la variable team de type tableau de character à qui on assigne la valeur "tableau vide"
        var team: [Character] = []
        // variable characterName de type String pour l'instant sans valeur
        var characterName: String!
        // variable character de type Character pour l'instant sans valeur
        var character: Character!

        var number = 1
        while (number != 4) {
            // on assigne à la variable characterName la valeur de retour de la méthode chooseCharacterName qui prend en paramètre characterNumber
            characterName = chooseCharacterName(characterNumber: number)
            // on assigne à la variable character une instance de classe character à laquelle on assigne les propriétés name, lives et weapon
            character = createCharacter(characterName: characterName)
            // ajout dans le tableau team du "character" créé au-dessus
            team.append(character)
            // on assigne à la variable number la valeur number +1
            number = number + 1
        }
        // retourne la valeur contenue dans la variable équipe de type tableau de personnages.
        return team
    }

}


