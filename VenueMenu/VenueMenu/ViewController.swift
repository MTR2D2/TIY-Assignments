//
//  ViewController.swift
//  VenueMenu
//
//  Created by Michael Reynolds on 11/29/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import UIKit
import CoreData

var userLocation: Location?

protocol LocationManagerProtocol
{
    func didReceiveLocation(location: Location?)
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, LocationManagerProtocol
{
    @IBOutlet weak var tableView: UITableView!
    
    var favorites = [Entity]()
    var locationManager: LocationManager!

    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(animated: Bool)
    {
        super.viewDidAppear(animated)
        
        locationManager = LocationManager(delegate: self)
        locationManager.configureLocationManager()
    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int
    {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return favorites.count
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier("FavoriteCell", forIndexPath: indexPath)
        
        
        return cell
    }
    
    func didReceiveLocation(location: Location?)
    {
        if location != nil
        {
            userLocation = location
        }
        else
        {
            //disable search button
        }
    }

    

}

