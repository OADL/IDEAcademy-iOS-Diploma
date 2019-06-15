//
//  ChatRoomViewController.swift
//  IDEA_ChatTut
//
//  Created by Omar Adel on 6/15/19.
//  Copyright © 2019 Omar Adel. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseAuth

class ChatRoomViewController: UIViewController {

    var room : Room?
    @IBOutlet weak var dataTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func didPressSend(_ sender: UIButton) {
        if let message = dataTF.text, message.isEmpty == false {
            getUsername { (username) in
                self.sendMessage(message: message,user: username)
            }
            
        }
    
    }
    
    func sendMessage(message: String, user: String){
        let data : [String : String ] = ["text" : message, "user": user]
        let database = Database.database().reference()
        database.child("Rooms").child(room!.ID).child("Messages").childByAutoId().setValue(data)
    }
    
    func getUsername( completion : @escaping (String) -> ()){
        if let currentUserId = Auth.auth().currentUser?.uid {
            let database = Database.database().reference()
            database.child("Users").child(currentUserId).child("username").observeSingleEvent(of: .value) { (response) in
                if let username = response.value as? String {
                    completion(username)
                }
            }
        }
    }
}
