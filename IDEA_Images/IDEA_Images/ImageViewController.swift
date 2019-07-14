//
//  ImageViewController.swift
//  IDEA_Images
//
//  Created by Omar Adel on 7/14/19.
//  Copyright © 2019 Omar Adel. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController  , UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var image: UIImageView!
    
    var imageToShow: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        scrollView.delegate = self
        
        image.image = imageToShow
        
       
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.hidesBarsOnTap = true
        
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        navigationController?.hidesBarsOnTap = false
    }
    
    override var prefersStatusBarHidden: Bool {
        return navigationController?.isNavigationBarHidden == true
    }
    
    override var preferredStatusBarUpdateAnimation: UIStatusBarAnimation {
        return UIStatusBarAnimation.fade
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return image
    }

}
