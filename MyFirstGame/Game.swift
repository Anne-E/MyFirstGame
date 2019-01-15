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
        let playerTeam: [Character] = chooseTeam(playerName: playerName)
        
        return Player(name: playerName, team: playerTeam)
    }
    
    // fonction runGame
    private func runGame() {
        // variable playingPlayer de type Player
        var playingPlayer: Player!
        // boucle while tant qu'aucun des 2 joueurs n'est mort le jeu continue
        while !player1.isDead && !player2.isDead {
            // On appel la fonction actifPlayer qui va renvoyer le playingPlayer
            playingPlayer = actifPlayer()
            // on appel la fonction printGame qui affiche l'etat courant du jeu
            printGame()
            print("\(playingPlayer.name) it's your turn")
            // on appel la fonction PlayerAction qui va effectuer l'action souhaité par le joueur
            playerAction(player: playingPlayer)
        }
        // si le player 1 est mort on félicite le player 2 sinon c'est le contraire
        if player1.isDead {
            print("Congratulation \(player2.name) you win !!")
        } else {
            print("Congratulation \(player1.name) you win !!")
        }
    }
    
    // Fonction PlayerAction
    private func playerAction(player: Player){
        // On demande au joueur de choisir un personnage en appelant chooseCaracterUser
        print("Which character do you want to use?")
        let attacker = chooseCharacterUse(player: player)
        
        // On appel searchTreasure pour voir si le personnage a trouvé un trésor
        searchTreasure(character: attacker)
        
        let playerVictim: Player!
        
        //On récupére le joueur qui n'est pas en train de jouer
        if self.player1.name == player.name {
            playerVictim = self.player2
        } else {
            playerVictim = self.player1
        }
        
        let victim: Character!
        
        // On regarde si le personnage choisie n'est pas un soigneur
        if attacker.weapon.damage > 0 {
            // On demande au joueur de choisir un personnage dans l'équipe adverse
            print("which character do you want to attack?")
            victim = chooseCharacterUse(player: playerVictim)
        } else {
            // On demande au joueur de choisir un personnage de son équipe
            print("which character do you want to heal")
            victim = chooseCharacterUse(player: player)
        }
        
        // on lance l'action d'attaque ou de soin avec les personnages choisies
        attacker.attack(victim: victim)
    }
    
    private func searchTreasure(character: Character) {
        // Tableau d'arme de type attaque qu'un personnage peux trouver
        let weaponsDamageTreasure: [Weapon] = [
            Weapon(name: "fork", damage: 2),
            Weapon(name: "knife", damage: 25),
            Weapon(name: "mass", damage: 40),
            Weapon(name: "bow", damage: 50),
            Weapon(name: "gold sword", damage: 100)
        ]
        
        // Tableau d'arme de type soins qu'un personnage peux trouver
        let weaponsHealTreasure: [Weapon] = [
            Weapon(name: "broken wand", damage: -2),
            Weapon(name: "potion", damage: -40),
            Weapon(name: "sivler wand", damage: -50),
            Weapon(name: "gold wand", damage: -100)
        ]
        
        // on récupére un chiffre entre 0 et 100
        let number = Int.random(in: 0 ..< 100)
        
        // si ce chiffre est plus grand que 30 le personnage ne trouve pas de trésor donc return
        if number > 30 {
            return
        }
        // sinon cela veux dire qu'il a trouvé un trésor
        print("\(character.name) found a treasure")
        
        let treasure: Weapon!
        // si le personnage est de type ataque on choisie un arme de type attaque au hasard dans le tableau d'arme de type attaque
        if character.weapon.damage > 0 {
            treasure = weaponsDamageTreasure.randomElement()
        } else {
            // sinon le personnage est de type soins on choisie un arme de type soins au hasard dans le tableau d'arme de type soins
            treasure = weaponsHealTreasure.randomElement()
        }
        print("treasure contains \(treasure.name) demage : \(treasure.damage)")
        print("\(character.name) changes his weapon for \(treasure.name)")
        // on assigne l'arme venant du tresor au personnage
        character.weapon = treasure
    }
    
    // function chooseCgaracterUse
    private func chooseCharacterUse(player: Player) -> Character {
        // on demande au joueur de tappé le nom du personnage qu'il veux utilisé
        let characterName = getLine()
        // on recherche si le nom tappé se trouve dans l'équipe
        for character in player.team {
            if characterName == character.name {
                // si c'est le cas on renvois le personnage
                if character.isDead {
                    print("The character choosed is dead. Please choose another one.")
                    return chooseCharacterUse(player:player)
                }
                return character
            }
        }
        // sinon on lui demande de recommencer
        print("Character not found. Please try again.")
        return chooseCharacterUse(player:player)
    }
    
    // function printGame
    private func printGame() {
        // cette fonction affiche les informations des deux joueurs et de leurs équipes.
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
    
    // function actifPlayer
    private func actifPlayer() -> Player {
        // cette fonction renvoie le player actif
        player1Turn = !player1Turn
        if player1Turn {
            return player1
        } else {
            return player2
        }
    }
    
    // function getLine
    private func getLine() -> String {
        // cette fonction appel readLine pour récupérer une entrée clavier utilisateur
        if let choice = readLine() {
            // si cette entrée n'est pas vide on la renvoie
            return choice
        } else {
            // sinon on lui demande de recommencer
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
    private func chooseCharacterName(characterNumber: Int, playerName: String) -> String{
        print("\(playerName), what is the name of your character \(characterNumber)?")
        //appel de la fonction readLine, si readLine renvoie une valeur qui n'est pas nil alors elle est assignée à la constante characterName et on effectue les actions à l'intérieur des accolades
        let characterName = getLine()
        if !nameManager.isValid(name: characterName) {
            print("Your character name was already taken. Please choose another one")
            return chooseCharacterName(characterNumber: characterNumber, playerName: playerName)
        }
        return characterName
    }
    
    // methode createCharacter
    // cette fonction prend en paramétre un nom de personnage
    private func createCharacter(characterName: String) -> Character {
        print("Choose the character's type for \(characterName). \n You can choose between those different types : warrior, wizard, dwarf and giant.")
        // on demande au Joueur qu'elle type de personnage il veux pour ce personnage
        let characterType = getLine()
        // On créer le personnage correspondant au type choisie
        if characterType == "warrior" {
            return Warrior(characterName: characterName)
        } else if characterType == "wizard" {
            return Wizard(characterName: characterName)
        } else if characterType == "dwarf" {
            return Dwarf(characterName: characterName)
        } else if characterType == "giant" {
            return Giant(characterName: characterName)
        } else {
            // si le type choisie n'est pas un type existant on lui demande de recommencer
            print("The type entered is not valid one. Please try again.")
            return createCharacter(characterName:characterName)
        }
    }
    
    // methode chooseTeam qui ne prend pas de paramètres () renvoie un tableau de personnages
    private func chooseTeam(playerName: String) -> [Character]{
        
        // création de la variable team de type tableau de character à qui on assigne la valeur "tableau vide"
        var team: [Character] = []
        // variable characterName de type String pour l'instant sans valeur
        var characterName: String!
        // variable character de type Character pour l'instant sans valeur
        var character: Character!
        
        var number = 1
        while (number != 4) {
            // on assigne à la variable characterName la valeur de retour de la méthode chooseCharacterName qui prend en paramètre characterNumber
            characterName = chooseCharacterName(characterNumber: number, playerName: playerName)
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
