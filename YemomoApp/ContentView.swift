//
//  ContentView.swift
//  YemomoApp
//
//  Created by 叶墨沫 on 2024/7/6.
//

import SwiftUI

struct StringView: View {
    var name: String
    var body: some View {
        VStack {
            Text(name)
                .padding(6.0)
        }
    }
}

struct ContentView: View {
    @Binding var isPlaying: Bool
    @Binding var myName: String
    @Environment(AppState.self) var appState

    var body: some View {
        ZStack {
            Color(.gray)
                .ignoresSafeArea()
            
            VStack {
                
                ColorPicker("颜色选择器", selection: .constant(.blue))
                    .font(.title3)
                    .padding(/*@START_MENU_TOKEN@*/ .all/*@END_MENU_TOKEN@*/)

                Image("Cover1")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(1000)
                    .padding(.all)

                StringView(name: "hello")
                    .font(.title2)
                    .fontWeight(.semibold)
            }
        }.foregroundColor(.white)
    }
}

#Preview() {
    @State var isPlaying = true
    @State var name = "hello"
    return ContentView(isPlaying: $isPlaying, myName: $name).sampleData(appState: AppState(name: "yemomo", age: 12))
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        PreviewContentView().previewDisplayName("主窗口")
            .sampleData(appState: AppState(name: "sagri", age: 12))
    }

    struct PreviewContentView: View {
        @State var isPlaying = true
        @State var name = "hello world"
        var body: some View {
            ContentView(isPlaying: $isPlaying, myName: $name)
        }
    }
}

struct StringView_Preview: PreviewProvider {
    static var previews: some View {
        StringView(name: "hello").previewDisplayName("文字窗口")
    }
}
