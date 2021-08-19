//
//  Point.swift
//  SliceChallenge
//
//  Created by yurykasper on 17.08.21.
//

import Foundation

/// Data type which represents the position on the coordinate grid
/// - x: value on x-axis
/// - y:    value on y-axis
struct Point: Equatable, Hashable {
    let x: Int
    let y: Int
}
