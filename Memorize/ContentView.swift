//
//  ContentView.swift
//  Memorize
//
//  Created by 暴雨心奴 on 2022/10/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
//        ZStack(content: {
//            RoundedRectangle(cornerRadius: 20)
//                .stroke(lineWidth: 3)
//            Text("Hello World!")
//        }).padding(.horizontal).foregroundColor(.red)

//        ZStack(alignment: .center){
//            RoundedRectangle(cornerRadius: 20)
//                .stroke(lineWidth: 3)
//            Text("Hello World!")
//        }.padding(.horizontal).foregroundColor(.red)
        
        ZStack {
            RoundedRectangle(cornerRadius: 30)
                .stroke(lineWidth: 3)
            Text("Hello World!")
        }
        .padding()
        .foregroundColor(.primary)
        
    }
}

// : some View  不透明类型
// {...}  是一个方法
// 函数的省略和kotlin很像















struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
