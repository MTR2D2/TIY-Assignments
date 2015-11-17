//
//  NewTimeZoneTableViewController.swift
//  GlobalTime
//
//  Created by Michael Reynolds on 11/17/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import UIKit

class NewTimeZoneTableViewController: UITableViewController
{
    var delegate: TimeZoneTableViewControllerDelegate?

    var visibleTimeZones: [String]?
    

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int
    {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return visibleTimeZones!.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier("NewTimeZoneCell", forIndexPath: indexPath) as! NewTimeZoneCell

        let timeZoneName = visibleTimeZones![indexPath.row]
        cell.timeZoneLabel.text = timeZoneName
        
        return cell
    }
    
    // MARK: - Delegate
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        delegate?.zoneWasChosen((visibleTimeZones![indexPath.row]))
        dismissViewControllerAnimated(true, completion: nil)
    }

}
