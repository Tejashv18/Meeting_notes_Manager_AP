# Meeting Notes App

A modern, highly functional Flutter application designed specifically for managers, team leads, and professionals to streamline their meeting documentation process.

## 🚀 Key Features

* **Massive Manager Template Library:** Includes 50+ built-in, pre-formatted templates for every scenario (1-on-1s, Performance Reviews, Sprint Retrospectives, Project Kickoffs, etc.). Accessible via a sleek bottom modal sheet.
* **Live Search & Filtering:** Instantly filter through your notes in real-time by searching for keywords in the title or content.
* **Interactive UI & Gestures:** 
  * Beautiful gradient Note Cards.
  * Intuitive swipe-to-delete functionality (`Dismissible` widget).
  * Tappable cards that seamlessly transition into an editable full-screen view.
* **Immersive Empty States:** A gorgeous, custom full-screen vector illustration that politely prompts the user when their note list is empty.
* **Instant Feedback:** Interactive, floating snackbars that slide in to confirm whenever a note is successfully created, updated, or deleted.
* **Material 3 Design:** A cohesive, professional blue and white color scheme utilizing the latest Material 3 design principles for a polished aesthetic.

## 🛠️ Technical Concepts Used
* **State Management:** Extensive use of `StatefulWidget` to handle dynamic list rendering, search filtering, and live updates.
* **Complex Layouts:** Implementation of dynamic `ListView.builder`, `Stack` (for the empty state overlay), and `DraggableScrollableSheet` (for the dense template library).
* **Route Navigation:** Handling data passing back and forth across routes (`Navigator.push` and `Navigator.pop(context, data)`).
* **Callbacks & Data Flow:** Passing callback functions (`onEdit`, `onDelete`) through the widget tree.

## 🗂️ Project Structure
* `lib/main.dart` - Application entry point and Theme configuration.
* `lib/models/note.dart` - The core Data model shaping a Meeting Note.
* `lib/data/templates.dart` - The extensive library of 50 manager templates.
* `lib/screens/home_screen.dart` - The main dashboard containing the search bar, empty states, and dismissible list views.
* `lib/screens/add_note_screen.dart` - The note creation screen featuring the library bottom sheet loader.
* `lib/screens/note_detail_screen.dart` - The full-screen editable view for existing notes.
* `lib/widgets/note_card.dart` - The reusable, styled card component representing individual notes.
