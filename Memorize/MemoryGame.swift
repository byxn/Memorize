//
//  MemoryGame.swift
//  Memorize  medel
//
//  Created by 暴雨心奴 on 2022/11/1.
//

import Foundation

struct MemoryGame<CardContent> {
    
    private(set) var cards: Array<Card>
    
    func choose(_ card: Card) {
        // card.isFaceUp.toggle()
        let chosenIndex = index(of: card)
        var chosenCard = cards[chosenIndex!]
        chosenCard.isFaceUp.toggle()
        print("chosenCard: \(chosenCard)")
        
        
    }
    
    func index(of card: Card) ->Int? {
        for index in 0..<cards.count {
            if cards[index].id == card.id {
                return index
            }
        }
        return nil
    }
    
    init(numberOfPairsfOfCards: Int, createCardContent: (Int) -> CardContent) {
        cards = Array<Card>()
        for pairIndex in 0..<numberOfPairsfOfCards {
            let content = createCardContent(pairIndex)
            cards.append(Card(content: content,id: pairIndex))
        }
    }
    
    struct Card: Identifiable {
        var isFaceUp: Bool = true
        var content: CardContent
        var isMatched: Bool = false
        var id: Int
    }
}
