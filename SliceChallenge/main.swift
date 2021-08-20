//
//  main.swift
//  SliceChallenge
//
//  Created by yurykasper on 17.08.21.
//

import Foundation

var bot: PizzabotType = Pizzabot()
let formatter: FormatterType = Formatter()
let validator: ValidatorType = Validator()

let sourceData = "5x5 (0,0) (1,3) (4,4) (4,2) (4,2) (0,1) (3,2) (2,3) (4,1)"
var instruction: String?

do {
    try validator.validate(input: sourceData)
    let gridData = try formatter.transform(input: sourceData)
    instruction = try bot.deliver(gridSize: gridData.gridSize, points: gridData.points)
} catch let error as GeneralError {
    instruction = error.description
}

if let instruction = instruction {
    print(instruction)
}
