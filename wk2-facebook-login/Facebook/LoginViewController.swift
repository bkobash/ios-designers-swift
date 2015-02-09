//
//  LoginViewController.swift
//  Facebook
//
//  Created by Brian Kobashikawa on 2/5/15.
//  Copyright (c) 2015 codepath. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var loadingActivityIndicatorView: UIActivityIndicatorView!
    @IBOutlet weak var loadingButtonImageView: UIImageView!
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        
        loginButton.enabled = false;
        loadingButtonImageView.hidden = true;
        loadingActivityIndicatorView.stopAnimating();
    
    }
    
    override func viewDidDisappear(animated: Bool) {
        usernameField.text = "";
        passwordField.text = "";
        loginButton.hidden = false;
    }

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

    @IBAction func onFieldChange(sender: AnyObject) {
        if (usernameField.text.isEmpty || passwordField.text.isEmpty) {
            loginButton.enabled = false;
        } else {
            loginButton.enabled = true;
        }
    }
    @IBAction func onLoginButtonTap(sender: AnyObject) {
        loginButton.hidden = true;
        loadingButtonImageView.hidden = false;
        loadingActivityIndicatorView.startAnimating();
        
        delay(2, { () -> () in
            
            if (self.passwordField.text == "password") {
                self.performSegueWithIdentifier("showFeedScreen", sender: self);
            } else {
                self.loginButton.hidden = false;
                self.loadingButtonImageView.hidden = true;
                self.loadingActivityIndicatorView.stopAnimating();
                
                var alertView = UIAlertView(title: "Password incorrect", message: "Sorry, your password was incorrect. Try again.", delegate: self, cancelButtonTitle: "OK")
                alertView.show()
            }
        });
    }
    
}
