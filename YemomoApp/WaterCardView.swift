//
//  WaterCardView.swift
//  YemomoApp
//
//  Created by 叶墨沫 on 2024/7/11.
//

import Foundation
import SwiftUI

struct WaterCardView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Image("Scene")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .cornerRadius(20)
            //评级和标题
            HStack {
                Text("华山日出")
                    .font(.title3)
                    .bold()
                Spacer()
                VStack(alignment: .leading){
                    HStack{
                        Image(systemName: "star.fill")
                        Image(systemName: "star.fill")
                        Image(systemName: "star.fill")
                        Image(systemName: "star.fill")
                        Image(systemName: "star.leadinghalf.filled")
                    }
                    HStack(spacing: 0.0){
                        Image(systemName: "eye")
                        Text("3000")
                    }
                }
                .font(.subheadline)
                .foregroundStyle(.secondary)
            }
            
            //描述
            
            Text("华山日出真是太好看了，风景宜人，阳光明媚，下次还来")
                .padding(.all,0)
            
            HStack{
                Spacer()
                Image(systemName: "fork.knife")
                Image(systemName: "cart")
            }.padding(.horizontal)
        }
        .padding(.all)
        .background(Rectangle().foregroundStyle(.white))
        .cornerRadius(20.0)
        .padding(.all)
        .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    WaterCardView()
}
