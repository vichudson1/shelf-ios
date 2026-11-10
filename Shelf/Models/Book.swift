//
//  Book.swift
//  Shelf
//
//  Created by Victor Hudson on 11/9/26.
//

import Observation
import Foundation


/// An object representing a book
@Observable class Book: Identifiable {

    var title: String
    var author: Author
    var status: ReadingStatus
    let id: UUID
    
    init(title: String, author: Author, status: ReadingStatus) {
        self.title = title
        self.author = author
        self.status = status
        self.id = UUID()
    }
    
}

extension Book: Hashable {
    nonisolated static func == (lhs: Book, rhs: Book) -> Bool {
        lhs.id == rhs.id
    }
    
    nonisolated func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

extension Book {
    static func isValidTitle(_ title: String) -> Bool {
        return !title.isBlank
    }
}
