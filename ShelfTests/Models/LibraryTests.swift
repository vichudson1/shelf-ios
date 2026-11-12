//
//  LibraryTests.swift
//  LibraryTests
//
//  Created by Victor Hudson on 11/5/26.
//

import Testing
@testable import Shelf

@MainActor
struct LibraryTests {
    @Test("Clean titles are saved as-is")
    func addKeepsCleanTitle() throws {
        let library = Library()
        let book = Book(
            title: "Dune",
            author: Author(firstName: "Frank", lastName: "Herbert"),
            status: .unread
        )

        try library.add(book)

        #expect(library.books.count == 1)
        #expect(library.books.first?.title == "Dune")
    }

    @Test("Titles are trimmed")
    func addTrimsTitle() throws {
        let library = Library()
        let book = Book(
            title: "  Dune\n",
            author: Author(firstName: "Frank", lastName: "Herbert"),
            status: .unread
        )

        try library.add(book)

        #expect(library.books.count == 1)
        #expect(library.books.first?.title == "Dune")
    }

    @Test("Blank titles are rejected", arguments: ["", "   ", "\n"])
    func addRejectsBlankTitle(title: String) {
        let library = Library()
        let book = Book(
            title: title,
            author: Author(firstName: "Frank", lastName: "Herbert"),
            status: .unread
        )

        #expect(throws: LibraryError.blankTitle) {
            try library.add(book)
        }
        #expect(library.books.isEmpty)
    }

    @Test("Different authors stay separate")
    func addKeepsDifferentAuthorsSeparate() throws {
        let library = Library()
        let book1 = Book(
            title: "Project Hail Mary",
            author: Author(firstName: "Andy", lastName: "Weir"),
            status: .unread
        )

        let book2 = Book(
            title: "The Martian",
            author: Author(firstName: "Andy"),
            status: .unread
        )

        try library.add(book1)
        try library.add(book2)

        #expect(library.authors.count == 2)
    }
}
