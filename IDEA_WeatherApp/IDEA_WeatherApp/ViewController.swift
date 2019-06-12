//
//  ViewController.swift
//  IDEA_WeatherApp
//
//  Created by Omar Adel on 6/12/19.
//  Copyright © 2019 Omar Adel. All rights reserved.
//

import UIKit
import Alamofire
import Kingfisher

class ViewController: UIViewController {

    @IBOutlet weak var navBar: UINavigationItem!
    @IBOutlet weak var searchButton: UIBarButtonItem!
    @IBOutlet weak var weatherIcon: UIImageView!
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var cityConditionLabel: UILabel!
    @IBOutlet weak var cityTemperatureLabel: UILabel!
    @IBOutlet weak var loader: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
        getWeather(city: "cairo")
    }

    @IBAction func searchButtonPressed(_ sender: UIBarButtonItem) {
        let alertController = UIAlertController(title: "Location", message: nil    , preferredStyle: .alert)
        
        alertController.addTextField(configurationHandler: { (textField: UITextField) in
            textField.textAlignment = .center
            textField.returnKeyType = .go
        })
        
        let doneAction = UIAlertAction(title: "Go", style: .default, handler: { (action: UIAlertAction) in
            let name = alertController.textFields![0]
            if name.text != ""{
                self.getWeather(city: name.text!)
            }
        })
        
        alertController.addAction(doneAction)
        
        self.present(alertController,animated: true)
    }
 
    func getWeather(city: String){
        let parameters : [String:String] =
        [ "q" : city ,
          "key" : "17b9d6b5f5f14afc823191220192405" ,
          "fbclid" : "IwAR3Ta7_lPhEEMI6N2JYdYPKFAZ2y7DDflAGZOtyTq_S0BC1CF1f6d9rZfsw" ]
        
        loader.startAnimating()
        searchButton.isEnabled = false
        cityNameLabel.alpha = 0.5
        cityConditionLabel.alpha = 0.5
        cityTemperatureLabel.alpha = 0.5
        weatherIcon.alpha = 0.5
        
        Alamofire.request("https://api.apixu.com/v1/current.json?", method: .get, parameters: parameters, encoding: URLEncoding.default, headers: nil).responseJSON { (myResponse) in
            
            self.loader.stopAnimating()
            
            let weather = try! JSONDecoder().decode(Weather.self, from: myResponse.data!)
            
            if let location = weather.location , let current = weather.current {
                self.cityNameLabel.text = "\(location.name!), \(location.country!)"
                self.cityConditionLabel.text = "\(current.condition!.text!)"
                self.cityTemperatureLabel.text = "\(Int(current.temp_c!)) ℃"
                
                let date = location.localtime?.components(separatedBy: " ")
                
                self.navBar.title = "\(date![0])"
                
                let iconString = "https:\(current.condition!.icon!)"
                
                let url = URL(string: iconString)
                
                self.weatherIcon.kf.setImage(with: url)
            }
            
            self.searchButton.isEnabled = true
            self.cityNameLabel.alpha = 1.0
            self.cityConditionLabel.alpha = 1.0
            self.cityTemperatureLabel.alpha = 1.0
            self.weatherIcon.alpha = 1.0
        }
        
    }
    
}
