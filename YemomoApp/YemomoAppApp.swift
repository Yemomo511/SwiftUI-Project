//
//  YemomoAppApp.swift
//  YemomoApp
//
//  Created by 叶墨沫 on 2024/7/6.
//

import SwiftUI

struct AppDataType {
    var name: String
    var age: Int
}

@Observable
class AppState {
    var name = "yemomo"
    var age = 12
    var appData:AppDataType
    init(name: String = "yemomo", age: Int = 12) {
        self.appData = AppDataType(name: name, age: age)
    }
}

extension View {
    func sampleData(appState: AppState,radius: Int = 3)-> some View{
        self.modifier(SampleModify(AppState: appState,cornerRadius: radius))
    }
}

@main
struct YemomoAppApp: App {
    var body: some Scene {
        WindowGroup {
            WarGameContent()
        }
    }
}
