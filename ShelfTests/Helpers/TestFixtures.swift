//
//  TestFixtures.swift
//  Shelf
//
//  Created by Victor Hudson on 11/11/26.
//

@testable import Shelf

extension Book {
    static func sample(title: String = "Dune",
                       author: Author = Author(firstName: "Frank", lastName: "Herbert")) -> Book {
        Book(title: title, author: author, status: .unread)
    }
}
