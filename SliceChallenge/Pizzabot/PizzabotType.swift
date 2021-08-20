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
/// And three methods `pointOutOfRange()`, `containStartPoint()` and `pizzabot(input: String)`.
protocol PizzabotType {
    var startPoint: CGPoint { get }
    func getInstruction() -> String?
    mutating func setData(gridSize: CGPoint, points: [CGPoint]) throws
}
