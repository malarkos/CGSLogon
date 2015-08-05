//
//  LoginVC.swift
//  CGSLogon
//
//  Created by Geoff Markley on 30/06/2015.
//  Copyright (c) 2015 Ryan Markley. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {
    
    @IBOutlet weak var txtUsername: UITextField!
    
    @IBOutlet weak var txtPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func signinTapped(sender: UIButton) {
        
        // Authentication code
        var username:NSString = txtUsername.text
        var password:NSString = txtPassword.text
        
        if (username.isEqualToString("") || password.isEqualToString("")) {
            var alertView:UIAlertView = UIAlertView()
            alertView.title = "Login failed!"
            alertView.message = "Please enter correct Username and Password"
            alertView.delegate = self
            alertView.addButtonWithTitle("Ok")
            alertView.show()
        } else {
            
            var alertView:UIAlertView = UIAlertView()
            alertView.title = "Username"
            alertView.message = username as String
            alertView.delegate = self
            alertView.addButtonWithTitle("Ok")
            //alertView.show()
            
            // Create post sting
            var post:NSString = "username=\(username)&password=\(password)"
            
            // Create post data
            NSLog("Postdata: %@", post)
            
            // Location of URL
            var url:NSURL = NSURL(string: "https://www.ormondskiclub.com.au/location/jsonlogin.php")!
            
            // Encode data
            var postData:NSData = post.dataUsingEncoding(NSASCIIStringEncoding)!
            
            var postLength:NSString = String( postData.length )
            
            var request:NSMutableURLRequest = NSMutableURLRequest(URL: url)
            request.HTTPMethod = "POST"
            request.HTTPBody = postData
            request.setValue(postLength as String, forHTTPHeaderField: "Content-Length")
            request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
            request.setValue("application/json", forHTTPHeaderField: "Accept")
            
            // Set response codes
            var reponseError: NSError?
            var response: NSURLResponse?
            
            // Request data
            var urlData: NSData? = NSURLConnection.sendSynchronousRequest(request, returningResponse:&response, error:&reponseError)
            
            if (urlData != nil) {
                
                let res = response as! NSHTTPURLResponse!;
                
                NSLog("Response code: %ld", res.statusCode);
                
                if (res.statusCode >= 200 && res.statusCode < 300)
                {
                    var responseData:NSString  = NSString(data:urlData!, encoding:NSUTF8StringEncoding)!
                    
                    NSLog("Response ==> %@", responseData);
                    
                    var error: NSError?
                    
                    let jsonData:NSDictionary = NSJSONSerialization.JSONObjectWithData(urlData!, options:NSJSONReadingOptions.MutableContainers , error: &error) as! NSDictionary
                    
                    
                    let success:NSInteger = jsonData.valueForKey("success") as! NSInteger
                    
                    //[jsonData[@"success"] integerValue];
                    
                    NSLog("Success: %ld", success);
                    
                    if(success == 1)
                    {
                        NSLog("Login SUCCESS");
                        
                        var prefs:NSUserDefaults = NSUserDefaults.standardUserDefaults()
                        prefs.setObject(username, forKey: "USERNAME")
                        prefs.setInteger(1, forKey: "ISLOGGEDIN")
                        prefs.synchronize()
                        
                        self.dismissViewControllerAnimated(true, completion: nil)
                    } else {
                        var error_msg:NSString
                        
                        if jsonData["error_message"] as? NSString != nil {
                            error_msg = jsonData["error_message"] as! NSString
                        } else {
                            error_msg = "Unknown Error"
                        }
                        var alertView:UIAlertView = UIAlertView()
                        alertView.title = "Sign in Failed!"
                        alertView.message = error_msg as String
                        alertView.delegate = self
                        alertView.addButtonWithTitle("OK")
                        alertView.show()
                        
                    }
                }
                else {
                    var alertView:UIAlertView = UIAlertView()
                    alertView.title = "Sign in Failed!"
                    alertView.message = "Connection Failed"
                    alertView.delegate = self
                    alertView.addButtonWithTitle("OK")
                    alertView.show()
                }
            }
            else
            {
                var alertView:UIAlertView = UIAlertView()
                alertView.title = "Sign in Failed!"
                alertView.message = "Connection Failure"
                if let error = reponseError {
                    alertView.message = (error.localizedDescription)
                }
                alertView.delegate = self
                alertView.addButtonWithTitle("OK")
                alertView.show()            }
        }
    }
}
