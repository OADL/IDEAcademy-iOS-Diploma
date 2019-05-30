//
//  ToDoListCell.swift
//  IDEA_ToDoList
//
//  Created by Omar Adel on 5/22/19.
//  Copyright © 2019 Omar Adel. All rights reserved.
//

import UIKit

class ToDoListCell: UITableViewCell {

    @IBOutlet weak var todoLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
