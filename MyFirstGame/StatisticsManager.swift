//
//  StatisticsManager.swift
//  MyFirstGame
//
//  Created by Anne-Elisabeth on 21/01/2019.
//  Copyright © 2019 Anne-Elisabeth. All rights reserved.
//

import Foundation

// data class containing stats
class Statistic {
    var damageGiven: Int = 0
    var damageTaken: Int = 0
    
    var attacksNumber: Int = 0
    var attacksTakenNumber: Int = 0
    
}

// class statisticsManager
class StatisticsManager {
    private var charactersStatistics: [Character : Statistic] = [:]
    private var teamStatistics: [Player : Statistic] = [:]
    private var totalNumberOfTurn: Int = 0
    
    // printStatistics func displays number of turns, character + players stats
    public func printStatistics() {
        print("Number of turn: \(totalNumberOfTurn)")
        for (character, statistic) in charactersStatistics {
            printStatisticsFor(name: character.name, statistic: statistic)
        } 
        for (player, statistic) in teamStatistics {
            printStatisticsFor(name: player.name, statistic: statistic)
        }
    }
    // printStatisticsFor displays every stats
    private func printStatisticsFor(name: String, statistic: Statistic) {
        print(name)
        print("number of attacks: \(statistic.attacksNumber)")
        print("damage given: \(statistic.damageGiven)")
        print("number of attacks taken: \(statistic.attacksTakenNumber)")
        print("damage taken: \(statistic.damageTaken)")
    }
    
    // updateStatistics func
    public func updateStatistics(attackerPlayer: Player, attacker: Character,
                          defenderPlayer: Player, defender: Character){
        
        updateCharacterStatistics(attacker: attacker, defender: defender)
        updateTeamStatistics(attackerPlayer: attackerPlayer, attacker: attacker, defenderPlayer: defenderPlayer)
        totalNumberOfTurn += 1
    }
    
    private func updateTeamStatistics(attackerPlayer: Player, attacker: Character, defenderPlayer: Player) {
        // if teamStatistics do not contain statistics for attackerPlayer create Stats for attacker Player
        if teamStatistics[attackerPlayer] == nil {
            teamStatistics[attackerPlayer] = Statistic()
        }
        
        // get new stats
        var statistic = teamStatistics[attackerPlayer]!
        statistic.attacksNumber += 1
        statistic.damageGiven += attacker.weapon.damage
        
        if teamStatistics[defenderPlayer] == nil {
            teamStatistics[defenderPlayer] = Statistic()
        }
        
        statistic = teamStatistics[defenderPlayer]!
        statistic.attacksTakenNumber += 1
        statistic.damageTaken += attacker.weapon.damage
    }
    
    // stats for characters
    private func updateCharacterStatistics(attacker: Character, defender: Character) {
        // to check if a character's statistics already exist (if not create them)
        if charactersStatistics[attacker] == nil {
            charactersStatistics[attacker] = Statistic()
        }
        // retrieve the stats of the character and apply the change
        var statistic = charactersStatistics[attacker]!
        statistic.attacksNumber += 1
        statistic.damageGiven += attacker.weapon.damage
        
        if charactersStatistics[defender] == nil {
            charactersStatistics[defender] = Statistic()
        }
        
        statistic = charactersStatistics[defender]!
        statistic.attacksTakenNumber += 1
        statistic.damageTaken += attacker.weapon.damage
    }
}
