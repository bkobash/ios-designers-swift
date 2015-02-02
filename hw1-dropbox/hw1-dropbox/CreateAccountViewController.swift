//
//  CreateAccountViewController.swift
//  hw1-dropbox
//
//  Created by Brian Kobashikawa on 2/1/15.
//  Copyright (c) 2015 Brian Kobashikawa. All rights reserved.
//

import UIKit

class CreateAccountViewController: UIViewController, UIActionSheetDelegate {

    @IBOutlet weak var meterImageView: UIImageView!
    
    @IBOutlet weak var firstNameField: UITextField!
    @IBOutlet weak var lastNameField: UITextField!
    @IBOutlet weak var emailAddressField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    @IBOutlet weak var createButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(animated: Bool) {
        firstNameField.becomeFirstResponder();
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

    @IBAction func onBackButtonTap(sender: AnyObject) {
        navigationController!.popViewControllerAnimated(true);
    }
    
    @IBAction func onCreateButtonTap(sender: AnyObject) {
        var actionSheet = UIActionSheet(title: "Before you can complete your registration, you must accept the Dropbox Terms of Service", delegate: self, cancelButtonTitle:nil, destructiveButtonTitle: nil, otherButtonTitles: "I Agree", "View Terms");
        actionSheet.showInView(view)
    }
    
    @IBAction func onFieldChange(sender: AnyObject) {
        var firstNameLength = countElements(firstNameField.text);
        var lastNameLength = countElements(lastNameField.text);
        var emailAddressLength = countElements(emailAddressField.text);
        var passwordLength = countElements(passwordField.text);
        if (firstNameLength > 0 && lastNameLength > 0 && emailAddressLength > 0 && passwordLength > 0) {
            createButton.enabled = true;
        } else {
            createButton.enabled = false;
        }
    }
    
    @IBAction func onPasswordChange(sender: AnyObject) {
        var passwordLength = countElements(passwordField.text);
        if (passwordLength == 0) {
            meterImageView.image = nil;
        } else if (passwordLength < 4) {
            meterImageView.image = UIImage(named: "create_account_1");
        } else if (passwordLength < 8) {
            meterImageView.image = UIImage(named: "create_account_2");
        } else if (passwordLength < 12) {
            meterImageView.image = UIImage(named: "create_account_3");
        } else {
            meterImageView.image = UIImage(named: "create_account_4");
        }
    }
    
    func actionSheet(actionSheet: UIActionSheet!, clickedButtonAtIndex buttonIndex: Int) {
    // buttonIndex is 0 for Cancel
    // buttonIndex ranges from 1-n for the other buttons.
        if (buttonIndex == 0) {
            firstNameField.resignFirstResponder();
            lastNameField.resignFirstResponder();
            emailAddressField.resignFirstResponder();
            passwordField.resignFirstResponder();
            performSegueWithIdentifier("showNewUserScreen", sender: self);
            navigationController!.popToRootViewControllerAnimated(true);
        } else if (buttonIndex == 1) {
            performSegueWithIdentifier("showTermsScreen", sender: self);
        }
    }
    
}
