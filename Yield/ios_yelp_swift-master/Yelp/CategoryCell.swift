//
//  CategoryCell.swift
//  Yelp
//
//  Created by admin on 9/6/15.
//  Copyright (c) 2015 Timothy Lee. All rights reserved.
//

import UIKit

@objc protocol CategoryCellDelegate: class {
    optional func categoryCell(categoryCell: CategoryCell, changeCategory changeValue:Bool)
}

class CategoryCell: UITableViewCell {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var swichView: UISwitch!
    weak var delegate:CategoryCellDelegate?
    
    var category:Category!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        //self.swichView.addTarget(self, action: "categoryChange", forControlEvents: UIControlEvents.ValueChanged)
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func initWithCategory(category: Category){
        self.category = category
        self.name.text = self.category.name
    }

    @IBAction func categoryChange(sender: AnyObject) {
        if delegate != nil {
            delegate?.categoryCell!(self, changeCategory: self.swichView.on)
        }
    }
}
