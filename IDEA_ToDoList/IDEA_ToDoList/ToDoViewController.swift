//
//  ToDoViewController.swift
//  IDEA_ToDoList
//
//  Created by Omar Adel on 5/25/19.
//  Copyright © 2019 Omar Adel. All rights reserved.
//

import UIKit

class ToDoViewController: UIViewController , UITextViewDelegate {

    var name = ""
    
    var details = ""
    
    var date = ""
    
    @IBOutlet weak var todoDetails: UITextView!
    
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var navBar: UINavigationItem!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    var sendBackDetails : (() -> ())?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        navBar.title = name
        
        dateLabel.text = date
        
        todoDetails.text = details
        todoDetails.keyboardDismissMode = .interactive
        todoDetails.delegate = self
        todoDetails.becomeFirstResponder()
        
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardOpen), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardClose), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc func keyboardOpen(notification: Notification){
        let info = notification.userInfo!
        let keyboardFrame = (info[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        
        UIView.animate(withDuration: 0.5) {
            self.bottomConstraint.constant = keyboardFrame.height + 10
        }
    }
    
    @objc func keyboardClose(notification: Notification){
        UIView.animate(withDuration: 0.5) {
            self.bottomConstraint.constant = 10
        }
        
        guard let textF = todoDetails.text else { return }
        if textF != "" {
            sendBackDetails?()
        }
    }

    func textViewDidBeginEditing(_ textView: UITextView) {
        textView.tintColor = .clear
        textView.tintColor = .black
    }
    
}
