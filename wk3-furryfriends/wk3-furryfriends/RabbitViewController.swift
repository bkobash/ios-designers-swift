//
//  RabbitViewController.swift
//  wk3-furryfriends
//
//  Created by Brian Kobashikawa on 2/10/15.
//  Copyright (c) 2015 Brian Kobashikawa. All rights reserved.
//

import UIKit

class RabbitViewController: UIViewController, UIScrollViewDelegate, UIGestureRecognizerDelegate {
    
    var bunnyScale: CGFloat! = 1.0;
    var bunnyRotation: CGFloat! = 0;

    @IBOutlet weak var mainScrollView: UIScrollView!
    @IBOutlet weak var bunnyImageView: UIImageView!
    @IBOutlet weak var fieldImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        mainScrollView.delegate = self;
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
    
    
    @IBAction func onUpButtonTap(sender: AnyObject) {
        UIView.animateWithDuration(0.2, animations: { () -> Void in
            self.bunnyImageView.center.y = self.bunnyImageView.center.y - 20;
        });
    }
    
    @IBAction func onLeftButtonTap(sender: AnyObject) {
        UIView.animateWithDuration(0.2, animations: { () -> Void in
            self.bunnyImageView.center.x = self.bunnyImageView.center.x - 20;
        });
    }
    
    @IBAction func onRightButtonTap(sender: AnyObject) {
        UIView.animateWithDuration(0.2, animations: { () -> Void in
            self.bunnyImageView.center.x = self.bunnyImageView.center.x + 20;
        });
    }
    
    @IBAction func onDownButtonTap(sender: AnyObject) {
        UIView.animateWithDuration(0.2, animations: { () -> Void in
            self.bunnyImageView.center.y = self.bunnyImageView.center.y + 20;
        });
    }

    @IBAction func onLeafButtonTap(sender: AnyObject) {
        bunnyScale = bunnyScale + 0.5;
        UIView.animateWithDuration(0.2, animations: { () -> Void in
            
            var scaleTransform = CGAffineTransformMakeScale(self.bunnyScale, self.bunnyScale);
            var rotationTransform = self.CGAffineTransformMakeDegreeRotation(self.bunnyRotation);
            var transform = CGAffineTransformConcat(scaleTransform, rotationTransform);
            self.bunnyImageView.transform = transform;
        });
    }
    
    @IBAction func onShowButtonTap(sender: AnyObject) {
        UIView.animateWithDuration(0.2, animations: { () -> Void in
            self.bunnyImageView.alpha = 1;
            self.bunnyImageView.transform = CGAffineTransformMakeScale(self.bunnyScale, self.bunnyScale);
        });
    }
    
    @IBAction func onHideButtonTap(sender: AnyObject) {
        UIView.animateWithDuration(0.2, animations: { () -> Void in
            self.bunnyImageView.alpha = 0;
            self.bunnyImageView.transform = CGAffineTransformMakeScale(0.1, 0.1);
        });
    }
    
    func CGAffineTransformMakeDegreeRotation(rotation: CGFloat) -> CGAffineTransform {
        return CGAffineTransformMakeRotation(rotation * CGFloat(M_PI / 180));
    }
    
    @IBAction func onRotateLeftButtonTap(sender: AnyObject) {
        bunnyRotation = bunnyRotation - 30;
        UIView.animateWithDuration(0.2, animations: { () -> Void in
            var scaleTransform = CGAffineTransformMakeScale(self.bunnyScale, self.bunnyScale);
            var rotationTransform = self.CGAffineTransformMakeDegreeRotation(self.bunnyRotation);
            var transform = CGAffineTransformConcat(scaleTransform, rotationTransform);
            self.bunnyImageView.transform = transform;
        });
    }
    
    @IBAction func onRotateRightButtonTap(sender: AnyObject) {
        bunnyRotation = bunnyRotation + 30;
        UIView.animateWithDuration(0.2, animations: { () -> Void in
            var scaleTransform = CGAffineTransformMakeScale(self.bunnyScale, self.bunnyScale);
            var rotationTransform = self.CGAffineTransformMakeDegreeRotation(self.bunnyRotation);
            var transform = CGAffineTransformConcat(scaleTransform, rotationTransform);
            self.bunnyImageView.transform = transform;
        });
    }
    
    @IBAction func onResetButtonTap(sender: AnyObject) {
        bunnyScale = 1;
        UIView.animateWithDuration(0.2, animations: { () -> Void in
            self.bunnyImageView.transform = CGAffineTransformMakeScale(self.bunnyScale, self.bunnyScale);
        });
    }
    
    @IBAction func onFieldTap(sender: UITapGestureRecognizer) {
        var location = sender.locationInView(view);
        println("Location \(location)");
        
        UIView.animateWithDuration(0.5, animations: { () -> Void in
            self.bunnyImageView.center = location;
        })
    }
    
    @IBAction func onBunnyPan(sender: UIPanGestureRecognizer) {
        var location = sender.locationInView(view);
        self.bunnyImageView.center = location;
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        var yOffset = scrollView.contentOffset.y;
        fieldImageView.frame.origin.y = yOffset / 5;
    }
    
    func gestureRecognizer(gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWithGestureRecognizer otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true;
    }
}
