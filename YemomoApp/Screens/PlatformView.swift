//
//  PlatformView.swift
//  YemomoApp
//
//  Created by 叶墨沫 on 2024/7/12.
//

import SwiftUI

struct PlatformView: View {
    var games: [GameType]
    @Binding var path: NavigationPath
    var platform: Platform
    var body: some View {
        ZStack{
            Color(.white).ignoresSafeArea()
            VStack {
                Image(systemName: platform.imageName)
                    .resizable()
                    .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/,height: 100)
                    .foregroundStyle(platform.color)
                    
                Text(platform.name)
                    .font(.largeTitle)
                    .foregroundStyle(platform.color)
                List {
                    Section("Games") {
                        ForEach(games, id: \.name) { game in
                            HStack {
                                Text(game.name)
                                Spacer()
                                Text("\(game.rating)".prefix(3))
                                    .font(.caption)
                                    .foregroundStyle(.secondary)
                            }.onTapGesture {
                                path.append(game)
                            }
                        }
                    }
                }
            }
        }
        
    }
}

#Preview {
    @State var path = NavigationPath()
    return PlatformView(games: [.init(name: "卡拉彼丘", rating: 9.8)], path: $path, platform: .init(name: "switch", imageName: "xbox.logo", color: .mint))
}
