//
//  Game.swift
//  DurakGame
//
//  Created by Дима Носко on 16.06.21.
//

import Foundation

protocol GameCompatible {
    var players: [Player] { get set }
}

struct Game: GameCompatible {
    var players: [Player]
}

extension Game {

    func defineFirstAttackingPlayer(players: [Player]) -> Player? {
        var attakingPlayer = players.first
        var minValue = Value.allCases.count
        for player in players{
            for cart in player.hand!{
                let value = cart.value.rawValue
                if value < minValue && cart.isTrump{
                    attakingPlayer = player
                    minValue = value
                }
            }
        }
        return attakingPlayer
    }
}
