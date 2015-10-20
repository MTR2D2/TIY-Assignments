//
//  TodoTableViewController.swift
//  ToDo
//
//  Created by Michael Reynolds on 10/20/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import UIKit
import CoreData

class TodoTableViewController: UITableViewController, UITextFieldDelegate
{
    let managedObjectContext = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
    var itemDescription = Array<ToDoCore>()

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        title = "Get em' Done"
        
//        let fetchRequest = NSFetchRequest(entityName: "ToDoCore")
//        do
//        {
//            let fetchResults = try managedObjectContext.executeFetchRequest(fetchRequest) as? [Counter]
//            counters = fetchResults!
//        }
//        catch
//        {
//            let nserror = error as NSError
//            NSLog("Unresoved error \(nserror), \(nserror.userInfo)")
//            abort()
//        }

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
        return itemDescription.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ToDoList", forIndexPath: indexPath) as! ToDoCell

        // Configure the cell...
        
        let aTask = itemDescription[indexPath.row]
        if aTask.something == nil
        {
            cell.toDoText.becomeFirstResponder()
        }
        else
        {
            cell.toDoText.text = aTask.something
        }

        return cell
    }


    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool
    {
        return true
    }

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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
//     MARK: TextField Delegate
    
    func textFieldShouldReturn(toDoText: UITextField) -> Bool
    {
        var rc = false //rc stands for return code
        
        if toDoText.text != ""
        {
            rc = true
            let contentView = toDoText.superview
            let cell = contentView?.superview as! ToDoCell
            let indexPath = tableView.indexPathForCell(cell)
            // tableView, here is the cell, give me the indexPath
            let aTask = itemDescription[indexPath!.row]
            aTask.something = toDoText.text
            toDoText.resignFirstResponder()
            saveContext()
        }
        
        return rc
    }
    

    // MARK: Action Handlers
    
    @IBAction func newTask(sender: UIBarButtonItem)
    {
        let aTask = NSEntityDescription.insertNewObjectForEntityForName("ToDoCore", inManagedObjectContext: managedObjectContext) as! ToDoCore
        itemDescription.append(aTask)
        tableView.reloadData()
//        saveContext()
    }
    
    @IBAction func doneButton(sender: UIButton)
    {
    }
    
    //MARK: - Private
    
    func saveContext()
    {
        do
        {
            try managedObjectContext.save()
        }
        catch
        {
            let nserror = error as NSError
            NSLog("Unresoved error \(nserror), \(nserror.userInfo)")
            abort()
        }
    }

}
