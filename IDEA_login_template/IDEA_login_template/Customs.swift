//
//  Customs.swift
//  IDEA_login_template
//
//  Created by Omar Adel on 5/17/19.
//  Copyright © 2019 Omar Adel. All rights reserved.
//

import UIKit

//subclass for UIButton to change the background color when highlighted
class WhiteCustomButton : UIButton {
    override open var isHighlighted: Bool{
        didSet{
            backgroundColor = isHighlighted ?  #colorLiteral(red: 0.155138284, green: 0.6363460422, blue: 0.5924358964, alpha: 1) : UIColor.white
        }
    }
}
//subclass for UIButton to change the background color when highlighted
class DarkCustomButton: UIButton {
    override open var isHighlighted: Bool{
        didSet{
            backgroundColor = isHighlighted ? UIColor.white : #colorLiteral(red: 0.155138284, green: 0.6363460422, blue: 0.5924358964, alpha: 1)
        }
    }
}
//extension to UIButton to edit the frames width and color and corner radius
extension UIButton{
    func editButton(){
        self.layer.cornerRadius = 2.5
        self.layer.borderWidth = 1.2
        self.layer.borderColor = #colorLiteral(red: 0.155138284, green: 0.6363460422, blue: 0.5924358964, alpha: 1)
    }
}
