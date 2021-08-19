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
    var startPoint: Point { get }
    func containStartPoint() throws
    func pointOutOfRange() throws
    func pizzabot(input: String) -> String?
}
