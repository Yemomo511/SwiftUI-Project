//
//  BookModal.swift
//  YemomoApp
//
//  Created by 叶墨沫 on 2024/7/12.
//

import Foundation


struct Book:Identifiable{
    var id = UUID();
    var title: String
    var author: String
    var isbn: String
    var pages: Int
    var isRead: Bool = false
}


//MARK: sample 例子
extension Book{
    static let samples = [
        Book(title: "Changer", author: "Matt Gemmell", isbn: "9781916265202", pages: 476),
        Book(title: "SwiftUI for Absolute Beginners", author: "Jayant Varma", isbn: "9781484255155", pages: 200),
        Book(title: "Why we sleep", author: "Matthew Walker", isbn: "9780141983769", pages: 368),
        Book(title: "The Hitchhiker's Guide to the Galaxy", author: "Douglas Adams", isbn: "9780671461492", pages: 216)
      ]
}
