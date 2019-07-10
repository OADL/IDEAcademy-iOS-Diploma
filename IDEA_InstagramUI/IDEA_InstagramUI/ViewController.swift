//
//  ViewController.swift
//  IDEA_InstagramUI
//
//  Created by Omar Adel on 7/4/19.
//  Copyright © 2019 Omar Adel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidAppear(_ animated: Bool) {
        
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 150, height: 40))
        imageView.contentMode = .scaleAspectFit
        
        let image = UIImage(named: "instagram")
        imageView.image = image
        
        navigationItem.titleView = imageView
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

