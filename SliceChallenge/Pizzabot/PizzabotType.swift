//
//  PizzabotType.swift
//  SliceChallenge
//
//  Created by yurykasper on 18.08.21.
//

import Foundation

/// List of requirements describing the behavior of pizzabot.
///
/// Types that conform to the *PizzabotType* protocol should contain one property called `startPoint` which represents origin on coordinate grid.
/// And one method `deliver(gridSize: CGPoint, points: [CGPoint])` for getting final command for the pizzabot.
protocol PizzabotType {
    var startPoint: CGPoint { get }
    mutating func deliver(gridSize: CGPoint, points: [CGPoint]) throws -> String?
}
