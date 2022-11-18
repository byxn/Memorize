//
//  ContentView.swift
//  Memorize
//
//  Created by 暴雨心奴 on 2022/10/26.
//

import SwiftUI

struct ContentView: View {
    
   @ObservedObject var viewModel: EmojiMemoryGame
    
    var body: some View {
        VStack {
            Text("Memorize!").font(.largeTitle)
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 100))]) {
                    // ForEach是一个结构体
                    ForEach(viewModel.cards) { card in
                          CardView(card: card)
                              .aspectRatio(2/3,contentMode: .fit)
                              .onTapGesture {
                                  viewModel.choose(card)
                              }
                      }
                  }
            }
        }
    }

}

struct CardView: View {
    
    var card: MemoryGame<String>.Card
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            if card.isFaceUp {
                shape.stroke(lineWidth: 3)
                // shape.strokeBorder(lineWidth: 3, antialiased:true)
                shape.fill().foregroundColor(.white)
                Text(card.content).font(.largeTitle)
            }else if card.isMatched {
                shape.opacity(0)
            }else{
                shape.fill().foregroundColor(.red)
            }
        }
        .padding()
        .foregroundColor(.primary)
    
    }
}

// : some View  不透明类型
// {...}  是一个方法
// 函数的省略和kotlin很像
// UI的构建和FLutter一毛一样

// 遗留问题
// 修改数据后isFaceUp状态没有重置















struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
//        ContentView(viewModel: game)
//            .preferredColorScheme(.dark)
//
        ContentView(viewModel: game)
            .preferredColorScheme(.light)
            .previewInterfaceOrientation(.portraitUpsideDown)
    }
}
