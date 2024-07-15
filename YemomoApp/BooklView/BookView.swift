//
//  BookView.swift
//  YemomoApp
//
//  Created by 叶墨沫 on 2024/7/12.
//

import SwiftUI

class BookModalView:ObservableObject{
    @Published var books:[Book] = Book.samples
}

struct BookView: View {
    @ObservedObject var modal: BookModalView
    var body: some View {
        List {
            ForEach(modal.books) { book in
                BookItem(book: book)
            }
        }
    }
}

#Preview {
    var bookModal = BookModalView()
    return BookView(modal: bookModal)
}

