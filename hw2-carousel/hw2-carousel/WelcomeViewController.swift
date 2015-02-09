//
//  WelcomeViewController.swift
//  hw2-carousel
//
//  Created by Brian Kobashikawa on 2/8/15.
//  Copyright (c) 2015 Brian Kobashikawa. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var mainScrollView: UIScrollView!
    @IBOutlet weak var mainPageControl: UIPageControl!
    @IBOutlet weak var ctaView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        mainScrollView.frame = CGRect(x: 0, y: 0, width: 320, height: 568);
        mainScrollView.contentSize = CGSize(width: 1280, height: 568);
        mainScrollView.delegate = self;
    }
    
    override func viewWillAppear(animated: Bool) {
        ctaView.alpha = 0;
        ctaView.hidden = true;
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
    
    @IBAction func onStartButtonTap(sender: AnyObject) {
        performSegueWithIdentifier("showFeedScreen", sender: self);
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        var scrollX = scrollView.contentOffset.x;
        var page = Int(scrollX / 320);
        mainPageControl.currentPage = page;
        if ((page == 3 && ctaView.hidden) || (page != 3 && !ctaView.hidden)) {
            if (page == 3) {
                ctaView.hidden = false;
            }
            UIView.animateWithDuration(0.3, animations: { () -> Void in
                self.ctaView.alpha = (self.ctaView.alpha == 0) ? 1 : 0;
            }, completion: { (Bool) -> Void in
                if (page != 3) {
                    self.ctaView.hidden = true;
                }
            });
            
        }
    }

}
