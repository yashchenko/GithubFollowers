//
//  NotesViewController.swift
//  GithubFollowers
//
//  Created by Ivan on 19.05.2024.
//

import UIKit

class NotesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    weak var delegateVar: NotesViewControllerDelegate?
    var notesArray = [Note(title: "first note title", content: "content inside first note"), Note(title: "second note title", content: "content inside second note")]
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "NoteCell")
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        view.addSubview(tableView)
    }
    
    // MARK: - TableView Data Source Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NoteCell", for: indexPath)
        cell.textLabel?.text = notesArray[indexPath.row].title
        return cell
    }
    
    // MARK: - TableView Delegate Methods
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedNote = notesArray[indexPath.row]
        delegateVar?.didSelectNote(note: selectedNote)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let deletedNote = notesArray.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            delegateVar?.didDeleteNote(note: deletedNote)
        }
    }
}


//Defined a tableView property in the NotesViewController class. ✅

//Added the tableView to the view hierarchy in the viewDidLoad method. ✅

//Set up the constraints for the tableView to ensure it takes up the entire view.

//Registered a cell class for the tableView to use. ✅

//Set the dataSource and delegate properties of the tableView to the NotesViewController.
