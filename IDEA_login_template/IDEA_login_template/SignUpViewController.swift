//
//  SignUpViewController.swift
//  IDEA_login_template
//
//  Created by Omar Adel on 5/17/19.
//  Copyright © 2019 Omar Adel. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {
    //Text Fields outlets
    @IBOutlet weak var nameTxtField: UITextField!
    @IBOutlet weak var emailTxtField: UITextField!
    @IBOutlet weak var usernameTxtField: UITextField!
    @IBOutlet weak var passwordTxtField: UITextField!
    //Labels outlets
    @IBOutlet weak var errorLabel: UILabel!
    //Buttons outlets
    @IBOutlet weak var signUpBtn: WhiteCustomButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //edit the shape of the button
        signUpBtn.editButton()
    }
    //to make the keyboard disappear
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    //when sign up pressed
    @IBAction func signUpPressed(_ sender: UIButton) {
        //get the values of the text fields
        guard let name = nameTxtField.text else { return }
        guard let email = emailTxtField.text else { return }
        guard let username = usernameTxtField.text else { return }
        guard let password = passwordTxtField.text else { return }
        //make sure none of them is empty
        if (name.isEmpty || email.isEmpty || username.isEmpty || password.isEmpty){
            errorLabel.isHidden = false
            return
        }
        //create view of the home view controller
        let view = self.storyboard?.instantiateViewController(withIdentifier: "homeVC") as! HomeViewController
        //send data
        view.data = username
        //show the next view controller
        self.navigationController?.show(view, sender: self)
        //self.present(view, animated: true)
    }
    
}
