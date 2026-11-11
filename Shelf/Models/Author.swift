//
//  Author.swift
//  Shelf
//
//  Created by Victor Hudson on 11/9/26.
//

import Foundation
import Observation

/// A person who wrote one or more books in the library.
@Observable final class Author: Identifiable {
    /// The author's first name.
    var firstName: String

    /// The author's last name, or `nil` if they go by a single name.
    var lastName: String?

    /// The author's full name for display, such as "Andy Weir".
    var displayName: String {
        if let lastName {
            firstName + " " + lastName
        } else {
            firstName
        }
    }

    /// A stable identifier used for identity, equality, and hashing.
    let id: UUID

    /// Creates an author, trimming whitespace from both names.
    /// - Parameters:
    ///   - firstName: The author's first name.
    ///   - lastName: The author's last name. A blank value is stored as `nil`.
    init(firstName: String, lastName: String? = nil) {
        self.firstName = firstName.trimmed
        self.lastName = lastName?.nilIfBlank?.trimmed
        self.id = UUID()
    }
}

// MARK: - Hashable Conformance
extension Author: Hashable {
    nonisolated static func == (lhs: Author, rhs: Author) -> Bool {
        lhs.id == rhs.id
    }

    nonisolated func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
