//
//  ViewController.swift
//  IDEA_ToDoList
//
//  Created by Omar Adel on 5/22/19.
//  Copyright © 2019 Omar Adel. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet weak var noOfItemsLabel: UILabel!
    
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var listTableView: UITableView!
    
    var data: [ToDoListModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        retrieveData()
        //======================
        noOfItemsLabel.text = "\(data.count) Things to do"
        //======================
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        //======================
        listTableView.delegate = self
        listTableView.dataSource = self
        listTableView.tableFooterView = UIView()
        listTableView.keyboardDismissMode = .interactive
        //======================
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardOpen), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardClose), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc func keyboardOpen(notification: Notification){
        let info = notification.userInfo!
        let keyboardFrame = (info[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        
        self.bottomConstraint.constant = keyboardFrame.height
    }
    
    @objc func keyboardClose(notification: Notification){
        self.bottomConstraint.constant = 20
    }
    
    //=============================
    func saveData(){
        UserDefaults.standard.set(try? PropertyListEncoder().encode(data), forKey: "data")
    }
    
    func retrieveData(){
        if let out = UserDefaults.standard.value(forKey: "data") as? Data {
            if let alldata = try? PropertyListDecoder().decode(Array<ToDoListModel>.self , from: out) {
                data = alldata
            }
        }
    }
    //==============================
    func getCurrentDate() -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        return formatter.string(from: Date())
    }
    //==============================
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
        
            let cell = listTableView.dequeueReusableCell(withIdentifier: "todocell") as! ToDoListCell
            
            cell.todoLabel.text = data[indexPath.row].name
            
            cell.selectionStyle = .none
            
            return cell
            
        }else {

            let cell = listTableView.dequeueReusableCell(withIdentifier: "newitemcell") as! AddNewCell

            cell.addNewToDo = { [unowned self] in

                let model = ToDoListModel(name: cell.newToDoTextField.text!,text: "",date: self.getCurrentDate())
                self.data.append(model)
                self.listTableView.reloadData()
                self.noOfItemsLabel.text = "\(self.data.count) Things to do"
                cell.newToDoTextField.text = ""
                self.saveData()

            }

            return cell

        }

    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            let view = self.storyboard?.instantiateViewController(withIdentifier: "detailsVC") as! ToDoViewController
            
            view.name = data[indexPath.row].name
            view.details = data[indexPath.row].text
            view.date = data[indexPath.row].date
            
            view.sendBackDetails = { [unowned self] in
                self.data[indexPath.row].text = view.todoDetails.text
                self.saveData()
            }
            
            self.navigationController?.show(view, sender: self)
        }
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let delete = UITableViewRowAction(style: .destructive, title: "Delete") { (action, indexPath) in
            self.data.remove(at: indexPath.row)
            self.listTableView.deleteRows(at: [indexPath], with: .automatic)
            self.saveData()
            self.noOfItemsLabel.text = "\(self.data.count) Things to do"
        }
        
        let edit = UITableViewRowAction(style: .default, title: "Edit") { (action, indexPath) in
            let alertController = UIAlertController(title: "Edit Name", message: nil	, preferredStyle: .alert)
            
            alertController.addTextField(configurationHandler: { (textField: UITextField) in
                textField.placeholder = "New Name"
            })
            
            let cancelAction = UIAlertAction(title: "Cancel", style: .destructive, handler: { (action: UIAlertAction) in })
            
            let doneAction = UIAlertAction(title: "Done", style: .cancel, handler: { (action: UIAlertAction) in
                let name = alertController.textFields![0]
                if name.text != ""{
                    self.data[indexPath.row].name = name.text!
                    self.listTableView.reloadData()
                    self.saveData()
                }
            })
            
            alertController.addAction(doneAction)
            
            alertController.addAction(cancelAction)
            
            self.present(alertController,animated: true)
        }
        
        edit.backgroundColor = #colorLiteral(red: 0, green: 0.5898008943, blue: 1, alpha: 1)
        
        return [delete, edit]
    }
    
    func tableView(_ tableView: UITableView, didHighlightRowAt indexPath: IndexPath) {
        listTableView.cellForRow(at: indexPath)?.backgroundColor = #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 0.5)
    }
    
    func tableView(_ tableView: UITableView, didUnhighlightRowAt indexPath: IndexPath) {
        listTableView.cellForRow(at: indexPath)?.backgroundColor = .clear
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
             return data.count
        }
        else{
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        if indexPath.section == 0 {
            return true
        }
        else{
            return false
        }
    }
    
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        if indexPath.section == 1 {
            return nil
        }else {
            return indexPath
        }
    }
    
}

