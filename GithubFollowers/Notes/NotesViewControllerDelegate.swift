//
//  NotesViewControllerDelegate.swift
//  GithubFollowers
//
//  Created by Ivan on 19.05.2024.
//

import UIKit

protocol NotesViewControllerDelegate: AnyObject {
    func didSelectNote(note: Note)
    func didDeleteNote(note: Note)
}


//Certainly Let's dive into a more complex example of the delegate pattern, focusing on a scenario that's common in iOS development: handling table view interactions. This example will demonstrate how to use delegates to manage selections and data updates in a table view.
//
//### Scenario: Custom Table View Controller with Delegation
//
//Imagine you're building a note-taking app where users can view a list of notes in a table view. You want to allow users to select a note to edit it, and you also want to notify the main view controller when a note is deleted so it can update accordingly.
//
//#### Step 1: Define the Delegate Protocol
//
//First, define a protocol that specifies the methods related to table view interactions that the delegate will implement.
//
//```swift
//protocol NotesViewControllerDelegate: AnyObject {
//    func didSelectNote(note: Note)
//    func didDeleteNote(note: Note)
//}
//```
//
//#### Step 2: Create the Data Model
//
//Define a simple `Note` model to represent the data in your table view.
//
//```swift
//struct Note {
//    let title: String
//    let content: String
//}
//```
//
//#### Step 3: Implement the Table View Controller
//
//Create a `NotesViewController` that uses a table view to display notes. This controller will have a delegate property to communicate back to the main view controller.
//
//```swift
//import UIKit
//
//class NotesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
//    weak var delegate: NotesViewControllerDelegate?
//    var notes = [Note(title: "Note 1", content: "Content 1"), Note(title: "Note 2", content: "Content 2")]
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        tableView.dataSource = self
//        tableView.delegate = self
//    }
//
//    // MARK: - TableView DataSource Methods
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return notes.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "NoteCell", for: indexPath)
//        cell.textLabel?.text = notes[indexPath.row].title
//        return cell
//    }
//
//    // MARK: - TableView Delegate Methods
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let selectedNote = notes[indexPath.row]
//        delegate?.didSelectNote(note: selectedNote)
//    }
//
//    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//        if editingStyle ==.delete {
//            let deletedNote = notes.remove(at: indexPath.row)
//            tableView.deleteRows(at: [indexPath], with:.fade)
//            delegate?.didDeleteNote(note: deletedNote)
//        }
//    }
//}
//```
//
//#### Step 4: Conform to the Delegate Protocol in Main ViewController
//
//Finally, make your main view controller conform to the `NotesViewControllerDelegate` protocol and implement the required methods.
//
//```swift
//class MainViewController: UIViewController, NotesViewControllerDelegate {
//    func didSelectNote(note: Note) {
//        // Navigate to the edit screen with the selected note
//        print("Selected note: \(note.title)")
//    }
//
//    func didDeleteNote(note: Note) {
//        // Update UI or data model after deletion
//        print("Deleted note: \(note.title)")
//    }
//
//    // Assume this method sets up and presents the NotesViewController
//    func showNotesView() {
//        let notesVC = NotesViewController()
//        notesVC.delegate = self
//        present(notesVC, animated: true)
//    }
//}
//```
//
//### Summary
//
//This example demonstrates a more advanced use of the delegate pattern, showing how to manage complex interactions between view controllers in an iOS app. The `NotesViewController` handles user interactions with the table view and communicates back to the `MainViewController` through the delegate protocol. This setup allows for a clean separation of concerns, where `NotesViewController` focuses on displaying data and handling user input, while `MainViewController` deals with higher-level app logic like navigation and data management.
