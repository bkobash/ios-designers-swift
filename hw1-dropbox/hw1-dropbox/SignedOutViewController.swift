//
//  SignedOutViewController.swift
//  hw1-dropbox
//
//  Created by Brian Kobashikawa on 2/2/15.
//  Copyright (c) 2015 Brian Kobashikawa. All rights reserved.
//

import UIKit

class SignedOutViewController: UIViewController {
    
    var jumpToFlow: String! = "";

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //cameFromWelcome = false;
        
        // Do any additional setup after loading the view.
        navigationController!.navigationBarHidden = true;
    }
    
    override func viewDidAppear(animated: Bool) {
        
        // Skip this screen if the user came from the Welcome screen.
        if (jumpToFlow != "") {
            if (jumpToFlow == "create") {
                jumpToFlow = "";
                performSegueWithIdentifier("showCreateAccountScreen", sender:self);
            } else if (jumpToFlow == "signin") {
                jumpToFlow = "";
                performSegueWithIdentifier("showSignInScreen", sender: self);
            }
        }
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
    
    @IBAction func onSignInButtonTap(sender: AnyObject) {
        performSegueWithIdentifier("showSignInScreen", sender: self);
    }
    @IBAction func onCreateAccountButtonTap(sender: AnyObject) {
        performSegueWithIdentifier("showCreateAccountScreen", sender: self);
    }
}
