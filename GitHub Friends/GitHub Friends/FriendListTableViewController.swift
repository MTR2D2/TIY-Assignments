//
//  ViewController.swift
//  GitHub Friends
//
//  Created by Michael Reynolds on 10/27/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import UIKit

protocol APIControllerProtocol
{
    func didReceiveAPIResults(results: NSArray)
}

class FriendListTableViewController: UITableViewController, APIControllerProtocol
{

    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        api = APIController(delegate: self)
        
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "FriendCell")

    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int
    {
        1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        10
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier("FriendCell", forIndexPath: indexPath)
        
        return cell
    }


}

