//
//  EmojlMemoryGameswift.swift
//  Memorize viewModel
//  static 的使用
//  lamda 函数
//
//  Created by 暴雨心奴 on 2022/11/2.
//
import Foundation

class EmojiMemoryGame: ObservableObject {
    
    
    static let emojis = ["🐶","🐹","🐰", "🐼","🐯","🐤","🐸","🐒","🐔","🦊","🐗","🐴","🦄","🐝","🪱","🐛","🦋","🐌"]
    
    static func creatMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsfOfCards: 10) {
            pairIndex in emojis[pairIndex]
        }
    }
    
    // var objectWillChange: ObservableObjectPublisher
    
    @Published private var model: MemoryGame<String> = creatMemoryGame()
    
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    
    // MARK: - Intent(S)
    
    func choose(_ card: MemoryGame<String>.Card) {
        // objectWillChange.send()
        model.choose(card)
    }
    
}
