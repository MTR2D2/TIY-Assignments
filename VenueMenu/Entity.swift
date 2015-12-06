//
//  Entity.swift
//  VenueMenu
//
//  Created by Michael Reynolds on 12/3/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class Entity: NSManagedObject
{
    static func venueWithJSON(dictionary: NSDictionary) -> NSManagedObject
    {
        let managedObjectContext = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
        let entity = NSEntityDescription.entityForName("Venue", inManagedObjectContext: managedObjectContext)!
        let venueObject = NSManagedObject(entity: entity, insertIntoManagedObjectContext: managedObjectContext)
        
        // MARK: 
        
        let name = dictionary.valueForKey("name") as? String ?? "no name"
        
        venueObject.setValue(name, forKey: "name")
        
        return venueObject
    }

// Insert code here to add functionality to your managed object subclass

}
