//
//  Book.swift
//  Shelf
//
//  Created by Victor Hudson on 11/9/26.
//

import Foundation
import Observation

/// A book in the reader's library.
@Observable final class Book: Identifiable {
    /// The book's title.
    var title: String

    /// The person who wrote the book.
    var author: Author

    /// Where the reader is with this book.
    var status: ReadingStatus

    /// A stable identifier used for identity, equality, and hashing.
    let id: UUID

    /// Creates a book.
    /// - Parameters:
    ///   - title: The book's title.
    ///   - author: The person who wrote the book.
    ///   - status: Where the reader is with this book.
    init(title: String, author: Author, status: ReadingStatus) {
        self.title = title
        self.author = author
        self.status = status
        self.id = UUID()
    }
}

// MARK: - Hashable Conformance
extension Book: Hashable {
    nonisolated static func == (lhs: Book, rhs: Book) -> Bool {
        lhs.id == rhs.id
    }

    nonisolated func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

// MARK: - Static Methods
extension Book {
    /// Returns a Boolean value indicating whether a title is usable.
    /// - Parameter title: The title to check.
    /// - Returns: `true` if the title has at least one non-whitespace character.
    static func isValidTitle(_ title: String) -> Bool {
        !title.isBlank
    }
}
