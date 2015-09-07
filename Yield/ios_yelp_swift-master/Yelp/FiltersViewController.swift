//
//  FiltersViewController.swift
//  Yelp
//
//  Created by admin on 9/6/15.
//  Copyright (c) 2015 Timothy Lee. All rights reserved.
//

import UIKit

@objc protocol FiltersViewControllerDelegate {
    optional func filtersView(filterView: FiltersViewController, didUpdateFilters filters:[String: AnyObject])
}

class FiltersViewController: UITableViewController, UITableViewDelegate, UITableViewDataSource, CategoryCellDelegate, FiltersViewControllerDelegate {

    var categories:[Category]!
    var switchState = [Int:Bool]()
    
    weak var delegate: FiltersViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        var ca = Category.yelpCategories()
        categories = [Category]()
        for cate in ca {
            categories.append(Category(dictionary: cate))
        }

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        // 0. Categories
        // 1. sort
        // 2. radius
        // 3. deal
        return 4
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        var resultCount:Int = 0
        switch section {
        case 0: if let categories = categories {
            resultCount = categories.count
            }
        case 1: resultCount = 0
        case 2: resultCount = 0
        case 3: resultCount = 0
        default: resultCount = 0
        }
        
        return resultCount
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        var sectionTitle:String!
        switch section {
        case 0: sectionTitle = "Categories"
        case 1: sectionTitle = "Sorts"
        case 2: sectionTitle = "Radius"
        case 3: sectionTitle = "Deal"
        default: sectionTitle = ""
        }
        
        return sectionTitle
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var reuseIdentifier:String!
        switch indexPath.section {
        case 0: reuseIdentifier = "CategoryCell"
        case 1: reuseIdentifier = "CategoryCell"
        case 2: reuseIdentifier = "CategoryCell"
        case 3: reuseIdentifier = "CategoryCell"
        default: reuseIdentifier = ""
        }
        
        
        switch reuseIdentifier {
        case "CategoryCell":
            var cell:CategoryCell!
            cell = tableView.dequeueReusableCellWithIdentifier(reuseIdentifier, forIndexPath: indexPath) as! CategoryCell
            cell.initWithCategory(self.categories[indexPath.row])
            cell.delegate = self
            
            if self.switchState[indexPath.row] != nil {
                cell.swichView.on = self.switchState[indexPath.row]!
            } else {
                cell.swichView.on = false
            }
            
            return cell
        default: var cell:CategoryCell!
        cell = tableView.dequeueReusableCellWithIdentifier(reuseIdentifier, forIndexPath: indexPath) as! CategoryCell
        
        return cell
        }
    }
    
    func categoryCell(categoryCell: CategoryCell, changeCategory changeValue: Bool) {
        let indexPath = self.tableView.indexPathForCell(categoryCell)!
        self.switchState[indexPath.row] = changeValue
    }

    @IBAction func searchByFilters(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
        var filters = [String:AnyObject]()
        
        var selectedCategories = [String]()
        
        if selectedCategories.count > 0 {
            filters["categories"] = selectedCategories
        }
        
        for(row, isSelected) in self.switchState {
            if isSelected {
                selectedCategories.append(self.categories[row].code)
            }
        }
        
        delegate?.filtersView!(self, didUpdateFilters: filters)
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
