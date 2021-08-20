//
//  FormatterType.swift
//  SliceChallenge
//
//  Created by yurykasper on 18.08.21.
//

import Foundation

/// A type that transforms input string into different types of data.
///
/// Types that conform to the *FormatterType* protocol should contain a method for parsing and transforming source string into different types of data. Also should throw all possible errors.
protocol FormatterType {
    func transform(input: String) throws -> (gridSize: CGPoint, points: [CGPoint])
}
