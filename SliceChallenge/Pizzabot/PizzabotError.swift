//
//  PizzabotError.swift
//  SliceChallenge
//
//  Created by yurykasper on 18.08.21.
//

import Foundation

/// Describes all possible errors during the operation of the pizzabot.
enum PizzabotError: Error {
    case noStartPoint
    case orderOutOfRange
    
    var description: String {
        switch self {
        case .noStartPoint:
            return "There is no start point at all!"
        case .orderOutOfRange:
            return "There is order out of delivery range"
        }
    }
}
