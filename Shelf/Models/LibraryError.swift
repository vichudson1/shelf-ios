//
//  LibraryError.swift
//  Shelf
//
//  Created by Victor Hudson on 11/10/26.
//

import Foundation

/// An Error type for the library.
enum LibraryError: LocalizedError {
    /// The book's title was empty or only whitespace.
    case blankTitle

    /// A message suitable for showing to the user.
    var errorDescription: String? {
        switch self {
        case .blankTitle: "Invalid Book Title"
        }
    }
}
