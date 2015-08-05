//
//  ViewController.swift
//  CGSLogon
//
//  Created by Geoff Markley on 29/06/2015.
//  Copyright (c) 2015 Ryan Markley. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var usernameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewDidAppear(animated: Bool) {
        
        super.viewDidAppear(true)
        
        let prefs:NSUserDefaults = NSUserDefaults.standardUserDefaults()
        
        let isLoggedIn:Int = prefs.integerForKey("ISLOGGEDIN") as Int
        
        if (isLoggedIn != 1) {
            self.performSegueWithIdentifier("goto_login", sender: self)
        } else {
            //self.usernameLabel.text = prefs.valueForKey("USERNAME") as! String
            self.performSegueWithIdentifier("goto_dates", sender: self)
        }
        
        //self.performSegueWithIdentifier("goto_login", sender: self)
       
        
    }
    
    @IBAction func logoutTapped(sender: UIButton) {
        
        // Set ISLOGGEDIN to zero to show logged out
        var prefs:NSUserDefaults = NSUserDefaults.standardUserDefaults()
        prefs.setInteger(0, forKey: "ISLOGGEDIN")
        self.performSegueWithIdentifier("goto_login", sender: self)
    }

}

