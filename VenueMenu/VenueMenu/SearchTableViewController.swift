//
//  SearchTableViewController.swift
//  VenueMenu
//
//  Created by Michael Reynolds on 12/3/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import UIKit
import CoreData

protocol APIControllerProtocol
{
    func didRecieveAPIResults(results: [NSDictionary])
}

class SearchTableViewController: UITableViewController, UISearchBarDelegate, APIControllerProtocol
{
    @IBOutlet weak var searchBar: UISearchBar!
    
    var searchResults = [NSManagedObject]()
    var apiController: APIController!
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        searchBar.delegate = self
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int
    {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return searchResults.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier("SearchCell", forIndexPath: indexPath)
        
        let venue = searchResults[indexPath.row]
        
        cell.textLabel!.text = venue.valueForKey("name") as? String ?? "no name"

        return cell
    }
    
    func search()
    {
        if let term = searchBar.text, _ = userLocation
        {
            
            //        if userLocation != nil
            //        {
            //
            //        }
            apiController = APIController(delegate: self)
//            apiController.delegate = self
            apiController.search(term, location: userLocation!)
        }

    }
    
    func didRecieveAPIResults(results: [NSDictionary])
    {
        print("did receive api results")
        print(results.first)
        
        for dictionary in results
        {
            let venue = Entity.venueWithJSON(dictionary)
            searchResults.append(venue)
        }
        
        tableView.reloadData()
    }

    
    // MARK: - Search Bar Stuff
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar)
    {
        search()
        print("search button clicked")
    }
    
    func searchBarCancelButtonClicked(searchBar: UISearchBar)
    {
        searchBar.resignFirstResponder()
    }

}