//
//  PizzabotCommands.swift
//  SliceChallenge
//
//  Created by yurykasper on 17.08.21.
//

import Foundation

/**
 An enumeration describing pizzabot commands.
 
 # Lists
 Bot commands:
 
 1. N - move north
 2. S - move south
 3. E - move east
 4. W - move west
 5. D - drop pizza
 */
enum PizzabotCommands: String {
    case north = "N"
    case south = "S"
    case east = "E"
    case west = "W"
    case dropPizza = "D"
}
