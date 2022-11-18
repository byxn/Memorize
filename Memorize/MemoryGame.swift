//
//  MemoryGame.swift
//  Memorize  model
//
//  Created by 暴雨心奴 on 2022/11/1.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable {
    
    private(set) var cards: Array<Card>
    
    private var indexOfTheOneAndOnlyFaceUpCard: Int? // 正面朝上的卡片索引
    
    mutating func choose(_ card: Card) {
       if let chosenIndex = cards.firstIndex(where: { $0.id == card.id}),
          !cards[chosenIndex].isFaceUp,
          !cards[chosenIndex].isMatched
        {
           if let potentialMatchIndex = indexOfTheOneAndOnlyFaceUpCard {
               if cards[chosenIndex].content == cards[potentialMatchIndex].content {
                   cards[chosenIndex].isMatched = true
                   cards[potentialMatchIndex].isMatched = true
               }
               indexOfTheOneAndOnlyFaceUpCard = nil
           }else {
               for index in cards.indices {
                   cards[index].isFaceUp = false
               }
               indexOfTheOneAndOnlyFaceUpCard = chosenIndex
           }
           cards[chosenIndex].isFaceUp.toggle()
       }
        print(cards)

    }
    
    init(numberOfPairsfOfCards: Int, createCardContent: (Int) -> CardContent) {
        cards = Array<Card>()
        for pairIndex in 0..<numberOfPairsfOfCards {
            let content = createCardContent(pairIndex)
            cards.append(Card(content: content,id: pairIndex))
        }
    }
    
    struct Card: Identifiable {
        var isFaceUp: Bool = false
        var content: CardContent
        var isMatched: Bool = false
        var id: Int
    }
}
