//
//  MovieModel.swift
//  IDEA_MoviesList
//
//  Created by Omar Adel on 5/29/19.
//  Copyright © 2019 Omar Adel. All rights reserved.
//

import Foundation

struct Movie : Codable {
    var Title : String?
    var Year : String?
    var imdbID : String?
    var Poster : String?
}

struct SearchResult : Codable {
    var Search: [Movie]?
    var totalResults: String?
    var Response: String?
}
