//
//  Author.swift
//  Shelf
//
//  Created by Victor Hudson on 11/9/26.
//

import Observation
import Foundation

@Observable class Author: Identifiable {
    var firstName: String
    var lastName: String?
    var displayName: String {
        if let lastName {
            return firstName + " " + lastName
        } else {
            return firstName
        }
    }
    let id: UUID
    
    init(firstName: String, lastName: String? = nil) {
        self.firstName = firstName.trimmed
        self.lastName = lastName?.nilIfBlank?.trimmed
        self.id = UUID()
    }
}

extension Author: Hashable {
    nonisolated static func == (lhs: Author, rhs: Author) -> Bool {
        lhs.id == rhs.id
    }
    
    nonisolated func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
