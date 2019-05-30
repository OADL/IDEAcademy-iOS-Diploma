//
//  AddNewCell.swift
//  IDEA_ToDoList
//
//  Created by Omar Adel on 5/25/19.
//  Copyright © 2019 Omar Adel. All rights reserved.
//

import UIKit

class AddNewCell: UITableViewCell {

    @IBOutlet weak var newToDoTextField: UITextField!
    
    var addNewToDo : (() -> ())?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
        
    }

    
    @IBAction func donePressed(_ sender: UITextField) {
        guard let textF = sender.text else { return }
        if textF != "" {
            addNewToDo?()
        }
    }
    
}
