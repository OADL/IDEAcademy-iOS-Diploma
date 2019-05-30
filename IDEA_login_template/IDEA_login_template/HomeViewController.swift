//
//  HomeViewController.swift
//  IDEA_login_template
//
//  Created by Omar Adel on 5/17/19.
//  Copyright © 2019 Omar Adel. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    //data will be recieved in this variable
    var data = ""
    //Labels outlets
    @IBOutlet weak var nameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //to remove the back button on the navigation bar
        self.navigationItem.setHidesBackButton(true, animated: false)
        //set the label with the data sent
        nameLabel.text = "Hello \(data)"
    }
    
}
