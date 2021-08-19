//
//  Validator.swift
//  SliceChallenge
//
//  Created by yurykasper on 17.08.21.
//

import Foundation

/// Special data type for validation input data.
struct Validator: ValidatorType {
    private struct CorrectInputPattern {
        // regular expression for only digit input
        static let digitsOnlyExpression = "([1-9][0-9]*|0)"
        // input data pattern which matches source one
        static let inputPattern = "\(digitsOnlyExpression)x\(digitsOnlyExpression)(\\s\\(\(digitsOnlyExpression),\\s?\(digitsOnlyExpression)\\))+"
    }
    
    /// A way to validate input string.
    ///
    /// Use this method to know if the input data write correctly.
    /// - Throws:
    /// - `ValidationError.emptyInput` if `input` does not contain symbols
    /// - `ValidationError.invalidInput` if `input` does not match the input pattern
    /// - Parameter input: source string you want to validate
    func validate(input: String) throws {
        let predicate = NSPredicate(format: "SELF MATCHES %@", Validator.CorrectInputPattern.inputPattern)
        guard !input.isEmpty else { throw ValidationError.emptyInput }
        guard predicate.evaluate(with: input) else { throw ValidationError.invalidInput }
    }
}
