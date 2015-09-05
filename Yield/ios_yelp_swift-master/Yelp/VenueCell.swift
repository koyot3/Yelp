//
//  VenueCell.swift
//  Yelp
//
//  Created by admin on 9/5/15.
//  Copyright (c) 2015 Timothy Lee. All rights reserved.
//

import UIKit

class VenueCell: UITableViewCell {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var rateView: UIImageView!
    @IBOutlet weak var address: UILabel!
    @IBOutlet weak var descFood: UILabel!
    @IBOutlet weak var distance: UILabel!
    @IBOutlet weak var venueImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func initWithBusiness(business: Business){
        self.name.text = business.name
        self.rateView.setImageWithURL(business.ratingImageURL)
        self.address.text = business.address
        self.descFood.text = business.categories
        self.distance.text = business.distance
        self.venueImage.setImageWithURL(business.imageURL)
    }

}
