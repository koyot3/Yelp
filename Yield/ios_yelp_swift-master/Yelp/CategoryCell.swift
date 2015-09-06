//
//  CategoryCell.swift
//  Yelp
//
//  Created by admin on 9/6/15.
//  Copyright (c) 2015 Timothy Lee. All rights reserved.
//

import UIKit

protocol CategoryCellDelegate: class {
    func categoryCell(categoryCell: CategoryCell, changeCategory changeValue:Bool)
}

class CategoryCell: UITableViewCell {

    @IBOutlet weak var name: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func categoryChange(sender: AnyObject) {
        
    }
}
