//
//  IntroViewController.swift
//  hw2-carousel
//
//  Created by Brian Kobashikawa on 2/8/15.
//  Copyright (c) 2015 Brian Kobashikawa. All rights reserved.
//

import UIKit

class IntroViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var mainScrollView: UIScrollView!
    
    @IBOutlet weak var introImageView: UIImageView!
    @IBOutlet weak var tile1ImageView: UIImageView!;
    @IBOutlet weak var tile2ImageView: UIImageView!;
    @IBOutlet weak var tile3ImageView: UIImageView!;
    @IBOutlet weak var tile4ImageView: UIImageView!;
    @IBOutlet weak var tile5ImageView: UIImageView!;
    @IBOutlet weak var tile6ImageView: UIImageView!;
    
    var tileImageViews: [UIImageView] = [];
    var tilePileAngles: [Double] = [];
    var tilePileCenters: [CGPoint] = [];
    var tileGridCenters: [CGPoint] = [];
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        tileImageViews = [
            tile1ImageView,
            tile2ImageView,
            tile3ImageView,
            tile4ImageView,
            tile5ImageView,
            tile6ImageView
        ];
        tilePileAngles = [
            -10,
            -10,
            10,
            10,
            10,
            -10
        ]
        tilePileCenters = [
            CGPoint(x: 40, y: 550),
            CGPoint(x: 285, y: 540),
            CGPoint(x: 250, y: 440),
            CGPoint(x: 160, y: 540),
            CGPoint(x: 35, y: 430),
            CGPoint(x: 130, y: 440)
            
        ];
        tileGridCenters = [
            tile1ImageView.center,
            tile2ImageView.center,
            tile3ImageView.center,
            tile4ImageView.center,
            tile5ImageView.center,
            tile6ImageView.center
        ];
        
        mainScrollView.frame = CGRect(x: 0, y: 0, width: 320, height: 568);
        mainScrollView.contentSize = introImageView.frame.size;
        mainScrollView.delegate = self;
        
        navigationController?.navigationBarHidden = true;
    }
    
    override func viewWillAppear(animated: Bool) {
        
        var tile: UIImageView,
            angle: Double,
            scale: Float;
        
        for (var i = 0; i < tileImageViews.count; i++) {
            tile = tileImageViews[i];
            angle = tilePileAngles[i];
            scale = (i == 0) ? 1 : 1.75;

            tile.center = tilePileCenters[i];
            tile.transform = CGAffineTransformMakeScale(CGFloat(scale), CGFloat(scale));
            tile.transform = CGAffineTransformRotate(tile.transform, CGFloat(angle * M_PI / 180));
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
    @IBAction func onCreateButtonTap(sender: AnyObject) {
        performSegueWithIdentifier("showCreateScreen", sender: self);
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        var scrollY: Float = Float(scrollView.contentOffset.y),
            tile: UIImageView,
            angle: Float, pileAngle: Double,
            scale: Float, pileScale: Float,
            tileCenter: CGPoint, tilePileCenter: CGPoint, tileGridCenter: CGPoint;
        
        for (var i = 0; i < tileImageViews.count; i++) {
            tile = tileImageViews[i];
            
            tilePileCenter = tilePileCenters[i];
            tileGridCenter = tileGridCenters[i];
            tileCenter = CGPoint(
                x: CGFloat(convertValue(scrollY, 0, 568, Float(tilePileCenter.x), Float(tileGridCenter.x))),
                y: CGFloat(convertValue(scrollY, 0, 568, Float(tilePileCenter.y), Float(tileGridCenter.y)))
            );
            
            pileAngle = tilePileAngles[i];
            angle = convertValue(scrollY, 0, 568, Float(pileAngle), 0);
            
            pileScale = (i == 0) ? 1 : 1.75;
            scale = convertValue(scrollY, 0, 568, pileScale, 1);
            
            tile.center = tileCenter;
            tile.transform = CGAffineTransformMakeScale(CGFloat(scale), CGFloat(scale));
            tile.transform = CGAffineTransformRotate(tile.transform, CGFloat(Double(angle) * M_PI / 180));
        }
    }

}
