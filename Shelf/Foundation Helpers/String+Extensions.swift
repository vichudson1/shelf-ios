//
//  String+Extensions.swift
//  Shelf
//
//  Created by Victor Hudson on 11/9/26.
//

import Foundation

extension String {
    /// A Boolean value indicating whether the string is empty or contains only whitespace.
    var isBlank: Bool { trimmed.isEmpty }

    /// The string with leading and trailing whitespace and newlines removed.
    var trimmed: String { trimmingCharacters(in: .whitespacesAndNewlines) }

    /// The string itself, or `nil` if it's blank.
    ///
    /// Handy for optional fields, like an author's last name.
    var nilIfBlank: String? { isBlank ? nil : self }
}
