//
//  BookIten.swift
//  YemomoApp
//
//  Created by 叶墨沫 on 2024/7/12.
//

import SwiftUI

struct BookItem: View {
    var book: Book
    fileprivate func TextDetail(_ text: String) -> Text {
        return Text(text)
            .font(.subheadline)
    }
    
    var body: some View {
        NavigationLink(destination: Text("\(book.title)")) {
            HStack(alignment: .center) {
                
                VStack(alignment: .leading) {
                    Text(book.title)
                        .font(.headline)
                    TextDetail("by \(book.author)")
                    TextDetail("\(book.pages) pages")
                }
                
            }
        }
    }
}
#Preview {
    BookItem(book: Book.samples[0])
        .previewLayout(.sizeThatFits)

}
