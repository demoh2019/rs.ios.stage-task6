//
//  Player.swift
//  DurakGame
//
//  Created by Дима Носко on 15.06.21.
//

import Foundation

protocol PlayerBaseCompatible {
    var hand: [Card]? { get set }
}

final class Player: PlayerBaseCompatible {
    var hand: [Card]?

    func checkIfCanTossWhenAttacking(card: Card) -> Bool {
        for cart in hand!{
            if cart.value == card.value{
                return true
            }
        }
        return false
    }

    func checkIfCanTossWhenTossing(table: [Card: Card]) -> Bool {
        for cart in hand!{
            for cartTable in table{
                if cart.value == cartTable.value.value || cartTable.key.value == cart.value{
                    return true
                }
            }
        }
        return false
    }
}
