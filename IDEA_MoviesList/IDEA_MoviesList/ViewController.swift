//
//  ViewController.swift
//  IDEA_MoviesList
//
//  Created by Omar Adel on 5/29/19.
//  Copyright © 2019 Omar Adel. All rights reserved.
//

import UIKit
import Alamofire
import Kingfisher

class ViewController: UIViewController , UITableViewDelegate , UITableViewDataSource {
    
    @IBOutlet weak var myTableView: UITableView!
    
    @IBOutlet weak var loader: UIActivityIndicatorView!
    
    var movies : [Movie] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        myTableView.delegate = self
        myTableView.dataSource = self
        myTableView.keyboardDismissMode = .interactive
        loadData()
    }
    
    func loadData() {
        let parameters : [String:String] =
            [ "s" : "avengers" ,
              "apiKey" : "b52fc4a5"]
        
        loader.startAnimating()
        
        Alamofire.request("https://omdbapi.com", method: .get, parameters: parameters, encoding: URLEncoding.default, headers: nil).responseJSON { (myResponse) in
            
            self.loader.stopAnimating()
            
            let data = try! JSONDecoder().decode(SearchResult.self, from: myResponse.data!)
            
            // self.movie = data.Search ?? []
            
            if let mov = data.Search {
                self.movies = mov
                self.myTableView.reloadData()
            }
            
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let movie = movies[indexPath.row]
        
        let view = self.storyboard?.instantiateViewController(withIdentifier: "detailVC") as! MovieDetailViewController
        
        view.movie = movie
        
        self.navigationController?.pushViewController(view, animated: true)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myTableView.dequeueReusableCell(withIdentifier: "moviecell") as! MovieCell
        
        cell.movieTitle.text = movies[indexPath.row].Title
        
        return cell
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
}

