//
//  String Extensions.swift
//  Shelf
//
//  Created by Victor Hudson on 11/9/26.
//

import Foundation
extension String {
    var isBlank: Bool { return trimmed.isEmpty }
    var trimmed: String { return self.trimmingCharacters(in: .whitespacesAndNewlines) }
    var nilIfBlank: String? {
        if self.isBlank {
            return nil
        } else {
            return self
        }
    }
}
