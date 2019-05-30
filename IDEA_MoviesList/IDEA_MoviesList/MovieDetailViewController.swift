//
//  MovieDetailViewController.swift
//  IDEA_MoviesList
//
//  Created by Omar Adel on 5/29/19.
//  Copyright © 2019 Omar Adel. All rights reserved.
//

import UIKit

class MovieDetailViewController: UIViewController , UITableViewDelegate , UITableViewDataSource {
    
    @IBOutlet weak var movieTableView: UITableView!
    
    var movie : Movie?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        movieTableView.delegate = self
        movieTableView.dataSource = self
        
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = movieTableView.dequeueReusableCell(withIdentifier: "movieimagecell") as! MovieImageCell
            
            let url = URL(string: (movie?.Poster)!)
            
            cell.movieImage.kf.setImage(with: url)
            
            return cell
        }else {
            let cell = movieTableView.dequeueReusableCell(withIdentifier: "moviedetailcell") as! MovieDetailCell
            
            if indexPath.row == 1 {
                let title = self.movie?.Title ?? ""
                
                cell.recieveData(type: .title, text: title)
                
            }else if indexPath.row == 2{
                let year = self.movie?.Year ?? ""
                
                cell.recieveData(type: .year, text: year)
            }else if indexPath.row == 3{
                let imdb = self.movie?.imdbID ?? ""
                
                cell.recieveData(type: .imdbID, text: imdb)
            }
            
            return cell
        }
    }
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        if indexPath.row == 0 {
//            return 350
//        }else{
//            return 0
//        }
//    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
}
