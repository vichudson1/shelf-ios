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

    @Test("Matching authors are reused, ignoring case and extra spaces",
          arguments: [
            ("Andy", "Weir"),
            ("andy", "weir"),
            ("ANDY", "WEIR"),
            ("aNdY", "wEiR"),
            ("  Andy ", "Weir\n")
          ])
    func addReusesMatchingAuthor(firstName: String, lastName: String) throws {
        let library = Library()

        let book1 = Book.sample(title: "Project Hail Mary",
                                author: Author(firstName: "Andy",
                                               lastName: "Weir"))

        let book2 = Book.sample(title: "The Martian",
                                author: Author(firstName: firstName,
                                               lastName: lastName))

        try library.add(book1)
        try library.add(book2)

        #expect(library.authors.count == 1)
        #expect(book2.author === book1.author)
    }

    @Test("Removing a book keeps the others")
    func removeKeepsOtherBooks() throws {
        let library = Library()

        let book1 = Book.sample(title: "Dune")
        let book2 = Book.sample(title: "Emma")
        let book3 = Book.sample(title: "Holes")

        try library.add(book1)
        try library.add(book2)
        try library.add(book3)

        library.remove(book2)

        #expect(library.books == [book1, book3])
    }
}
