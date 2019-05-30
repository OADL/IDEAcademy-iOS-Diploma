//
//  ViewController.swift
//  IDEA_TableView
//
//  Created by Omar Adel on 5/18/19.
//  Copyright © 2019 Omar Adel. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var myTable: UITableView!
    var arr : [Int] = [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        myTable.delegate = self
        myTable.dataSource = self
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let sliderCell = myTable.dequeueReusableCell(withIdentifier: "sliderCell")
        
        let cell = myTable.dequeueReusableCell(withIdentifier: "cell") as! TableViewCell
        cell.labelCell.text = "Omar"
        cell.numberLabel.text = "\(arr[indexPath.row])"
        
        if(indexPath.row == 3){
            return sliderCell!
        }
        return cell
    }

    /*func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        <#code#>
    }*/
    
    /*func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        <#code#>
    }*/
    
    /*func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        <#code#>
    }*/
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 25
//         return UITableView.automaticDimension
//    }
    
}

