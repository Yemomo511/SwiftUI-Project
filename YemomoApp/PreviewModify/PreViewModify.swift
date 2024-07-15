//
//  PreViewModify.swift
//  YemomoApp
//
//  Created by 叶墨沫 on 2024/7/7.
//

import SwiftUI

// modify 可以通过 body 修改传递的视图
// 在 Swift 中，当函数体只有一个表达式时，可以省略 return 关键字，这使得代码更简洁
// 对于单行代码还是省略把，很明显就能看出差不多是中间件的作用

struct SampleModify: ViewModifier {
    var AppState: AppState
    var cornerRadius: Int = 3
    // body 里面的 content 就是被修饰的视图
    func body(content: Content) -> some View {
        content.environment(AppState).cornerRadius(CGFloat(cornerRadius))
    }
}
