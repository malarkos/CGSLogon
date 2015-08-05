//
//  DateVC.swift
//  CGSLogon
//
//  Created by Geoff Markley on 3/07/2015.
//  Copyright (c) 2015 Ryan Markley. All rights reserved.
//

import UIKit

class DateVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //let addButton = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: "logoutUser:")
        //self.navigationItem.rightBarButtonItem = addButton
        
        
    }
    @IBAction func logoutTapped(sender: UIButton) {
        var prefs:NSUserDefaults = NSUserDefaults.standardUserDefaults()
        prefs.setInteger(0, forKey: "ISLOGGEDIN")
        self.performSegueWithIdentifier("goto_login2", sender: self)
    }
    
   /* func logoutUser(sender: AnyObject) {
        var prefs:NSUserDefaults = NSUserDefaults.standardUserDefaults()
        prefs.setInteger(0, forKey: "ISLOGGEDIN")
        self.performSegueWithIdentifier("goto_login2", sender: self)

    }*/

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
