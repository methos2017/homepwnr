//
//  ItemCell.swift
//  homepwnr
//
//  Created by methos on 14.02.17.
//  Copyright © 2017 methos. All rights reserved.
//

import UIKit

class ItemCell: UITableViewCell {
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var serialNumbersLabel: UILabel!
    @IBOutlet var valueLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        nameLabel.adjustsFontForContentSizeCategory = true
        serialNumbersLabel.adjustsFontForContentSizeCategory = true
        valueLabel.adjustsFontForContentSizeCategory = true
        
        
        
    }
    
    
}
