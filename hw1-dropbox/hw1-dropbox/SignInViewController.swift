//
//  SignInViewController.swift
//  hw1-dropbox
//
//  Created by Brian Kobashikawa on 2/1/15.
//  Copyright (c) 2015 Brian Kobashikawa. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController, UIActionSheetDelegate  {

    @IBOutlet weak var emailAddressField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    @IBOutlet weak var signInButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(animated: Bool) {
        emailAddressField.becomeFirstResponder();
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
    
    @IBAction func onSignInButtonTap(sender: AnyObject) {
        performSegueWithIdentifier("showExistingUserScreen", sender: self);
        navigationController!.popToRootViewControllerAnimated(true);
    }
    @IBAction func onTroubleButtonTap(sender: AnyObject) {
        var actionSheet = UIActionSheet(title: nil, delegate: self, cancelButtonTitle:"Cancel", destructiveButtonTitle: nil, otherButtonTitles: "Forgot Password?", "Single Sign-On");
        actionSheet.showInView(view)
    }
    
    @IBAction func onFieldChange(sender: AnyObject) {
        var emailAddressLength = countElements(emailAddressField.text);
        var passwordLength = countElements(passwordField.text);
        if (emailAddressLength > 0 && passwordLength > 0) {
            signInButton.enabled = true;
        } else {
            signInButton.enabled = false;
        }
        
    }
}
