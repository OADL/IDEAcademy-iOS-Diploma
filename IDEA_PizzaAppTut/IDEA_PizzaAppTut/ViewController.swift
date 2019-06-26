//
//  ViewController.swift
//  IDEA_PizzaAppTut
//
//  Created by Omar Adel on 6/19/19.
//  Copyright © 2019 Omar Adel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

    }
    
}

/*
 class ViewController: UIViewController , UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {
 
 var words : [String] = ["Ahmed", "Mohamed" , "Aly"]
 
 @IBOutlet weak var MyCollwctionView: UICollectionView!
 
 override func viewDidLoad() {
 super.viewDidLoad()
 // Do any additional setup after loading the view.
 MyCollwctionView.delegate = self
 MyCollwctionView.dataSource = self
 MyCollwctionView.allowsMultipleSelection = false
 }
 
 func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
 let name = words[indexPath.row]
 let cell = MyCollwctionView.dequeueReusableCell(withReuseIdentifier: "mycell", for: indexPath) as! MyCell
 cell.mylabel.text = name
 
 return cell
 }
 
 func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
 let name = words[indexPath.row]
 
 let height = MyCollwctionView.frame.height
 
 let attributes = UIFont.systemFont(ofSize: 17) != nil ? [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 17)] : [:]
 
 let width = name.size(withAttributes: attributes).width + 40
 
 return CGSize(width: width, height: height)
 }
 
 func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
 return words.count
 }
 }
 */
