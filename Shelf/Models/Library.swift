//
//  Library.swift
//  Shelf
//
//  Created by Victor Hudson on 11/9/26.
//

import Observation
import Foundation


// This class is the data store that manages books in the collection
@Observable class Library {
    
    private(set) var books: [Book] = []
    private(set) var authors: [Author] = []

}

// MARK: - Book Management
extension Library {
    
    func add(_ book: Book) {
        let trimmed = book.title.trimmed
        guard Book.isValidTitle(trimmed) else { return }
        let author = fetchOrAdd(book.author)
        book.author = author
        book.title = trimmed
        books.append(book)
    }
    
    func remove(_ book: Book) {
        guard let index = books.firstIndex(of: book) else {
            return
        }
        books.remove(at: index)
    }
}

// MARK: - Author Managment
extension Library {
    func fetchOrAdd(_ author: Author) -> Author {
        guard let existingAuthor = authors.first (where: {
            $0.displayName.localizedCaseInsensitiveCompare(author.displayName) == .orderedSame
        })
        else {
            authors.append(author)
            return author
        }
        return existingAuthor
    }
}
