//
//  Entity+CoreDataProperties.swift
//  VenueMenu
//
//  Created by Michael Reynolds on 12/3/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Entity
{

    @NSManaged var favorite: NSNumber?
    @NSManaged var type: String?
    @NSManaged var phone: String?
    @NSManaged var name: String?
    @NSManaged var lng: NSNumber?
    @NSManaged var lat: NSNumber?
    @NSManaged var icon: String?
    @NSManaged var address: String?

}
