//
//  ViewController.swift
//  IDEA_cocoapods
//
//  Created by Omar Adel on 5/25/19.
//  Copyright © 2019 Omar Adel. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    var data : [Movie] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        loadWebsiteCodable()
    }

    /*func loadWebsite(){
        Alamofire.request("https://omdbapi.com/?s=avengers&apiKey=b52fc4a5").responseJSON(completionHandler: { (response) in
            //print(response.value!)
            if let responseDictionary = response.value as? [String:Any] {
//                print("Success Convert")
//                print(responseDictionary["Response"] as! String)
                if let movies = responseDictionary["Search"] as? [[String:String]] {
//                    print(movies[0]["Title"])
                    for movie in movies {
                        let movieModel = Movie.init(Title: movie["Title"], Year: movie["Year"])
                        self.data.append(movieModel)
                    }
                }
            }
 
        })
    }*/

    func loadWebsiteCodable(){
        Alamofire.request("https://omdbapi.com/?s=avengers&apiKey=b52fc4a5").responseJSON(completionHandler: { (response) in
            //print(response.value!)
            let movies = try! JSONDecoder().decode(SearchResult.self,from: response.data!)
            print(movies.Search![0].Title!)
            self.data = movies.Search!
        })
    }
    
}

