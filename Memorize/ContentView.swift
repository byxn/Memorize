//
//  ContentView.swift
//  Memorize
//
//  Created by 暴雨心奴 on 2022/10/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack(content: {
            let emojis = ["🐶","🐹","🐰", "🐼"]
            // 奇怪的for循环语法
            ForEach(emojis,id: \.self,content: {
                emoji in CardView(content:emoji)
            })
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
