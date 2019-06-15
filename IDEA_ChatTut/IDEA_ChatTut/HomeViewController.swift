//
//  HomeViewController.swift
//  IDEA_ChatTut
//
//  Created by Omar Adel on 6/12/19.
//  Copyright © 2019 Omar Adel. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

class HomeViewController: UIViewController {

    @IBOutlet weak var output: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        output.text = Auth.auth().currentUser?.email
    }

    @IBAction func logoutPressed(_ sender: UIButton) {
        try! Auth.auth().signOut()
        self.dismiss(animated: true)
    }

    func getUsername() {
        let uid = Auth.auth().currentUser?.uid
        
        let db = Database.database().reference()
        
        db.child("Users").child(uid!).child("Username").observeSingleEvent(of: .value) { (response) in
            print(response.value)
        }
    }
    
}
