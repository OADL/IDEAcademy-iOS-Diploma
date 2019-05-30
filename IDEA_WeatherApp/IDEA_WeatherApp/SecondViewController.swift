//
//  SecondViewController.swift
//  IDEA_WeatherApp
//
//  Created by Omar Adel on 5/29/19.
//  Copyright © 2019 Omar Adel. All rights reserved.
//

import UIKit

@objc protocol SecondViewDelegate {
    func cityData(city: String)
    @objc func dosmth()
}

class SecondViewController: UIViewController {
    
    var delegate : SecondViewDelegate?
    
    @IBOutlet weak var cityLabel: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func submit(_ sender: UIButton) {
        delegate?.cityData(city: cityLabel.text!)
        self.navigationController?.popViewController(animated: true)
    }
    
}
