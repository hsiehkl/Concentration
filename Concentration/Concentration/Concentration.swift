//
//  Concentration.swift
//  Concentration
//
//  Created by Cheng-Shan Hsieh on 2018/2/23.
//  Copyright © 2018年 HsinTing Hsieh. All rights reserved.
//

import Foundation

struct Concentration {
    
    private(set) var cards = [Card]()
    
    private var indexOfOneAndOnlyFaceUpCard: Int? {
        
        get {
            return cards.indices.filter { cards[$0].isFaceUp }.oneAndOnly
//            var foundIndex: Int?
//            for index in cards.indices {
//                if cards[index].isFaceUp {
//                    if foundIndex == nil {
//                        foundIndex = index
//                    } else {
//                        return nil
//                    }
//                }
//            }
//            return foundIndex
        }
        
        set {
            for index in cards.indices {
                cards[index].isFaceUp = (index == newValue)
            }
        }
    }
    
    mutating func chooseCard(at index: Int) {
        assert(cards.indices.contains(index), "Concentration.chooseCard(at: \(index): chosen index not in the cards")
        if !cards[index].isMatched {
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                if cards[matchIndex] == cards[index] {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                
                cards[index].isFaceUp = true
                
                } else {
                    indexOfOneAndOnlyFaceUpCard = index
            }
        }
    }
    
    init(numberOfPairsOfCards: Int) {
        assert(numberOfPairsOfCards > 0, "Concentration.init(\(numberOfPairsOfCards): you must have one pair of cards")
        
        for _ in 1...numberOfPairsOfCards {
            let card = Card()
            cards += [card, card]
        }
        
        // TODO: Shuffle the cards
        
        for index in cards.indices {
            print("index: \(index)")
            let unshuffledCardsLastIndex = cards.count - 1 - index
            print("unshuffledCardsLastIndex: \(unshuffledCardsLastIndex)")
            let randomIndex = unshuffledCardsLastIndex.arc4random
            print("randomIndex: \(randomIndex)")
            cards.swapAt(unshuffledCardsLastIndex, randomIndex)
        }
//        cards.shuffle()
        
    }
}

extension Collection {
    var oneAndOnly: Element? {
        return count == 1 ? first : nil
    }
}

extension Array {
    
    mutating func shuffle() {
        for i in stride(from: count - 1, to: 1, by: -1) {
            let random = Int(arc4random_uniform(UInt32(i + 1)))
            swapAt(i, random)
        }
    }
}

