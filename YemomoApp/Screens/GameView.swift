//
//  GameView.swift
//  YemomoApp
//
//  Created by 叶墨沫 on 2024/7/12.
//

import SwiftUI

struct GameView: View {
    var game: GameType
    @Binding var path: NavigationPath
    var games: [GameType] = []
    var platforms: [Platform] = []
    var body: some View {
        ZStack {
            VStack {
                VStack {
                    Text(game.name)
                        .font(.largeTitle)
                    Text("\(game.rating)".prefix(3))
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .foregroundStyle(.secondary)
                }
               
                VStack(spacing:10){
                    Button("返回") {
                        path.removeLast(path.count)
                    }
                    Button("推荐平台") {
                        path.append(platforms.randomElement()!)
                    }
                    Button("推荐游戏") {
                        path.append(games.randomElement()!)

                    }
                }
                //宽度铺满整个屏幕
                .frame(maxWidth: .infinity)
                .padding(.vertical,20)
                .background(.white)
                .cornerRadius(20)
                .padding(.all,20)
                .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                
            }
        }
    }
}

#Preview {
    @State var path = NavigationPath()
    return GameView(game: .init(name: "卡拉彼丘", rating: 9.8),path: $path)
}
