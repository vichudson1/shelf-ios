//
//  LibraryTests.swift
//  ShelfTests
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

        try library.add(Book.sample())

        #expect(library.books.count == 1)
        #expect(library.books.first?.title == "Dune")
    }

    @Test("Titles are trimmed")
    func addTrimsTitle() throws {
        let library = Library()

        try library.add(Book.sample(title: " Dune\n"))

        #expect(library.books.count == 1)
        #expect(library.books.first?.title == "Dune")
    }

    @Test("Blank titles are rejected", arguments: ["", "   ", "\n"])
    func addRejectsBlankTitle(title: String) {
        let library = Library()

        #expect(throws: LibraryError.blankTitle) {
            try library.add(Book.sample(title: title))
        }

        #expect(library.books.isEmpty)
    }

    @Test("Different authors stay separate")
    func addKeepsDifferentAuthorsSeparate() throws {
        let library = Library()

        try library.add(Book.sample(title: "Project Hail Mary",
                                    author: Author(firstName: "Andy",
                                                   lastName: "Weir")))

        try library.add(Book.sample(title: "The Martian",
                                    author: Author(firstName: "Andy")))

        #expect(library.authors.count == 2)
    }
}
