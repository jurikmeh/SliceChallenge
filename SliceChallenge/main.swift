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
    try bot.setData(gridSize: gridData.gridSize, points: gridData.points)
    instruction = bot.getInstruction()
} catch let error as ValidationError {
    instruction = error.description
} catch let error as FormatterError {
    instruction = error.description
} catch let error as PizzabotError {
    instruction = error.description
} catch {
    instruction = error.localizedDescription
}

if let instruction = instruction {
    print(instruction)
}
