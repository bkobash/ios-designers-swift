//
//  FilesExistingUserViewController.swift
//  hw1-dropbox
//
//  Created by Brian Kobashikawa on 2/1/15.
//  Copyright (c) 2015 Brian Kobashikawa. All rights reserved.
//

import UIKit

class FilesExistingUserViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }

    override func viewWillAppear(animated: Bool) {
        navigationController!.navigationBarHidden = false;
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if (segue.identifier == "showDetailScreen") {
            var destinationViewController = segue.destinationViewController as FileDetailViewController;
            destinationViewController.hidesBottomBarWhenPushed = true;
        }
    }


    @IBAction func onFileItemTap(sender: AnyObject) {
        performSegueWithIdentifier("showDetailScreen", sender: self);
    }
}
