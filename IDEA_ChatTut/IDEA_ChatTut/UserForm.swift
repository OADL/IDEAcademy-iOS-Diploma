//
//  UserForm.swift
//  IDEA_ChatTut
//
//  Created by Omar Adel on 6/15/19.
//  Copyright © 2019 Omar Adel. All rights reserved.
//

import Foundation

enum segmentSelect: Int {
    case login , register
}

struct UserForm {
    var formType : segmentSelect? 
    var username : String?
    var email : String?
    var password : String?
}
