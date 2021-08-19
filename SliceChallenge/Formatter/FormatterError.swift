//
//  FormatterError.swift
//  SliceChallenge
//
//  Created by yurykasper on 18.08.21.
//

import Foundation

/// Describes all possible errors during formatting input data.
enum FormatterError: Error {
    case unspecifiedGridSize
    
    var description: String {
        switch self {
        case .unspecifiedGridSize:
            return "Grid size is not specified"
        }
    }
}
