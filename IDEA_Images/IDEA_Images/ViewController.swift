//
//  ViewController.swift
//  IDEA_Images
//
//  Created by Omar Adel on 7/12/19.
//  Copyright © 2019 Omar Adel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var Images_CV: UICollectionView!
    
    var imageArray : [UIImage] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        Images_CV.delegate = self
        Images_CV.dataSource = self
        
        for _ in 0...20 {
            imageArray.append(#imageLiteral(resourceName: "iphone_x_tropical"))
            imageArray.append(#imageLiteral(resourceName: "enlight"))
            imageArray.append(#imageLiteral(resourceName: "monvalley"))
        }
        
    }
    
}

extension ViewController : UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = Images_CV.dequeueReusableCell(withReuseIdentifier: "Image_Cell", for: indexPath) as! ImageCollectionViewCell
        
        cell.Image_IV.image = imageArray[indexPath.item]
        
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let view = self.storyboard?.instantiateViewController(withIdentifier: "ImageCV") as! ImageViewController
        
        view.imageToShow = imageArray[indexPath.item]
        
        self.navigationController?.show(view, sender: self)//(view, animated: true, completion: nil)//(view, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = Images_CV.frame.width
        return CGSize(width: width/4 - 1, height: width/4 - 1)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageArray.count
    }

}

