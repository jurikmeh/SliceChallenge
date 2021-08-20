//
//  ValidationError.swift
//  SliceChallenge
//
//  Created by yurykasper on 18.08.21.
//

import Foundation

/// Describes all possible errors during validation input data.
enum ValidationError: GeneralError {
    case emptyInput
    case invalidInput
    
    var description: String {
        switch self {
        case .emptyInput:
           return "You entered an empty string"
        case .invalidInput:
           return "Enter something like that: 5x5 (0,0) (1,3) (4,4)"
        }
    }
}
