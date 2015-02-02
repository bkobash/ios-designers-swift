//
//  SettingsNewUserViewController.swift
//  hw1-dropbox
//
//  Created by Brian Kobashikawa on 2/1/15.
//  Copyright (c) 2015 Brian Kobashikawa. All rights reserved.
//

import UIKit

class SettingsNewUserViewController: UIViewController {

    @IBOutlet weak var mainScrollView: UIScrollView!
    @IBOutlet weak var settingsImageview: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        mainScrollView.contentSize = settingsImageview.frame.size;
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

    @IBAction func onSignOutButtonTap(sender: AnyObject) {
        //performSegueWithIdentifier("exitToRootScreen", sender:self);
        dismissViewControllerAnimated(true, completion: nil);
    }
}
