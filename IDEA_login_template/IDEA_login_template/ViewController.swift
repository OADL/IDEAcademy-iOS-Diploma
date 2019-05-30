//
//  ViewController.swift
//  IDEA_login_template
//
//  Created by Omar Ade/Users/oadl/Documents/xcode_projects/IDEA/IDEA_login_template/IDEA_login_template/SignUpViewController.swiftl on 5/13/19.
//  Copyright © 2019 Omar Adel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //Text Fields outlets
    @IBOutlet weak var usrnameTxtField: UITextField!
    @IBOutlet weak var passwordTxtField: UITextField!
    //Labels outlets
    @IBOutlet weak var errorLabel: UILabel!
    //Buttons outlets
    @IBOutlet weak var logInBtn: DarkCustomButton!
    @IBOutlet weak var signUPBtn: WhiteCustomButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //To change shape of buttons
        logInBtn.editButton()
        signUPBtn.editButton()
    }
    //To make keyboard disappear
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    //When login pressed
    @IBAction func logInPressed(_ sender: UIButton) {
        //get vlaue of text fields
        guard let username = usrnameTxtField.text else { return }
        guard let password = passwordTxtField.text else { return }
        //make sure they aren't empty
        if (username.isEmpty || password.isEmpty) {
            errorLabel.isHidden = false
            return
        }
        //create view of the home view controller
        let view = self.storyboard?.instantiateViewController(withIdentifier: "homeVC") as! HomeViewController
        //send data
        view.data = username
        //show the next view controller
        self.navigationController?.pushViewController(view, animated: true)
        
    }
    //When sign up pressed
    @IBAction func signUpPressed(_ sender: UIButton) {
        //if the error message shown hide it
        errorLabel.isHidden = true
        //create view of the sign up view controller
        let view = self.storyboard?.instantiateViewController(withIdentifier: "signup") as! SignUpViewController
        //show the next view controller
        self.navigationController?.pushViewController(view, animated: true)
        
    }
}
