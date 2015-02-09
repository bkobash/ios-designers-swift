//
//  CreateViewController.swift
//  hw2-carousel
//
//  Created by Brian Kobashikawa on 2/8/15.
//  Copyright (c) 2015 Brian Kobashikawa. All rights reserved.
//

import UIKit

class CreateViewController: UIViewController {

    @IBOutlet weak var createFormView: UIView!
    @IBOutlet weak var createButtonView: UIView!
    
    @IBOutlet weak var firstNameField: UITextField!
    @IBOutlet weak var lastNameField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var termsView: UIView!
    @IBOutlet weak var termsCheckboxButton: UIButton!
    
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
                self.createFormView.frame = CGRect(x: 0, y: -28, width: self.createFormView.frame.width, height: self.createFormView.frame.height);
                self.createButtonView.frame = CGRect(x: 0, y: 290, width: self.createButtonView.frame.width, height: self.createButtonView.frame.height);
            } else {
                self.createFormView.frame = CGRect(x: 0, y: 74, width: self.createFormView.frame.width, height: self.createFormView.frame.height);
                self.createButtonView.frame = CGRect(x: 0, y: 420, width: self.createButtonView.frame.width, height: self.createButtonView.frame.height);
            }
        });
    }

    @IBAction func onFieldFocus(sender: AnyObject) {
        focusFields(true);
    }
    @IBAction func onMainViewTap(sender: AnyObject) {
        focusFields(false);
    }
    @IBAction func onTermsCheckboxTap(sender: AnyObject) {
        termsCheckboxButton.selected = !termsCheckboxButton.selected;
    }
    @IBAction func onTermsLinkTap(sender: AnyObject) {
        performSegueWithIdentifier("showTermsScreen", sender: self);
    }

    @IBAction func onBackButtonTap(sender: AnyObject) {
        navigationController?.popViewControllerAnimated(true);
    }
    @IBAction func onCreateButtonTap(sender: AnyObject) {
        if (firstNameField.text.isEmpty) {
            var alertView = UIAlertView(title: "First Name Required", message: "Please enter your first name.", delegate: self, cancelButtonTitle: "OK");
            alertView.show();
        } else if (lastNameField.text.isEmpty) {
            var alertView = UIAlertView(title: "Last Name Required", message: "Please enter your last name.", delegate: self, cancelButtonTitle: "OK");
            alertView.show();
        } else if (emailField.text.isEmpty) {
            var alertView = UIAlertView(title: "Email Required", message: "Please enter your email address.", delegate: self, cancelButtonTitle: "OK");
            alertView.show();
        } else if (passwordField.text.isEmpty) {
            var alertView = UIAlertView(title: "Password Required", message: "Please enter a password.", delegate: self, cancelButtonTitle: "OK");
            alertView.show();
        } else if (!termsCheckboxButton.selected) {
            focusFields(false);
            UIView.animateWithDuration(0.1, animations: { () -> Void in
                self.termsView.center = CGPoint(x: 180, y: 291);
                }, completion: { (Bool) -> Void in
                    UIView.animateWithDuration(0.5, delay: 0, usingSpringWithDamping: 0.3, initialSpringVelocity: 20, options: nil, animations: { () -> Void in
                        self.termsView.center = CGPoint(x: 160, y: 291);
                        }, completion: nil);
            });
        } else {
            focusFields(false);
            var alertView = UIAlertView(title: "Creating a Dropbox...", message: nil, delegate: self, cancelButtonTitle: nil);
            alertView.show();
            delay(2, { () -> () in
                alertView.dismissWithClickedButtonIndex(0, animated: true);
                self.performSegueWithIdentifier("showWelcomeScreen", sender: self);
            });
        }
    }
    
}
