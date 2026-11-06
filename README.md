# Shelf

A simple SwiftUI reading list. Keep track of the books you want to read, are reading, and have finished.

Built for Weekend 2 of my iOS Catch-Up Plan: getting back into iOS development with modern SwiftUI. The goal this weekend is **state and navigation**, done the current way.

> **Status:** in progress. For now, books only live in memory, so they reset when the app quits. That changes in Weekend 4 and 5.

## Features

- **Book list:** see every book at a glance
- **Detail screen:** tap a book to see and edit it
- **Add a book:** a sheet with title, author, and status
- **Edit in place:** changes show up in the list right away
- **Swipe to delete:** remove a book with one swipe

## How it works

Books live in one `@Observable` model class. Views read it directly, and SwiftUI redraws only what changed. No `ObservableObject`, no `@Published`.

| SwiftUI piece | Used for |
| --- | --- |
| `@Observable` | The book data and the library that holds it |
| `@Bindable` | Editing a book on the detail screen |
| `NavigationStack` | The navigation container (replaces `NavigationView`) |
| `navigationDestination(for:)` | Opening a book's detail screen |
| `List`, `ForEach` | The book list |
| `.onDelete` | Swipe to delete |
| `.sheet` | The Add Book screen |
| `@Environment(\.dismiss)` | Closing the sheet |
| `#Preview` | Live previews in Xcode |

## Requirements

- Xcode with the iOS 27 SDK
- iOS 27 or later (iPhone or iPad)

## Run it

1. Clone the repo.
2. Open `Shelf.xcodeproj` in Xcode.
3. Pick a simulator or your iPhone.
4. Press **Cmd + R**.

## Roadmap

Shelf is the app I keep building on for the rest of the plan:

- [ ] **Weekend 2:** add, open, edit, and delete books (in memory)
- [ ] **Weekend 4:** sync every change to a REST backend
- [ ] **Weekend 5:** save locally with SwiftData, plus Swift Testing tests
- [ ] **Weekend 6:** polish with Liquid Glass, accessibility, and ship to TestFlight
