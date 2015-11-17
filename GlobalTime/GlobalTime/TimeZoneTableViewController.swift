//
//  TableViewController.swift
//  GlobalTime
//
//  Created by Michael Reynolds on 11/17/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import UIKit

protocol TimeZoneTableViewControllerDelegate
{
    func zoneWasChosen(chosenZone: String)
}


class TimeZoneTableViewController: UITableViewController, TimeZoneTableViewControllerDelegate
{
    var visibleCards = [String]()
    
    var allTimeZones = NSTimeZone.knownTimeZoneNames()

    
    @IBOutlet weak var addButton: UIBarButtonItem!
    

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
         self.clearsSelectionOnViewWillAppear = false
         self.navigationItem.leftBarButtonItem = self.editButtonItem()
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
        return visibleCards.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier("TimeZoneCell", forIndexPath: indexPath) as! TimeZoneCell

        // Configure the cell...
        let zoneName = visibleCards[indexPath.row]
        cell.zoneLabel.text = zoneName
        cell.clock.timezone = NSTimeZone(name: zoneName)

        return cell
    }


    
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool
    {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    

    
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath)
    {
        if editingStyle == .Delete
        {
            visibleCards.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        }
        else if editingStyle == .Insert
        {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

    
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath)
    {

    }
    

    
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool
    {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    
    // MARK: - Delegate
    
    func zoneWasChosen(chosenZone: String)
    {
        visibleCards.append(chosenZone)
        tableView!.reloadData()
    }
    

    // MARK: - Navigation

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        if segue.identifier == "ModalSegue"
        {
            let nav = segue.destinationViewController as! UINavigationController
            let destVC = nav.topViewController as! NewTimeZoneTableViewController
            destVC.visibleTimeZones = allTimeZones
            destVC.delegate = self
        }

    }

}
