//
//  Pizzabot.swift
//  SliceChallenge
//
//  Created by yurykasper on 17.08.21.
//

import Foundation

/// Describes the behavior of pizzabot
struct Pizzabot: PizzabotType {
    var points: [CGPoint]?
    var deliveryDistance: CGPoint?
    var startPoint: CGPoint {
        return CGPoint(x: 0, y: 0)
    }
    
    /// Returns instruction for pizzabot
    /// - Parameter gridSize: point with maximum range of delivery on x-axis and y-axis
    /// - Parameter points: array of points where pizzabot should deliver orders
    /// - Returns: final command for pizzabot
    mutating func deliver(gridSize: CGPoint, points: [CGPoint]) throws -> String? {
        self.points = points
        try containStartPoint()
        deliveryDistance = gridSize
        try pointOutOfRange()
        
        var instructions: [String] = []
        for index in 0..<points.count - 1 {
            let firstPoint = points[index]
            let nextPoint = points[index+1]
            instructions += createInstruction(for: firstPoint, and: nextPoint)
        }
        return instructions.joined()
    }
}

private extension Pizzabot {
    /// A way to check if the route has start point.
    ///
    /// Use this method to validate that pizzabot has start point at (0,0)
    /// - Throws:
    /// - `PizzabotError.noStartPoint` indicates that route does not contain the origin point
    func containStartPoint() throws {
        guard let points = self.points else { return }
        guard let origin = points.first, origin == startPoint else { throw PizzabotError.noStartPoint }
    }
    
    /// A way to check if the point is out of delivery range.
    ///
    /// Use this method to know all if points in delivery range.
    /// - Throws:
    /// - `PizzabotError.orderOutOfRange` indicates that there is at least one point which is out of delivery range
    func pointOutOfRange() throws {
        guard let deliveryDistance = self.deliveryDistance else { return }
        guard let points = self.points else { return }
        guard points.filter({ $0.x > deliveryDistance.x || $0.y > deliveryDistance.y }).isEmpty else {
            throw  PizzabotError.orderOutOfRange
        }
    }
    
    /// Returns array of instructions for pizzabot
    ///
    /// Based on the two coordinates, the difference in x and y is calculated, after which it is determined which instructions to give.
    /// - Parameter first: describes the start point
    /// - Parameter next: describes end point
    /// - Returns: list of commands for pizzabot
    func createInstruction(for first: CGPoint, and next: CGPoint) -> [String] {
        var instructions: [String] = []
        let deltaX = Int(next.x - first.x)
        instructions += Array(repeating: (deltaX >= 0) ? PizzabotCommands.east.rawValue : PizzabotCommands.west.rawValue , count: abs(deltaX))
        
        let deltaY = Int(next.y - first.y)
        instructions += Array(repeating: (deltaY >= 0) ? PizzabotCommands.north.rawValue : PizzabotCommands.south.rawValue , count: abs(deltaY))
        
        instructions.append("\(PizzabotCommands.dropPizza.rawValue) ")
        return instructions
    }
}
