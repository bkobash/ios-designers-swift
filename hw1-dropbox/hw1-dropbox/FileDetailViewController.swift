//
//  FileDetailViewController.swift
//  hw1-dropbox
//
//  Created by Brian Kobashikawa on 2/1/15.
//  Copyright (c) 2015 Brian Kobashikawa. All rights reserved.
//

import UIKit

class FileDetailViewController: UIViewController {
    
    var actionMenuIsVisible = false;
    var isFavorited = false;

    @IBOutlet weak var lightboxView: UIView!
    @IBOutlet weak var menuView: UIView!
    @IBOutlet weak var menuContentsOnImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        navigationController!.navigationBarHidden = true;
        resetActionMenu();
    }
    
    override func viewDidAppear(animated: Bool) {
        resetActionMenu();
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
    
    func resetActionMenu() {
        
        actionMenuIsVisible = false;
        isFavorited = false;
        
        lightboxView.alpha = 0;
        menuView.frame = CGRectMake(0, -213, 320, 277);
        menuContentsOnImageView.alpha = 0;
    }
    
    func toggleActionMenu() {
        actionMenuIsVisible = !actionMenuIsVisible;
        UIView.animateWithDuration(0.3, animations: {
            self.lightboxView.alpha = self.actionMenuIsVisible ? 0.3 : 0;
            self.menuView.frame = self.actionMenuIsVisible ? CGRectMake(0, 64, 320, 277) : CGRectMake(0, -213, 320, 277);
        });
    }

    @IBAction func onBackButtonTap(sender: AnyObject) {
        navigationController!.popViewControllerAnimated(true);
    }
    @IBAction func onMoreButtonTap(sender: AnyObject) {
        toggleActionMenu();
    }
    @IBAction func onLightboxTap(sender: AnyObject) {
        toggleActionMenu();
    }
    @IBAction func onFavoriteButtonTap(sender: AnyObject) {
        isFavorited = !isFavorited;
        UIView.animateWithDuration(0.3, animations: {
            self.menuContentsOnImageView.alpha = self.isFavorited ? 1 : 0;
        });
        
        
        
    }
}
