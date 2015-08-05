//
//  SignupVC.swift
//  CGSLogon
//
//  Created by Geoff Markley on 30/06/2015.
//  Copyright (c) 2015 Ryan Markley. All rights reserved.
//

import UIKit

class SignupVC: UIViewController {

    @IBOutlet weak var txtUsername: UITextField!
    
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtConfirmPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func signupTapped(sender: UIButton) {
        
        var username:NSString = txtUsername.text as NSString
        var password:NSString = txtPassword.text as NSString
        var confirm_password:NSString = txtConfirmPassword.text as NSString
        
        if (username.isEqualToString("") || password.isEqualToString("")) {
            var alertView:UIAlertView = UIAlertView()
            alertView.title = "Sign up failed!"
            alertView.message = "Please enter Username and Password"
            alertView.delegate = self
            alertView.addButtonWithTitle("Ok")
            alertView.show()
        }
    }
    
    @IBAction func gotoLogin(sender: UIButton) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
}
