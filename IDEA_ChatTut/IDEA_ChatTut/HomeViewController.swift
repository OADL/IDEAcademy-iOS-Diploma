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

class HomeViewController: UIViewController , UITableViewDelegate , UITableViewDataSource {
    
    @IBOutlet weak var myTableView: UITableView!
    
    var rooms : [Room] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //output.text = Auth.auth().currentUser?.email
        myTableView.delegate = self
        myTableView.dataSource = self
        
        loadRooms()
    }
    
    //===============================================================================

    @IBAction func logoutPressed(_ sender: UIButton) {
        try! Auth.auth().signOut()
        self.dismiss(animated: true)
    }

    @IBAction func didPressAddChatRoom(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "Create Chat Room", message: nil, preferredStyle: .alert)
        alert.addTextField { (textField) in
            textField.placeholder = "Room Name"
        }
        
        let addButton = UIAlertAction(title: "Add", style: .default) { (action) in
            guard let roomName = alert.textFields![0].text else { return }
            self.createChatRoom(name: roomName)
        }
        let dismissButton = UIAlertAction(title: "Dismiss", style: .cancel) { (action) in }
        alert.addAction(addButton)
        alert.addAction(dismissButton)
        self.present(alert, animated: true, completion: nil)
    }
    
    //===============================================================================
    
    func getUsername() {
        let uid = Auth.auth().currentUser?.uid
        
        let db = Database.database().reference()
        
        db.child("Users").child(uid!).child("Username").observeSingleEvent(of: .value) { (response) in
            print(response.value)
        }
        
    }
 
    func createChatRoom(name: String){
        let roomData : [String:String] = ["name" : name]
        let database = Database.database().reference()
        database.child("Rooms").childByAutoId().setValue(roomData)
    }
    
    func loadRooms(){
        let database = Database.database().reference()
        database.child("Rooms").observe(.childAdded) { (response) in
            if let responseData = response.value as? [String: Any] {
                guard let roomName = responseData["name"] as? String else { return }
                let room = Room(ID: response.key , name: roomName)
                self.rooms.append(room)
                self.myTableView.reloadData()
            }
        }
    }
    
    
    //======================================================================================
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let room = self.rooms[indexPath.row]
        let view = self.storyboard?.instantiateViewController(withIdentifier: "ChatVC") as! ChatRoomViewController
        view.room = room
        self.navigationController?.pushViewController(view, animated: true)
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let room = self.rooms[indexPath.row]
        let cell = myTableView.dequeueReusableCell(withIdentifier: "RoomNameCell") as! RoomNameCell
        cell.roomName.text = room.name
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.rooms.count
    }
    
}
