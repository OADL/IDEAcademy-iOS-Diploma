//
//  ViewController.swift
//  IDEA_ChatTut
//
//  Created by Omar Adel on 6/12/19.
//  Copyright © 2019 Omar Adel. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase



class ViewController: UIViewController {

    
    
    var currentPage : segmentSelect = .login
    
    @IBOutlet weak var usernameTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var emailTF: UITextField! {
        didSet {
            emailTF.isHidden = true
        }
    }
    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var mySegment: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let swipeleft = UISwipeGestureRecognizer(target: self, action: #selector(didDetectSwipe))
        swipeleft.direction = .left
        self.view.addGestureRecognizer(swipeleft)
        
        let swiperight = UISwipeGestureRecognizer(target: self, action: #selector(didDetectSwipe))
        swiperight.direction = .right
        self.view.addGestureRecognizer(swiperight)
    }
    
    @objc func didDetectSwipe(_ sender: UISwipeGestureRecognizer){
        switch sender.direction {
        case .right:
            mySegment.selectedSegmentIndex = 0
            mySegment.sendActions(for: .valueChanged)
            print("right")
        case .left:
            mySegment.selectedSegmentIndex = 1
            mySegment.sendActions(for: .valueChanged)
            print("left")
        default:
            print("no")
        }
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if Auth.auth().currentUser != nil {
            let homeview = self.storyboard?.instantiateViewController(withIdentifier: "homeNC")
            self.present(homeview!, animated: true)
        }
    }

    func validateFields () -> Bool {
        if (usernameTF.text?.isEmpty == false && passwordTF.text?.isEmpty == false && (emailTF.text?.isEmpty == false && currentPage == .register)){
            return true
        }else {
            return false
        }
    }
    
    @IBAction func segmentChanged(_ sender: UISegmentedControl) {
        if let selectedEnum = segmentSelect.init(rawValue: sender.selectedSegmentIndex) {
            currentPage = selectedEnum
            switch selectedEnum {
            case .login:
                emailTF.isHidden = true
                submitButton.setTitle("Login", for: .normal)
            case .register:
                emailTF.isHidden = false
                submitButton.setTitle("Register", for: .normal)
            }
        }
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        guard let email = emailTF.text , let password = passwordTF.text else { return }
        switch currentPage {
        case .login:
            Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
                if error == nil {
                    let homeview = self.storyboard?.instantiateViewController(withIdentifier: "homeNC")
                    
                    self.navigationController?.pushViewController(homeview!, animated: true)
                }else {
                    print(error)
                }
            }
        case .register:
            if validateFields() {
                
                Auth.auth().createUser(withEmail: email, password: password) { (result,error) in
                    if(error == nil) {
                        let data : [String : String] =
                            [ "Username" : self.usernameTF.text! ,
                                "Email" : self.emailTF.text! ]
                        let db = Database.database().reference()
                        db.child("Users").child(result!.user.uid).setValue(data)
                    }else {
                        print(error)
                    }
                    
                }
            }else {
                print("error!")
            }
        }
    }
}

