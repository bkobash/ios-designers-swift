//
//  WelcomeViewController.swift
//  hw1-dropbox
//
//  Created by Brian Kobashikawa on 2/1/15.
//  Copyright (c) 2015 Brian Kobashikawa. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet weak var mainScrollView: UIScrollView!
    
    var buttonTapped: String!;
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor(red: 244/255.0, green: 250/255.0, blue: 255/255.0, alpha: 1);
        self.mainScrollView.contentSize = CGSizeMake(960, 568);
        self.mainScrollView.frame = CGRectMake(0, 0, 320, 568);
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func onSignUpTap(sender: AnyObject) {
        buttonTapped = "create";
        self.performSegueWithIdentifier("showLoggedOutRoot", sender:self);
    }
    
    @IBAction func onSignInTap(sender: AnyObject) {
        buttonTapped = "signin";
        self.performSegueWithIdentifier("showLoggedOutRoot", sender:self);
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        var destinationNavController = segue.destinationViewController as UINavigationController;
        var destinationViewController = destinationNavController.viewControllers.first as SignedOutViewController;
        destinationViewController.jumpToFlow = buttonTapped;
        
    }
    
}
