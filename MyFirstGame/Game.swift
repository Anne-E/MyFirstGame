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
    private var nameManager: NameManager = NameManager()
    
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
        
        // création d'une instance de Player que l'on assigne à la propriété player1
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
        //utilisation de la fonction random pour décider de manière aléatoire qui commence
        var player1Turn = Bool.random()
        // variable playingPlayer de type Player
        var playingPlayer: Player!
        // boucle while tant qu'aucun des 2 joeurzs n'est mort le jeu continue (en cours de développement)
        while !player1.isDead && !player2.isDead {
            if player1Turn {
                playingPlayer = player1
            } else {
                playingPlayer = player2
            }
            print("\(playingPlayer.name) it's your turn")
            // inversion du Bool player1Turn pour alterner le tour de jeu du joueur
            player1Turn = !player1Turn
        }
    }
    
    
    private func choose() -> String {
        if let choice = readLine() {
            return choice
            
        } else {
                print("wrong choice, start again")
                return choose()
        }
    }
    
    
    // methode choosePlayerName qui prend comme paramètre playerNumber de type Int et qui retourne un String
    private func choosePlayerName(playerNumber: Int) -> String{
        print("Player \(playerNumber), what is your name?")
        //appel de la fonction readLine, si readLine renvoie une valeur qui n'est pas nil alors elle assigne à la variable playerName et on effectue les actions à l'intérieur des accolades
        let playerName = choose()
        // si le joueur 1 a déjà choisi le nom renvoyé par la focntion chooseName du player 2 alors on redemande un nom différent au player 2
        if playerNumber == 2 && player1.name == playerName {
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
        let characterName = choose()
        if !nameManager.isValid(name: characterName) {
            print("Your character name was already taken. Please choose another one")
            return chooseCharacterName(characterNumber: characterNumber)
        }
        return characterName
    }
    
    private func createCharacter(characterName: String) -> Character {
        print("Choose the character's type for \(characterName). \n You can choose between those different types : warrior, wizard, dwarf and giant.")
        let characterType = choose()
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


