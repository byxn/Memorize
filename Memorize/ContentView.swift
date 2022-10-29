//
//  ContentView.swift
//  Memorize
//
//  Created by 暴雨心奴 on 2022/10/26.
//

import SwiftUI

struct ContentView: View {
    
   let emojis = ["🐶","🐹","🐰", "🐼","🐯","🐤","🐸","🐒","🐔","🦊","🐗","🐴","🦄","🐝","🪱","🐛","🦋","🐌"]
   @State var emojiCount = 3
    
    var body: some View {
        VStack {
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 100))], content: {
                    // ForEach 竟然是一个结构体
                    ForEach(emojis[0...emojiCount],id: \.self,content: {
                        emoji in CardView(content:emoji).aspectRatio(2/3,contentMode: .fit)
                    })
                })
            }
            HStack {
                remove
                Spacer()
                add
            }
            .padding()
            .font(.largeTitle)
        }
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
            if emojiCount < emojis.count - 1 {
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















struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
//        ContentView()
//            .preferredColorScheme(.dark)
//
        ContentView()
            .preferredColorScheme(.light)
    }
}
