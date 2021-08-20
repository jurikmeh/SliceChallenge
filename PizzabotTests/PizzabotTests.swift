//
//  PizzabotTests.swift
//  PizzabotTests
//
//  Created by yurykasper on 20.08.21.
//

import XCTest
@testable import SliceChallenge

class PizzabotTests: XCTestCase {
    var pizzabot: PizzabotType!
    var validator: ValidatorType!
    var formatter: FormatterType!
    
    override func setUpWithError() throws {
        pizzabot = Pizzabot()
        validator = Validator()
        formatter = Formatter()
    }

    override func tearDownWithError() throws {
        pizzabot = nil
        validator = nil
        formatter = nil
    }

    func testSourceExample() throws {
        let sourceString = "5x5 (0,0) (1,3) (4,4)"
        let expectedResult = "ENNND EEEND "
        
        try validator.validate(input: sourceString)
        let gridData = try formatter.transform(input: sourceString)
        let instruction = try pizzabot.deliver(gridSize: gridData.gridSize, points: gridData.points)
        XCTAssertEqual(instruction, expectedResult)
    }
    
    func testChallenge() throws {
        let challengeString = "5x5 (0, 0) (1, 3) (4,4) (4, 2) (4, 2) (0, 1) (3, 2) (2, 3) (4, 1)"
        let expectedResult = "ENNND EEEND SSD D WWWWSD EEEND WND EESSD "
        
        try validator.validate(input: challengeString)
        let gridData = try formatter.transform(input: challengeString)
        let instruction = try pizzabot.deliver(gridSize: gridData.gridSize, points: gridData.points)
        XCTAssertEqual(instruction, expectedResult)
    }
    
    func testNoStartPoint() throws {
        let noStartPointString = "3x3 (2,1) (1,1)"
        try validator.validate(input: noStartPointString)
        let gridData = try formatter.transform(input: noStartPointString)
        XCTAssertNotEqual(gridData.points.first, pizzabot.startPoint)
        XCTAssertThrowsError(
            try pizzabot.deliver(gridSize: gridData.gridSize, points: gridData.points),
            PizzabotError.noStartPoint.description
        )
    }
    
    func testPointOutOfRange() throws {
        let pointOutOfRangeString = "4x4 (0,0) (9,9) (6,4) (3,3)"
        try validator.validate(input: pointOutOfRangeString)
        let gridData = try formatter.transform(input: pointOutOfRangeString)
        XCTAssertThrowsError(
            try pizzabot.deliver(gridSize: gridData.gridSize, points: gridData.points),
            PizzabotError.orderOutOfRange.description
        )
        XCTAssertFalse(gridData.points.filter({ $0.x > gridData.gridSize.x || $0.y > gridData.gridSize.y }).isEmpty)
    }
    
}
