//
//  GeneralError.swift
//  SliceChallenge
//
//  Created by yurykasper on 20.08.21.
//

import Foundation

/// A type for all kinds of errors
protocol GeneralError: Error {
    var description: String { get }
}
