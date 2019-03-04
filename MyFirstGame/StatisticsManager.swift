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
    
    // stats for characters
    private func updateCharacterStatistics(attacker: Character, defender: Character) {
        // to check if a character's statistics already exist (if not create them)
        
        let statisticAttacker = getStatisticFor(character: attacker)
            
        statisticAttacker.attacksNumber += 1
        statisticAttacker.damageGiven += attacker.weapon.damage
        
        let statisticDefender = getStatisticFor(character: defender)
        
        statisticDefender.attacksTakenNumber += 1
        statisticDefender.damageTaken += attacker.weapon.damage
    }
    
    
    private func getStatisticFor(character: Character) -> Statistic {
        if charactersStatistics[character] == nil {
            charactersStatistics[character] = Statistic()
        }
        // retrieve the stats of the character and apply the change
        return charactersStatistics[character]!
    }
    
    
    
    private func updateTeamStatistics(attackerPlayer: Player, attacker: Character, defenderPlayer: Player) {
        // if teamStatistics do not contain statistics for attackerPlayer create Stats for attacker Player
        
        let statisticPlayerAttacker = getStatisticFor(player: attackerPlayer)
        
        statisticPlayerAttacker.attacksNumber += 1
        statisticPlayerAttacker.damageGiven += attacker.weapon.damage
        
        let statisticPlayerDefender = getStatisticFor(player: defenderPlayer)
        
        statisticPlayerDefender.attacksTakenNumber += 1
        statisticPlayerDefender.damageTaken += attacker.weapon.damage
    }
    
    private func getStatisticFor(player: Player) -> Statistic {
        if teamStatistics[player] == nil {
            teamStatistics[player] = Statistic()
        }
        // retrieve the stats of the character and apply the change
        return teamStatistics[player]!
    }
}
