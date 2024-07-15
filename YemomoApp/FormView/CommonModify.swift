//
//  CommonModify.swift
//  YemomoApp
//
//  Created by 叶墨沫 on 2024/7/15.
//

import SwiftUI

private struct ButtonModify:ViewModifier{
    func body(content: Content) -> some View {
        content
            .padding(.vertical, 10)
            .padding(.horizontal,20)
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(5)
    }
}

extension View{
    func buttonDefaultStyle()-> some View{
        self.modifier(ButtonModify())
    }
    //覆写
    func defaultDisabled(_ isDisabled: Bool) -> some View {
        self.disabled(isDisabled)
            .background(isDisabled ? Color.gray : Color.blue)
    }
}

#Preview("Button Modify 预览"){
    Button("Click me") {
        print("button clicked")
    }
    .buttonDefaultStyle()
}
