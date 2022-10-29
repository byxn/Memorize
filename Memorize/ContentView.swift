//
//  ContentView.swift
//  Memorize
//
//  Created by 暴雨心奴 on 2022/10/26.
//

import SwiftUI

struct ContentView: View {
    @State var  emojis = ["🐶","🐹","🐰", "🐼","🐯","🐤","🐸","🐒","🐔","🦊","🐗","🐴","🦄","🐝","🪱","🐛","🦋","🐌"]
    @State var emojiCount = 10
    
    var body: some View {
        VStack {
            Text("Memorize!").font(.largeTitle)
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 100))], content: {
                  // ForEach 竟然是一个结构体
                    ForEach(emojis[0..<emojiCount],id: \.self,content: {
                        emoji in CardView(isFaceUp:true,content:emoji).aspectRatio(2/3,contentMode: .fit)
                    })
                })
            }
            HStack(spacing: 1.0) {
                theme1
                Spacer()
                theme2
                Spacer()
                theme3
            }
            .padding()
            .font(.title2)
        }
    }
    
    var theme1: some View {
        Button(action: {
            emojis = ["🐶","🐹","🐰", "🐼","🐯","🐤","🐸","🐒","🐔","🦊","🐗","🐴","🦄","🐝","🪱","🐛","🦋","🐌"].shuffled()
            emojiCount = Int.random(in: 0...emojis.count)
        }, label: {
            VStack {
                Image(systemName: "hare")
                Text("Thme1")
            }
        })
    }
    
    var theme2: some View {
        Button(action: {
            emojis = ["🚗","🚕","🚙","🚌","🚎","🏎","🚓","🚑","🚒","🚐","🚛","🚜","🛺","🚔","🛵"].shuffled()
            emojiCount = Int.random(in: 0...emojis.count)
        }, label: {
            VStack {
                Image(systemName: "car")
                Text("Thme2")
            }
            
        })
    }
    
    var theme3: some View {
        Button(action: {
            emojis = ["🍏","🍎","🍐","🍊","🍋","🍌","🍉","🍇","🍓","🫐","🍈","🍒","🍑","🥭","🍍","🥥","🌶","🥒","🥬","🥦","🥑","🍆","🍅"].shuffled()
            emojiCount = Int.random(in: 0...emojis.count)
        }, label: {
            VStack {
                Image(systemName: "fork.knife")
                Text("Thme3")
            }
            
        })
    }
    
    var remove: some View {
        Button(action: {
            if emojiCount >= 1 {
                emojiCount -= 1
            }
        }, label: {
            Image(systemName: "minus.circle")
        })
    }
    
    var add: some View {
        Button(action: {
            if emojiCount < emojis.count  {
                emojiCount += 1
            }
        }, label: {
            Image(systemName: "plus.circle")
        })
    }
}

struct CardView: View {
    
    @State var isFaceUp: Bool  = true
    var content: String = ""
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            if isFaceUp {
                shape.stroke(lineWidth: 3)
                // shape.strokeBorder(lineWidth: 3, antialiased:true)
                shape.fill().foregroundColor(.white)
                Text(content).font(.largeTitle)
            }else{
                shape.fill().foregroundColor(.red)
            }
        }
        .padding()
        .foregroundColor(.primary)
        .onTapGesture {
            isFaceUp = !isFaceUp
        }
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
//        ContentView()
//            .preferredColorScheme(.dark)
//
        ContentView()
            .preferredColorScheme(.light)
            .previewInterfaceOrientation(.portraitUpsideDown)
    }
}
