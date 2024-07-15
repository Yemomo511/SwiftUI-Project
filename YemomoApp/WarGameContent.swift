//
//  WarGameContent.swift
//  YemomoApp
//
//  Created by 叶墨沫 on 2024/7/11.
//
import SwiftUI

@ViewBuilder
func createView(@ViewBuilder content:()->some View)-> some View{
    VStack{
        content()
        Text("World")
    }
}


struct TimesPlayer: View {
    @Binding var playerScore: Int
    var title: String
    var body: some View {
        
        VStack(spacing: 10.0) {
            Text(title)
            Text("\(playerScore)")
        }.font(.title)
    }
}

struct WarGameContent: View {
    @State var playerCard: String = "card7"
    @State var cpuCard: String = "card3"
    @State var playerScore: Int = 0
    @State var cpuScore: Int = 0
    var body: some View {
        ZStack {
            Image("background-plain")
                .resizable()
                .ignoresSafeArea()
            VStack {
                Image("logo")
                Spacer()
                HStack {
                    Spacer()
                    Image(playerCard)
                    Spacer()
                    Image(cpuCard)
                    Spacer()
                }
                Spacer()
                // docs: The label of a button can be any kind of view ...
                Button(action: clickButton) {
                    Image("button")
                }
                // hold gesture to show it
                .contextMenu {
                    Button("Restart") {
                        print("restart")
                    }
                    Button("Exit") {
                        print("exit")
                    }
                }

                Spacer()
                createView(content: {
                    Text("Hello")
                })
                HStack {
                    Spacer()
                    TimesPlayer(playerScore: $playerScore, title: "player")
                    Spacer()
                    TimesPlayer(playerScore: $cpuScore, title: "CPU")
                    Spacer()
                }.foregroundStyle(.white)
            }
            .padding(.vertical)
        }
    }

    func clickButton() {
        let playerNumber = Int.random(in: 2...14)
        // <=2<14
        let cpuNumber = Int.random(in: 2...14)

        playerCard = "card" + String(playerNumber)
        cpuCard = "card" + String(cpuNumber)

        if playerNumber > cpuNumber {
            playerScore += 1
        }
        if playerNumber < cpuNumber {
            cpuScore += 1
        }
    }
}

#Preview {
    WarGameContent()
}
