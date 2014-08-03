//
//  QuotesTableViewController.swift
//  iOS8DynamicTypeDemo
//
//  Created by Natasha Murashev on 7/19/14.
//  Copyright (c) 2014 NatashaTheRobot. All rights reserved.
//

import UIKit

class QuotesTableViewController: UITableViewController, APIControllerProtocol {

    var quoteCellIdentifier = "QuoteTableViewCell"

    var tableData: NSArray = []
    var api: APIController = APIController()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        NSNotificationCenter.defaultCenter().addObserver(self,
            selector: "onContentSizeChange:",
            name: UIContentSizeCategoryDidChangeNotification,
            object: nil)
        
        tableView.estimatedRowHeight = 89
        tableView.rowHeight = UITableViewAutomaticDimension
        
        self.api.delegate = self
        api.loadNews()
    }
    
    override func viewDidDisappear(animated: Bool)  {
        super.viewDidDisappear(animated)
        
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject) {
        var detailsViewController: DetailViewController = segue.destinationViewController as DetailViewController
        var newsIndex = tableView.indexPathForSelectedRow().row
        var selectedNews = self.tableData[newsIndex] as NSDictionary
        var news = self.tableData[newsIndex] as NSDictionary
        var date = news["date"] as String
        var source = news["source"] as String
        var meta = date + " · " + source
        detailsViewController.meta = meta
        detailsViewController.newsTitle = news["title"] as NSString
        detailsViewController.content = news["content"] as NSString
        
    }
    
    func onContentSizeChange(notification: NSNotification) {
        tableView.reloadData()
    }

    // MARK: - Table view data source

    override func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
        return tableData.count
    }

    override func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell? {
        let cell = tableView.dequeueReusableCellWithIdentifier(quoteCellIdentifier, forIndexPath: indexPath) as QuoteTableViewCell
        
        
        var rowData: NSDictionary = self.tableData[indexPath.row] as NSDictionary
        
        var title = rowData["title"] as String
        var publishedDate: NSString = rowData["date"] as NSString

        var source: NSString = rowData["source"] as NSString
        var quote = Quote(content: title, date: publishedDate, source : source)
        cell.configure(quote: quote)
        
        return cell
    }
    
    func didReceiveAPIResults(results: NSDictionary) {
        var resultsArr: NSArray = results["results"] as NSArray
        dispatch_async(dispatch_get_main_queue(), {
            self.tableData = resultsArr
            self.tableView.reloadData()
            })
    }
    
}
