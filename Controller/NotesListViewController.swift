import UIKit

class NotesListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, AddNoteViewControllerDelegate {
    
    var notes: [Notes] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.estimatedRowHeight = 200
        tableView.rowHeight = UITableView.automaticDimension
        
        let nib = UINib(nibName: "NoteTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "NoteTableViewCell")
        
        notes = CoreDataManager.shared.fetchNotes() // Fetch notes from Core Data
        
        title = "My Notes"
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NoteTableViewCell", for: indexPath) as! NoteTableViewCell
        let note = notes[indexPath.row]
        cell.setup(note: note)
        return cell
    }
    
    @IBAction func addNoteButton(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let destination = storyboard.instantiateViewController(withIdentifier: "AddNoteViewController") as! AddNoteViewController
        destination.delegate = self // Set the delegate
        present(destination, animated: true, completion: nil)
    }
    
    func didAddNote() {
        notes = CoreDataManager.shared.fetchNotes() // Reload notes after adding
        tableView.reloadData() // Refresh the table view
    }
}
