//
//  ViewController.swift
//  IDEA_project_1
//
//  Created by Omar Adel on 4/30/19.
//  Copyright © 2019 Omar Adel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var btn: UIButton!
    @IBOutlet weak var lbl: UILabel!
    var count : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        btn.backgroundColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
        lbl.text = "Omar"
        btn.setTitle("Hello!", for: .normal)
        
        lbl.textAlignment = .center
        // Do any additional setup after loading the view.
    }

    @IBAction func buttonPressed(_ sender: UIButton) {
        count += 1
        
    }
    
}

