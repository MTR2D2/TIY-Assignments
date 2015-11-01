//
//  MainTableViewController.swift
//  Forecaster
//
//  Created by Michael Reynolds on 10/29/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import UIKit

protocol ModalViewControllerProtocol
{
    func cancelButtonPressed(sender: UIBarButtonItem)
    func zipcodeWasEntered(zipcode: String)
    func returnKeyWasPressed(zipcode: String)
}
protocol APIControllerProtocol
{
    func didReceiveAPIResults(results: NSArray)
}

class MainTableViewController: UITableViewController, ModalViewControllerProtocol, APIControllerProtocol
{
    var api: APIController!
    var cities = Array<City>()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
//        tableView.registerClass(UITableView.self, forCellReuseIdentifier: "MainViewCell")
        
        api = APIController(delegate: self)
//        api.searchMapsFor("32601")
        title = "Sunrise"
        UIApplication.sharedApplication().networkActivityIndicatorVisible = true



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
        return cities.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier("MainViewCell", forIndexPath: indexPath) as! CityTableViewCell
        
        let city = cities[indexPath.row]
        
        cell.cityNameLabel?.text = city.cityName
        cell.temperatureLabel?.text = city.latitude

        // Configure the cell...

        return cell
    }

    
    // MARK: - Navigation

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        if segue.identifier == "ModalViewControllerSegue"
        {
            let destVC = segue.destinationViewController as! UINavigationController
            let modal = destVC.viewControllers[0] as! ModalViewController
            modal.delegate = self //connects
        }
        
    }

    // MARK: - ModalViewController Protocol
    
    func cancelButtonPressed(sender: UIBarButtonItem)
    {
        dismissViewControllerAnimated(true, completion: nil)
    }
    func zipcodeWasEntered(zipcode: String)
    {
        api.searchMapsFor(zipcode)
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    func returnKeyWasPressed(zipcode: String)
    {
        api.searchMapsFor(zipcode)
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    // MARK: - APIController Protocol
    
    func didReceiveAPIResults(results: NSArray)
    {
        dispatch_async(dispatch_get_main_queue(), {
            let city = City.locationWithJSON(results)
            self.cities.append(city)
            self.tableView.reloadData()
            // cannot update UI in any thread but the main thread
            // multi-threading is the computer doing something in the background
            
            UIApplication.sharedApplication().networkActivityIndicatorVisible = false
            // turn the indicator toggle back off
        })
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
}
