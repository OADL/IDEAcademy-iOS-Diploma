//
//  AppTableViewCell.swift
//  IDEA_AppsList
//
//  Created by Omar Adel on 5/21/19.
//  Copyright © 2019 Omar Adel. All rights reserved.
//

import UIKit

class AppTableViewCell: UITableViewCell {

    @IBOutlet weak var appNumberLabel: UILabel!
    @IBOutlet weak var appPurchasesLabel: UILabel!
    @IBOutlet weak var appNameLabel: UILabel!
    @IBOutlet weak var appCategoryLabel: UILabel!
    
    @IBOutlet weak var appImage: UIImageView!
    
    @IBOutlet weak var starCosmos: CosmosView!
    
    @IBOutlet weak var buyButton: CustomUIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        appImage.layer.cornerRadius = appImage.frame.width / 5
        appImage.layer.borderWidth = 0.2
        appImage.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        buyButton.editButton()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
