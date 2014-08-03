//
//  QuoteTableViewCell.swift
//  iOS8DynamicTypeDemo
//
//  Created by Natasha Murashev on 7/19/14.
//  Copyright (c) 2014 NatashaTheRobot. All rights reserved.
//

import UIKit

class QuoteTableViewCell: UITableViewCell {

    @IBOutlet var quoteContentLabel: UILabel
    @IBOutlet var dateLabel: UILabel
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func configure(#quote : Quote) {
        
        quoteContentLabel.text = quote.content
        quoteContentLabel.accessibilityLabel = "Quote Content"
        quoteContentLabel.accessibilityValue = quote.content
        
        dateLabel.text = quote.date
        dateLabel.accessibilityLabel = "Quote Scenario"
        dateLabel.accessibilityValue = quote.date
        
        
//        quoteContentLabel.font = UIFont.preferredFontForTextStyle(UIFontTextStyleHeadline)
//        dateLabel.font = UIFont.preferredFontForTextStyle(UIFontTextStyleSubheadline)
    }

}
