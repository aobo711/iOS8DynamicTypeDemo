//
//  DetailViewController.swift
//  iOS8DynamicTypeDemo
//
//  Created by jintian on 14-7-29.
//  Copyright (c) 2014年 NatashaTheRobot. All rights reserved.
//

import UIKit
import WebKit

class DetailViewController: UIViewController {
    
    @IBOutlet var detailTextView : UITextView
    @IBOutlet var titleLabel : UILabel
    @IBOutlet var metaLabel : UILabel
    @IBOutlet var webview : UIWebView


    var backBarButtonItem: UIBarButtonItem!
    var meta: String?
    var newsTitle: String?
    var content: String?
    
    
    var style:String = "<style type=\"text/css\">body{overflow-x:hidden;}*{padding:0;margin:0;font:normal 14px/20px Helvetica Neue;color:#333;text-indent:0;}p{padding:8px 15px;color:#666;word-wrap:break-word;}img{max-width:100%;}</style>"

    init(coder aDecoder: NSCoder!) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        metaLabel.text = meta
        titleLabel.text = newsTitle
        var url = NSURL(string: "http://www.wandoujia.com")
        content = style + content!
        webview.loadHTMLString(content, baseURL: url)
        
    }
    
}