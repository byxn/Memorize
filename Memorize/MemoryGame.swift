//
//  MemoryGame.swift
//  Memorize  medel
//
//  Created by 暴雨心奴 on 2022/11/1.
//

import Foundation

struct MemoryGame<CardContent> {
    
    private(set) var cards: Array<Card>
    
   mutating func choose(_ card: Card) {
        // card.isFaceUp.toggle()
        // if let chosenIndex = index(of: card) {
        // if let chosenIndex = cards.firstIndex(where: {cardInTheCardsArray in cardInTheCardsArray.id == card.id}) {
       if let chosenIndex = cards.firstIndex(where: { $0.id == card.id}) {
        // 复制值
        // var chosenCard = cards[chosenIndex!]
           cards[chosenIndex].isFaceUp.toggle()
       }
        print("\(cards)")
        
        
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
