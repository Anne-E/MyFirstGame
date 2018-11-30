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
    // propriété de la classe game : variable player1 + 2 de type Player (! = sans valeur  pour le moment)
    var player1: Player!
    var player2: Player!
    
    // Methode startGame
    func startGame() {
        print("Welcome to my First Game!")
        
        // constante playerName de type String à laquelle on assigne la valeur de retour de la méthode choosePlayerName
        let playerName: String = choosePlayerName(playerNumber: 1)
        // constante playerTeam de type tableau de Character à laquelle on assigne la valeur de retour de la méthode chooseTeam
        let playerTeam: [Character] = chooseTeam()
        // création d'une instance de Player que l'on assigne à la propriété player1
        player1 = Player(name: playerName, team: playerTeam)
        
    }
    
    // methode choosePlayerName qui prend comme paramètre playerNumber de type Int et qui retourne un String
    func choosePlayerName(playerNumber: Int) -> String{
        print("Player \(playerNumber), what is your name?")
        //appel de la fonction readLine, si readLine renvoie une valeur qui n'est pas nil alors elle assigne à la constante playerName et on effectue les actions à l'intérieur des accolades
        if let playerName = readLine() {
            print("Welcome \(playerName)")
            return playerName
        }
        // si readLinea renvoyé une valeur nil nous n'avons pas pu récupérer le nom du joueur alors la méthode renvoie une String vide.
        return ""
    }
    
    // methode chooseCharacterName qui prend comme paramètre charachterNumber de type Int et qui retourne un String
    func chooseCharacterName(characterNumber: Int) -> String{
        print("Player, what is the name of your character \(characterNumber)?")
        //appel de la fonction readLine, si readLine renvoie une valeur qui n'est pas nil alors elle assigne à la constante characterName et on effectue les actions à l'intérieur des accolades
        if let characterName = readLine() {
           return characterName
        }
        // si readLinea renvoyé une valeur nil nous n'avons pas pu récupérer le nom du personnage alors la méthode renvoie une String vide.
        return ""
    }
    
    // methode chooseTeam qui ne prend pas de paramètres () renvoie un tableau de personnages
    func chooseTeam() -> [Character]{
        
        // création de variable team de type tableau de character à qui on assigne la valeur "tableau vide"
        var team: [Character] = []
        // variable characterName de type String pour l'instant sans valeur
        var characterName: String!
        // variable character de type Character pour l'instant sans valeur
        var character: Character!
        
        // constante (pour l'instant même arme à tous les personnages, à changer) weapon de type Weapon à laquelle on assigne une instance de type Weapon avec comme valeur les propriétés name et damage
        let weapon: Weapon = Weapon(name: "sword", damage: 10)
    
        var number = 1
        while (number != 4) {
            // on assigne à la variable characterName la valeur de retour de la méthode chooseCharacterName qui prend en paramètre characterNumber
            characterName = chooseCharacterName(characterNumber: number)
            // on assigne à la variable character une instance de classe character à laquelle on assigne les propriétés name, lives et weapon
            character = Character(name: characterName, lives: 100, weapon: weapon)
            // ajout dans le tableau team du "character" créé au-dessus
            team.append(character)
            // on assigne à la variable number la valeur number +1
            number = number + 1
        }
        // retourne la valeur contenue dans la variable équipe de type tableau de personnages.
        return team
    }

}


