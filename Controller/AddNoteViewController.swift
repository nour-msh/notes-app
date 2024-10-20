import UIKit

protocol AddNoteViewControllerDelegate {
    func didAddNote()
}

class AddNoteViewController: UIViewController {
    @IBOutlet weak var textInput: UITextField!
    @IBOutlet weak var descriptionTextInput: UITextView!
    
    var delegate: AddNoteViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func saveButton(_ sender: Any) {
        if let title = textInput.text, let body = descriptionTextInput.text {
            CoreDataManager.shared.addNote(title: title, body: body)
            delegate?.didAddNote() // Notify delegate that a note was added
            dismiss(animated: true, completion: nil) // Dismiss the view controller
        }
    }
}
