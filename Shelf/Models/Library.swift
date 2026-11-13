//
//  Library.swift
//  Shelf
//
//  Created by Victor Hudson on 11/9/26.
//

import Foundation
import Observation

/// The app's in-memory store of books and their authors.
@Observable final class Library {
    /// Every book in the library, in the order it was added.
    private(set) var books: [Book] = []

    /// Every unique author in the library, added automatically by ``add(_:)``.
    private(set) var authors: [Author] = []
}

// MARK: - Book Management
extension Library {
    /// Adds a book to the library.
    ///
    /// The title is trimmed, and a blank title throws an error.
    /// If an author with the same name already exists, the book uses
    /// that author instead of adding a duplicate.
    /// - Parameter book: The book to add.
    /// - Throws: ``LibraryError/blankTitle`` if the title is blank.
    func add(_ book: Book) throws(LibraryError) {
        let trimmed = book.title.trimmed
        guard Book.isValidTitle(trimmed) else { throw .blankTitle }
        let author = fetchOrAdd(book.author)
        book.author = author
        book.title = trimmed
        books.append(book)
    }

    /// Removes a book from the library.
    ///
    /// The book's author stays in ``authors``.
    /// - Parameter book: The book to remove. Does nothing if it isn't in the library.
    func remove(_ book: Book) {
        books.removeAll { $0.id == book.id }
    }
}

// MARK: - Author Management
extension Library {
    /// Returns the library's matching author, or adds the given one if there's no match.
    ///
    /// Names are compared by ``Author/displayName``, ignoring case.
    /// - Parameter author: The author to look up.
    /// - Returns: The existing author, or `author` if it was just added.
    private func fetchOrAdd(_ author: Author) -> Author {
        guard
            let existingAuthor = authors.first(where: {
                $0.displayName.localizedCaseInsensitiveCompare(
                    author.displayName
                ) == .orderedSame
            })
        else {
            authors.append(author)
            return author
        }
        return existingAuthor
    }
}
