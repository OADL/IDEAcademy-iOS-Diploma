//
//  RoomNameCell.swift
//  IDEA_ChatTut
//
//  Created by Omar Adel on 6/15/19.
//  Copyright © 2019 Omar Adel. All rights reserved.
//

import UIKit

class RoomNameCell: UITableViewCell {

    @IBOutlet weak var roomName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    
}
