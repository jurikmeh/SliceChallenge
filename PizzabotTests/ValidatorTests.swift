//
//  ValidatorTests.swift
//  PizzabotTests
//
//  Created by yurykasper on 20.08.21.
//

import XCTest
@testable import SliceChallenge

class ValidatorTests: XCTestCase {
    var validator: ValidatorType!
    
    override func setUpWithError() throws {
        validator = Validator()
    }

    override func tearDownWithError() throws {
       validator = nil
    }
    
    func testValidInput() throws {
        XCTAssertNoThrow(try validator.validate(input: "5x5 (0,0) (1,3) (4,4)"))
    }

    func testEmptyInput() throws {
        XCTAssertThrowsError(try validator.validate(input: ""), ValidationError.emptyInput.description)
    }
    
    func testDontMatchInputPattern() throws {
        XCTAssertThrowsError(try validator.validate(input: "55 (0,0) (1,3)"), ValidationError.invalidInput.description)
        XCTAssertThrowsError(try validator.validate(input: "aa(fdfd,y)bb,g)"), ValidationError.invalidInput.description)
    }

}
