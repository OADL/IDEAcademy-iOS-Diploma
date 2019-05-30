//
//  ViewController.swift
//  IDEA_AppsList
//
//  Created by Omar Adel on 5/19/19.
//  Copyright © 2019 Omar Adel. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    var data : [(name: String , category: String , image : String ,value : Float , rate: Double , rateNumber : Int , inAppPurch : Bool)] =
    [
        ("Minecraft: Story Mode", "Games", "minecraftSM", 5.79, 4, 357, true),
        ("Minecraft: Pocket Edition", "Games", "minecraftPE", 7.99, 4, 167, true),
        ("Enlight", "Photo & Video", "enlight", 4.59, 5, 71, false),
        ("Geometry Dash", "Games", "geometrydash", 2.29, 5, 975, false),
        ("Plague Inc.", "Games", "plague", 1.19, 4.5, 629, true),
        ("R.B.I. Baseball 15", "Games", "rbibaseball", 2.29, 4, 12, false),
        ("Heads Up!", "Games", "headsup", 1.19, 4, 5, true),
        ("Monument Valley", "Games", "monvalley", 4.19, 5, 8, true),
        ("Monument Valley 2", "Games", "monvalley2", 5.29, 4.5, 4, false)
    ]
    
    @IBOutlet weak var appsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        appsTableView.delegate = self
        appsTableView.dataSource = self
        appsTableView.allowsSelection = false
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellNumber = indexPath.row
        let cellData = data[cellNumber]
        
        let cell = appsTableView.dequeueReusableCell(withIdentifier: "appcell") as! AppTableViewCell
        
        cell.appNumberLabel.text = "\(cellNumber+1)"
        cell.appNameLabel.text = cellData.name
        cell.appCategoryLabel.text = cellData.category
        cell.buyButton.setTitle("$\(cellData.value)", for: .normal)
        cell.starCosmos.rating = cellData.rate
        cell.starCosmos.text = "(\(cellData.rateNumber))"
        cell.appPurchasesLabel.isHidden = !cellData.inAppPurch
        cell.appImage.image = UIImage(named: cellData.image)
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
}

class CustomUIButton : UIButton {
    
    func editButton() {
        layer.cornerRadius = 3
        layer.borderWidth = 1
        layer.borderColor = #colorLiteral(red: 0.2470588235, green: 0.5882352941, blue: 0.7490196078, alpha: 1)
    }
    
    override open var isHighlighted: Bool{
        didSet{
            backgroundColor = isHighlighted ?  #colorLiteral(red: 0.2470588235, green: 0.5882352941, blue: 0.7490196078, alpha: 1) : UIColor.white
        }
    }
    
}

