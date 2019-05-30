//
//  MovieModel.swift
//  IDEA_cocoapods
//
//  Created by Omar Adel on 5/25/19.
//  Copyright © 2019 Omar Adel. All rights reserved.
//

import Foundation

struct Movie : Codable {
    var Title : String?
    var Year : String?
}

struct SearchResult : Codable {
    var Search: [Movie]?
    var totalResults: String?
    var Response: String?
}
