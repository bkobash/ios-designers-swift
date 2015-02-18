//
//  ViewController.swift
//  wk5-rottentomatoes
//
//  Created by Brian Kobashikawa on 2/17/15.
//  Copyright (c) 2015 Brian Kobashikawa. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    //array example
    var titles = ["Kingsman", "50 Shades of Gray", "Garfield", "The Spongebob Movie", "American Sniper", "Jupiter Ascending"];
    // dictionary example
    var movie = [
        "title": "Seventh Son",
        "cast": "Jeff Bridges",
        "date": "2015"
    ]
    
    var movies: [NSDictionary]! = [];
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView.rowHeight = 111;
        
        var url = NSURL(string: " < rotten tomoatoes api link>")!;
        var request = NSURLRequest(URL: url);
        /*
        NSURLConnection.sendAsynchronousRequest(request: NSURLRequest, queue: NSOperationQueue!) { (NSURLResponse!, <#NSData!#>, <#NSError!#>) -> Void in
            var dictionary = NSJSONSerialization.JSONObjectWithData(data, options:
        },*/
        
        // TODO: Look for SwiftyJSON
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titles.count + 1;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        //println("Indexing path: \(indexPath.row)");
        if (indexPath.row == 0) {
            var cell = tableView.dequeueReusableCellWithIdentifier("TrendingCell") as TrendingCell;
            return cell;
        } else {
            var cell = tableView.dequeueReusableCellWithIdentifier("MovieCell") as MovieCell;
            var title = titles[indexPath.row - 1];
            
            cell.titleLabel.text = title;
            cell.synopsisLabel.text = "English spies and stuff";
            return cell;
        }
    }
}

