//
//  CreateAccountRootViewController.swift
//  hw1-dropbox
//
//  Created by Brian Kobashikawa on 2/1/15.
//  Copyright (c) 2015 Brian Kobashikawa. All rights reserved.
//

import UIKit

class CreateAccountRootViewController: UIViewController {
    
    var cameFromWelcome: Bool!;

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //cameFromWelcome = false;

        // Do any additional setup after loading the view.
        navigationController!.navigationBarHidden = true;
    }
    
    override func viewDidAppear(animated: Bool) {
        if (cameFromWelcome != nil && cameFromWelcome == true) {
            cameFromWelcome = false;
            self.performSegueWithIdentifier("showCreateAccountScreen", sender:self);
            
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
