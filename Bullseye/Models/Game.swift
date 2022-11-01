//
//  Game.swift
//  Bullseye
//
//  Created by Lucivaldo Queiroz on 26/10/22.
//

import Foundation

struct Game {
    
    var target: Int = Int.random(in: 1..<100)
    var score: Int = 0
    var round: Int = 1
    
    func points(sliderValue: Int) -> Int {
        100 - abs(self.target - sliderValue)
    }
    
}
