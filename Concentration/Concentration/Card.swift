//
//  Card.swift
//  Concentration
//
//  Created by Cheng-Shan Hsieh on 2018/2/23.
//  Copyright © 2018年 HsinTing Hsieh. All rights reserved.
//

import Foundation

struct Card {
    
    var isFaceUp = false
    var isMatched = false
    var identifier: Int
    
    static var identifierFactory = 0
    
    static func getUniqueIdentifier() -> Int {
        identifierFactory += 1
        return identifierFactory
    }
    
    init() {
        self.identifier = Card.getUniqueIdentifier()
    }
}
