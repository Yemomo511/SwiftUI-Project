//
//  CardView.swift
//  YemomoApp
//
//  Created by 叶墨沫 on 2024/7/11.
//

import Foundation
import SwiftUI

struct NumberWithStringView: View {
    var title: String
    var number: Int

    var body: some View {
        VStack(alignment: .leading) {
            Text("\(number)")
                .font(.title2)
            Text("\(title)")
                .font(.caption)
                .foregroundColor(Color(.lightGray))
        }
    }
}

struct CardView: View {
    var body: some View {
        ZStack {
            Color(.gray).ignoresSafeArea()
            // 文字全部白色
            HStack {
                Image("user avatar")
                    .resizable()
                    .frame(width: 70, height: 70)
                    .cornerRadius(100.0)
                VStack {
                    // 上方用户信息
                    HStack(spacing: 0.0) {
                        // 学生信息
                        VStack(alignment: .leading) {
                            Text("颜宇航")
                                .font(.title3)
                                .bold()
                            Text("软件工程2206班")
                                .font(.caption)
                        }
                        Spacer()
                        // button背景蓝色，圆角
                        Button("设置") {
                            print("click")
                        }
                        .font(.title2)
                        .foregroundColor(.white)
                        .padding(.horizontal, 10)
                        .padding(.vertical, 2)
                        .background(Color.blue)
                        .cornerRadius(10)
                    } // 下方信息
                    HStack {
                        NumberWithStringView(title: "坚持打卡天数", number: 8)
                        Spacer()
                        HStack {
                            NumberWithStringView(title: "总学习时长", number: 24)
                            NumberWithStringView(title: "学习课程", number: 12)
                        }
                    }
                }.padding(20)
            }
            .foregroundColor(.black)
            .safeAreaPadding(.all)
            .background(.white)
            .cornerRadius(20)
            .padding(.vertical, 10)
            .padding(.horizontal,10)
            
        }
    }
}

#Preview("用户卡片视图") {
    CardView()
}
