//
//  StatisticsManager.swift
//  MyFirstGame
//
//  Created by Anne-Elisabeth on 21/01/2019.
//  Copyright © 2019 Anne-Elisabeth. All rights reserved.
//

import Foundation

// data class containing stats
class Statistic{
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
        
        self.updateCharacterStatistics(attacker: attacker, defender: defender)
        self.updateTeamStatistics(attackerPlayer: attackerPlayer, attacker: attacker, defenderPlayer: defenderPlayer)
        self.totalNumberOfTurn += 1
    }
    
    private func updateTeamStatistics(attackerPlayer: Player, attacker: Character, defenderPlayer: Player) {
        // if teamStatistics do not contain statistics for attackerPlayer create Stats for attacker Player
        if self.teamStatistics[attackerPlayer] == nil {
            self.teamStatistics[attackerPlayer] = Statistic()
        }
        
        // get new stats
        var statistic = self.teamStatistics[attackerPlayer]!
        statistic.attacksNumber += 1
        statistic.damageGiven += attacker.weapon.damage
        
        if self.teamStatistics[defenderPlayer] == nil {
            self.teamStatistics[defenderPlayer] = Statistic()
        }
        
        statistic = self.teamStatistics[defenderPlayer]!
        statistic.attacksTakenNumber += 1
        statistic.damageTaken += attacker.weapon.damage
        
    }
    
    private func updateCharacterStatistics(attacker: Character, defender: Character) {
        if self.charactersStatistics[attacker] == nil {
            self.charactersStatistics[attacker] = Statistic()
        }
        
        var statistic = self.charactersStatistics[attacker]!
        statistic.attacksNumber += 1
        statistic.damageGiven += attacker.weapon.damage
        
        if self.charactersStatistics[defender] == nil {
            self.charactersStatistics[defender] = Statistic()
        }
        
        statistic = self.charactersStatistics[defender]!
        statistic.attacksTakenNumber += 1
        statistic.damageTaken += attacker.weapon.damage
    }
}
