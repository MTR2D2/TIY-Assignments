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
    func didReceiveAPIWeatherResults(results: NSDictionary, city: City)
}

class MainTableViewController: UITableViewController, ModalViewControllerProtocol, APIControllerProtocol
{
    var api: APIController!
    var cities = [City]()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
//        tableView.registerClass(UITableView.self, forCellReuseIdentifier: "MainViewCell")
        
        api = APIController(delegate: self)
        api.searchMapsFor("32801")
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
        
        if city.weather != nil
        {
            cell.temperatureLabel?.text = String(city.weather!.temperature)
        }
        
        print(city.weather?.temperature)
        

        // Configure the cell...

        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        let showDetailVC = storyboard?.instantiateViewControllerWithIdentifier("showDetailVC") as! ShowDetailViewController
        showDetailVC.city = cities[indexPath.row]
        navigationController?.pushViewController(showDetailVC, animated: true)
        
        // better way to transistion view controllers without delegates.
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
            
        
            let api = APIController(delegate: self)
            api.searchWeatherFor(city)
            
        })
    }
    
    func didReceiveAPIWeatherResults(results: NSDictionary, city: City)
    {
        dispatch_async(dispatch_get_main_queue(), {
            let weather = WeatherConditions.weatherWithJSON(results)
            
            for x in self.cities
            {
                if x.cityName == city.cityName
                {
                    x.weather = weather
                }
            }
            
            self.tableView.reloadData()
            
            
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
