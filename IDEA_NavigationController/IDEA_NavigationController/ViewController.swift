//
//  ViewController.swift
//  IDEA_NavigationController
//
//  Created by Omar Adel on 5/12/19.
//  Copyright © 2019 Omar Adel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func goToPressed(_ sender: UIButton) {
        
        let view = self.storyboard?.instantiateViewController(withIdentifier: "scndVC") as! SecondViewController
        
        if(nameTextField.text != nil){
            view.data = nameTextField.text!
        }
        self.navigationController?.pushViewController(view, animated: true)
        
    }
    
}

