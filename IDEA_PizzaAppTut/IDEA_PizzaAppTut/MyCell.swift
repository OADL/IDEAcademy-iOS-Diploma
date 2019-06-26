//
//  MyCell.swift
//  IDEA_PizzaAppTut
//
//  Created by Omar Adel on 6/19/19.
//  Copyright © 2019 Omar Adel. All rights reserved.
//

import UIKit

class MyCell: UICollectionViewCell {
    
    @IBOutlet weak var containerview: UIView!
    
    @IBOutlet weak var mylabel: UILabel!
    
    override func awakeFromNib() {
        containerview.layer.cornerRadius = containerview.frame.height/2
        containerview.layer.shadowColor = UIColor.black.cgColor
        containerview.layer.shadowOffset = CGSize(width: 0.5, height: 0.5)
        containerview.layer.shadowOpacity = 0.3
        containerview.layer.shadowRadius = 5.0
    }
    
    override var isSelected: Bool{
        didSet{
            if self.isSelected {
                containerview.backgroundColor = #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1)
            } else {
                containerview.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
            }
        }
    }
    
}
