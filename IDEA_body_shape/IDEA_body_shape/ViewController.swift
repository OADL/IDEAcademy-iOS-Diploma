//
//  ViewController.swift
//  IDEA_body_shape
//
//  Created by Omar Adel on 4/30/19.
//  Copyright © 2019 Omar Adel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var weightTxtField: UITextField!
    @IBOutlet weak var heightTxtField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var resultImage: UIImageView!
    @IBOutlet weak var showMeButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        labelColor = resultLabel.backgroundColor!
        showMeButton.layer.cornerRadius = showMeButton.frame.height / 2
        //========
        if let weight = UserDefaults.standard.value(forKey: "weit") as? Int , let height = UserDefaults.standard.value(forKey: "heit") as? Int {
            weightTxtField.text = "\(weight)"
            weightTxtField.text = "\(height)"
        }
        //===========
        // Do any additional setup after loading the view.
    }
    
    var labelColor: UIColor = UIColor.blue
    
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        self.view.endEditing(true)
        guard let weightText = weightTxtField.text else { return }
        guard let heightText = heightTxtField.text else { return }
        
        if( weightText.isEmpty == true || heightText.isEmpty == true ){
            showResult(Color: labelColor, Text: "Result Here", Image: nil)
            return
        }
        
        let weight = Int(weightTxtField.text!)!
        let height = Int(heightTxtField.text!)!
        //USER DEFAULTS
        UserDefaults.standard.set(weight, forKey: "weit")
        UserDefaults.standard.set(height, forKey: "heit")
        //===========
        let result = height - weight
        resultLabel.isHidden = false
        resultImage.isHidden = false
        
        if(result > 110 ){
            showResult(Color: #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1), Text: "You need to eat well.", Image: UIImage(named: "unhealthy2"))
        }else if(result < 100){
            showResult(Color: #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1), Text: "You need to lose some weight.", Image: UIImage(named: "fat2"))
        }else {
            showResult(Color: #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1), Text: "You are perfect.", Image: UIImage(named: "healthy2"))
        }
    }
    
    func showResult(Color: UIColor , Text: String, Image: UIImage?){
        resultLabel.backgroundColor = Color
        resultLabel.text = Text
        resultImage.image = Image
    }
    
}

