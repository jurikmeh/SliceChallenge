//
//  main.swift
//  SliceChallenge
//
//  Created by yurykasper on 17.08.21.
//

import Foundation

let bot: PizzabotType = Pizzabot()
print(bot.pizzabot(input: "5x5 (0,0) (1,3) (4,4) (4,2) (4,2) (0,1) (3,2) (2,3) (4,1)") ?? "Did not get the instruction. Something went wrong")

