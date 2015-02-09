//
//  SignInViewController.swift
//  hw2-carousel
//
//  Created by Brian Kobashikawa on 2/8/15.
//  Copyright (c) 2015 Brian Kobashikawa. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController {

    @IBOutlet weak var loginFormView: UIView!
    @IBOutlet weak var loginButtonsView: UIView!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
    
    func focusFields(isFocused: Bool) {
        
        if (!isFocused) {
            view.endEditing(true);
        }
        UIView.animateWithDuration(0.4, animations: { () -> Void in
            if (isFocused) {
                self.loginFormView.frame = CGRect(x: 0, y: -54, width: self.loginFormView.frame.width, height: self.loginFormView.frame.height);
                self.loginButtonsView.frame = CGRect(x: 0, y: 200, width: self.loginButtonsView.frame.width, height: self.loginButtonsView.frame.height);
            } else {
                self.loginFormView.frame = CGRect(x: 0, y: 74, width: self.loginFormView.frame.width, height: self.loginFormView.frame.height);
                self.loginButtonsView.frame = CGRect(x: 0, y: 420, width: self.loginButtonsView.frame.width, height: self.loginButtonsView.frame.height);
            }
        });
    }

    @IBAction func onSignInButtonTap(sender: AnyObject) {
        if (emailField.text.isEmpty) {
            var alertView = UIAlertView(title: "Email Required", message: "Please enter your email address.", delegate: self, cancelButtonTitle: "OK");
            alertView.show();
        } else if (passwordField.text.isEmpty) {
            var alertView = UIAlertView(title: "Password Required", message: "Please enter your password.", delegate: self, cancelButtonTitle: "OK");
            alertView.show();
        } else {
            focusFields(false);
            var alertView = UIAlertView(title: "Signing in...", message: nil, delegate: self, cancelButtonTitle: nil);
            alertView.show();
            delay(2, { () -> () in
                alertView.dismissWithClickedButtonIndex(0, animated: true);
                if (self.passwordField.text == "password") {
                    self.performSegueWithIdentifier("showWelcomeScreen", sender: self);
                } else {
                    var alertView = UIAlertView(title: "Sign In Failed", message: "Incorrect email or password.", delegate: self, cancelButtonTitle: "OK");
                    alertView.show();
                }
            });
        }
    }
    @IBAction func onBackButtonTap(sender: AnyObject) {
        navigationController?.popViewControllerAnimated(true);
    }
    @IBAction func onFieldFocus(sender: AnyObject) {
        focusFields(true);
    }
    @IBAction func onMainViewTap(sender: AnyObject) {
        focusFields(false);
    }
}
