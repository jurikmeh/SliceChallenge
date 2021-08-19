//
//  ValidatorType.swift
//  SliceChallenge
//
//  Created by yurykasper on 18.08.21.
//

import Foundation

/// A type that every validator should implement.
///
/// Types that conform to the *ValidatorType* protocol should contain a method for validating different data and throw all possible errors.
protocol ValidatorType {
    func validate(input: String) throws
}
