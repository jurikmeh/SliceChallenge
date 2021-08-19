//
//  Transformer.swift
//  SliceChallenge
//
//  Created by yurykasper on 17.08.21.
//

import Foundation

/// A type for parsing source string and getting grid size and points for it.
struct Formatter: FormatterType {
    /// A way to get data form input string.
    ///
    /// Use this method to get the maximum delivery distance on x-axis and y-axis.  During parsing values for points that are on the coordinate grid are also computed.
    /// - Throws:
    /// - `FormatterError.unspecifiedGridSize` if `input` does not contain size of the grid
    /// - Parameter input: source string for getting additional data
    /// - Returns: tuple which represents maximum delivery distance on x-axis and y-axis and a new array consists of points
    func transform(input: String) throws -> (gridSize: (x: Int, y: Int), points: [Point]) {
        let digitArray = input.filter { $0 != ")" && $0 != " " }.split(separator: "(")
        guard let size = digitArray.first, size.contains("x") else { throw FormatterError.unspecifiedGridSize }
        
        var numbers: [Int] = []
        digitArray.forEach {
            numbers += String($0).components(separatedBy: Separator.separatorItems).compactMap { Int($0) }
        }
        
        let gridSize = (x: numbers[0], y: numbers[1])
        numbers.removeFirst(2)
        
        let points = addPoints(from: numbers)
        return (gridSize, points)
    }
}

private extension Formatter {
    struct Separator {
        // character set for separating digits from one another
        static let separatorItems: CharacterSet = ["x", ".", ",", "/", "(", ")", "-", "_", "*", "#", ":", ";", "|"]
    }
    
    /// Function to transform array of integers into array of points
    ///
    /// Creates an array of points based on source array of integers running though `x` and `y` pairs.
    /// - Parameter numbers: source array of integers
    /// - Returns: new array consists of points
    func addPoints(from numbers: [Int]) -> [Point] {
        var points: [Point] = []
        for index in stride(from: 0, to: numbers.count, by: 2) {
            let point = Point(x: numbers[index], y: numbers[index+1])
            points.append(point)
        }
        return points
    }
}
