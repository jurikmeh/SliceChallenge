//
//  FormatterTests.swift
//  PizzabotTests
//
//  Created by yurykasper on 20.08.21.
//

import XCTest
@testable import SliceChallenge

class FormatterTests: XCTestCase {
    var formatter: FormatterType!

    override func setUpWithError() throws {
        formatter = Formatter()
    }

    override func tearDownWithError() throws {
        formatter = nil
    }
    
    func testValidResult() throws {
        let expectedGridSize = CGPoint(x: 7, y: 7)
        let expectedNumberOfPoints = [CGPoint(x: 0, y: 0), CGPoint(x: 3, y: 4), CGPoint(x: 5, y: 6), CGPoint(x: 1, y: 4)].count
        
        let results = try formatter.transform(input: "7x7 (0,0) (3,4) (5,6) (1,4)")
        
        XCTAssertEqual(expectedGridSize.x, results.gridSize.x)
        XCTAssertEqual(expectedGridSize.y, results.gridSize.y)
        XCTAssertEqual(expectedNumberOfPoints, results.points.count)
    }

    func testGridSizeNotSpecified() throws {
        XCTAssertThrowsError(try formatter.transform(input: "5#5 (0,0) (1,3)"), FormatterError.unspecifiedGridSize.description)
    }

}
