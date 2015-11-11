//
//  HighVoltageTableViewController.swift
//  HighVoltage
//
//  Created by Michael Reynolds on 10/23/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import UIKit

protocol ValuesTableViewControllerDelegate
{
    func valueWasChosen(chosenValue: String)
}

class HighVoltageTableViewController: UITableViewController, UIPopoverPresentationControllerDelegate, ValuesTableViewControllerDelegate
{
    @IBOutlet weak var addButton: UIBarButtonItem!
    
    var remainingValues = ["Watts (W)", "Volts (V)", "Amps (A)", "Ohms (Ω)"]
    
    let allValues = ["Watts (W)", "Volts (V)", "Amps (A)", "Ohms (Ω)"]
    
    var visibleValues = [String]()

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        title = "High Voltage"


        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int
    {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        // #warning Incomplete implementation, return the number of rows
        return visibleValues.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier("ElectricityCell", forIndexPath: indexPath) as! ElectricityCell

        // Configure the cell...
        let aCell = visibleValues[indexPath.item]
        cell.valueLabel.text = aCell

        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
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
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    // MARK: - UIPopoverPresentationController Delegate
    
    func adaptivePresentationStyleForPresentationController(controller: UIPresentationController) -> UIModalPresentationStyle
    {
        return UIModalPresentationStyle.None
        //can also just type: return .None
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        if segue.identifier == "ValuesPopoverSegue"
        {
            let destVC = segue.destinationViewController as! ValuesTableViewController
            destVC.values = remainingValues
            destVC.popoverPresentationController?.delegate = self
            destVC.delegate = self //connects
            let contentHeight = 44.0 * CGFloat(remainingValues.count)
            destVC.preferredContentSize = CGSizeMake(200.0, contentHeight)
        }

        
    }

    // MARK: - ValuesTableViewController Delegate
    
    func valueWasChosen(chosenValue: String)
    {
        navigationController?.dismissViewControllerAnimated(true, completion: nil)
        visibleValues.append(chosenValue)
        
        let rowToRemove = (remainingValues as NSArray).indexOfObject(chosenValue)
        remainingValues.removeAtIndex(rowToRemove)
        if remainingValues.count == 0
        {
            self.navigationItem.rightBarButtonItem?.enabled = false
        }
        
        tableView?.reloadData()
    }
    
    // MARK: - Action Handlers
    
    @IBAction func resetValueList(sender: UIBarButtonItem)
    {
        visibleValues.removeAll()
        tableView?.reloadData()
        self.navigationItem.rightBarButtonItem?.enabled = true
        tableView?.reloadData()
        
        remainingValues = allValues
    }
    

}
