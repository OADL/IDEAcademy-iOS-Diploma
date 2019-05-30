//
//  ViewController.swift
//  IDEA_WeatherApp
//
//  Created by Omar Adel on 5/29/19.
//  Copyright © 2019 Omar Adel. All rights reserved.
//

import UIKit

class ViewController: UIViewController , SecondViewDelegate {
    
    func cityData(city: String) {
        cityNameLabel.text = city
    }

    @IBOutlet weak var cityNameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func search(_ sender: Any) {
        let view = self.storyboard?.instantiateViewController(withIdentifier: "second") as! SecondViewController
        
        view.delegate = self
        
        self.navigationController?.pushViewController(view, animated: true)
    }
    
}

