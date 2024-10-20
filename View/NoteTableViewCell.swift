//
//  NoteTableViewCell.swift
//  Notes App
//
//  Created by Nour on 20/10/2024.
//

import UIKit

class NoteTableViewCell: UITableViewCell {
    
    @IBOutlet weak var noteCard: UIView!
    @IBOutlet weak var noteCardContainer: UIView!
    
    
    @IBOutlet weak var noteIndex: UILabel!
    
    @IBOutlet weak var noteTitle: UILabel!
    
    @IBOutlet weak var noteDescription: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        noteCardContainer.backgroundColor = UIColor(hex: "#191919")
        noteCard.backgroundColor = UIColor(hex: "#373737")
        noteCard.layer.cornerRadius = 20
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setup(note: Notes){
        noteIndex.text = "\(String(describing: note.index))"
        noteTitle.text = note.title
        noteDescription.text = note.body
        
    }
    
}
