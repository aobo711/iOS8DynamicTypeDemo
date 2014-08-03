//
//  APIController.swift
//  tableViewSample2
//
//  Created by jintian on 14-7-20.
//  Copyright (c) 2014年 jintian. All rights reserved.
//

import UIKit

protocol APIControllerProtocol {
    func didReceiveAPIResults(results: NSDictionary)
}

class APIController: NSObject {
    
    var delegate: APIControllerProtocol?
    
    func loadNews() {
        
        var urlPath = "http://127.0.0.1:3000/news"
        var url: NSURL = NSURL(string: urlPath)
        var session = NSURLSession.sharedSession()
        var task = session.dataTaskWithURL(url, completionHandler: {data, response, error -> Void in
            
            if(error) {
                // If there is an error in the web request, print it to the console
                println(error.localizedDescription)
            }
            
            var err: NSError?
            var jsonResult = NSJSONSerialization.JSONObjectWithData(data, options: .MutableLeaves, error: &err) as NSDictionary
            
            if(err?) {
                // If there is an error parsing JSON, print it to the console
                println("JSON Error \(err!.localizedDescription)")
            }
            
            self.delegate?.didReceiveAPIResults(jsonResult)
            })
        task.resume()
    }
}
