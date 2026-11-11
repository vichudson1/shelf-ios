//
//  ReadingStatus.swift
//  Shelf
//
//  Created by Victor Hudson on 11/9/26.
//

/// Where a reader is with a book.
enum ReadingStatus: CaseIterable {
    case unread
    case reading
    case read

    /// A user-facing name for the status, shown in pickers and lists.
    var title: String {
        switch self {
        case .unread: "Want to Read"
        case .reading: "Reading"
        case .read: "Finished Reading"
        }
    }
}
