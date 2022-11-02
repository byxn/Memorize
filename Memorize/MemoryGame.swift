//
//  MemoryGame.swift
//  Memorize  medel
//
//  Created by 暴雨心奴 on 2022/11/1.
//

import Foundation

struct MemoryGame<CardContent> {
    
    private(set) var cards: Array<Card>
    
    init(numberOfPairsfOfCards: Int, createCardContent: (Int) -> CardContent) {
        cards = Array<Card>()
        for pairIndex in 0..<numberOfPairsfOfCards {
            let content = createCardContent(pairIndex)
            cards.append(Card(content: content))
        }
    }
    
    struct Card {
        var isFaceUp: Bool = true
        var content: CardContent
        var isMatched: Bool = false
    }
}
