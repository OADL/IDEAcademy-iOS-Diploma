//
//  MovieDetailCell.swift
//  IDEA_MoviesList
//
//  Created by Omar Adel on 5/29/19.
//  Copyright © 2019 Omar Adel. All rights reserved.
//

import UIKit

class MovieDetailCell: UITableViewCell {

    enum detailType {
        case title , year , imdbID
    }
    
    @IBOutlet weak var label: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func recieveData(type : detailType , text : String ){
        
        switch type {
        case .title:
            label.text = "Movie: \(text)"
        case .year:
            label.text = "Release date: \(text)"
        case .imdbID:
            label.text = "IMDB: \(text)"
        }
        
    }

}

class MovieImageCell: UITableViewCell {
    
    
    
    @IBOutlet weak var movieImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    
    
}
