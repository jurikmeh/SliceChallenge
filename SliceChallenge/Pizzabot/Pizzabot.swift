//
//  Pizzabot.swift
//  SliceChallenge
//
//  Created by yurykasper on 17.08.21.
//

import Foundation

/// Describes the behavior of delivery bot
final class Pizzabot: PizzabotType {
    private let validator: ValidatorType = Validator()
    private let formatter: FormatterType = Formatter()
    var points: [Point]?
    var maxDeliveryDistance: (xAxis: Int?, yAxis: Int?)
    var startPoint: Point {
        return Point(x: 0, y: 0)
    }
    
    init() {}
    
    /// Returns list of instructions for pizzabot in one line
    /// - Parameter input: source string for getting instruction
    /// - Returns: list of commands for pizzabot
    func pizzabot(input: String) -> String? {
        do {
            try validator.validate(input: input)
            let gridData = try formatter.transform(input: input)
            points = gridData.points
            try containStartPoint()
            maxDeliveryDistance.xAxis = gridData.gridSize.x
            maxDeliveryDistance.yAxis = gridData.gridSize.y
            try pointOutOfRange()
        } catch let error as ValidationError {
            print(error.description)
            return nil
        } catch let error as FormatterError {
            print(error.description)
            return nil
        } catch let error as PizzabotError {
            print(error.description)
            return nil
        } catch {
            print(error.localizedDescription)
            return nil
        }
        
        var instructions: [String] = []
        guard let points = self.points else { return nil }
        for index in 0..<points.count - 1 {
            let firstPoint = points[index]
            let nextPoint = points[index+1]
            instructions += getInstructions(for: firstPoint, and: nextPoint)
        }
        return instructions.joined()
    }
}

extension Pizzabot {
    /// A way to check if the route has start point.
    ///
    /// Use this method to validate that pizzabot has start point at (0,0)
    /// - Throws:
    /// - `PizzabotError.noStartPoint` indicates that route does not contain the origin point
    func containStartPoint() throws {
        guard let points = self.points else { return }
        guard points.contains(startPoint) else { throw PizzabotError.noStartPoint }
    }
    
    /// A way to check if the point is out of delivery range.
    ///
    /// Use this method to know all if points in delivery range.
    /// - Throws:
    /// - `PizzabotError.orderOutOfRange` indicates that there is at least one point which is out of delivery range
    func pointOutOfRange() throws {
        guard let xDistance = self.maxDeliveryDistance.xAxis, let yDistance = maxDeliveryDistance.yAxis else { return }
        guard let points = self.points else { return }
        guard points.filter({ $0.x > xDistance || $0.y > yDistance }).isEmpty else {
            throw  PizzabotError.orderOutOfRange
        }
    }
    
    /// Returns list of instructions for pizzabot in one line
    ///
    /// Based on the two coordinates, the difference in x and y is calculated, after which it is determined which instructions to give.
    /// - Parameter first: describes the start point
    /// - Parameter next: describes end point
    /// - Returns: list of commands for pizzabot
    private func getInstructions(for first: Point, and next: Point) -> [String] {
        var instructions: [String] = []
        let deltaX = next.x - first.x
        instructions += Array(repeating: (deltaX >= 0) ? PizzabotCommands.east.rawValue : PizzabotCommands.west.rawValue , count: abs(deltaX))
        
        let deltaY = next.y - first.y
        instructions += Array(repeating: (deltaY >= 0) ? PizzabotCommands.north.rawValue : PizzabotCommands.south.rawValue , count: abs(deltaY))
        
        instructions.append("\(PizzabotCommands.dropPizza.rawValue) ")
        return instructions
    }
}
