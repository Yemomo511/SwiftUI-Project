//
//  SectionCard.swift
//  YemomoApp
//
//  Created by 叶墨沫 on 2024/7/12.
//

import SwiftUI

struct Platform: Hashable {
    var name: String
    var imageName: String
    var color: Color
}

struct GameType:Hashable{
    var name: String;
    var rating: Double;
}

struct MyItemView<Content: View>: View {
    var number: Int
    var content: ()->Content
    // 逃逸闭包 see:https://juejin.cn/post/6844903951519727629
    // content不一定在这个作用域类执行，因此需要允许逃逸闭包
    init(number: Int, @ViewBuilder content: @escaping ()->Content) {
        self.number = number
        self.content = content
    }

    var body: some View {
        VStack {
            ForEach(0 ..< number) { _ in
                content()
            }
        }
    }
}

struct SectionCard: View {
    var platForms: [Platform] = [
        .init(name: "xbox", imageName: "xbox.logo", color: .green),
        .init(name: "PlaySation", imageName: "playstation.logo", color: .indigo),
        .init(name: "PC", imageName: "pc", color: .pink),
        .init(name: "mobile", imageName: "iphone", color: .mint)
    ]
    
    var games: [GameType] = [
        .init(name: "GTA5", rating: 9.8),
        .init(name: "LOL", rating: 9.5),
        .init(name: "DOTA2", rating: 9.6),
        .init(name: "PUBG", rating: 9.0),
    ]
    // content 闭包返回View,接手title参数
    @State var path = NavigationPath()
    var body: some View {
        NavigationStack(path: $path) {
            List {
                Section("platforms") {
                    ForEach(platForms, id: \.name) { platform in
                        NavigationLink(value: platform) {
                            Label(platform.name, systemImage: platform.imageName)
                                .foregroundColor(platform.color)
                        }
                    }
                }
            }
            .navigationTitle("首页")
            .navigationDestination(for: Platform.self) { platform in
                PlatformView(games: games, path: $path, platform: platform)
            }
            .navigationDestination(for: GameType.self ){ game in
                GameView(game: game, path: $path,games: games,platforms:  platForms)
            }
        }
        .accentColor(.black)
    }
}

struct SectionCardView_Preview: PreviewProvider {
    static var previews: some View {
        SectionCard().previewDisplayName("卡片视图")
    }
}



#Preview {
    SectionCard()
}
