//
//  Location.swift
//  LocateMyCar
//
//  Created by Michael Reynolds on 11/3/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import Foundation

// NSCoding Constants
let kNameKey = "name"
let kLatitudeKey = "latitude"
let kLongitudeKey = "longitude"

class Location: NSObject, NSCoding
{
    let name: String
    let latitude: Double
    let longitude: Double
    
    init(name: String, lat: Double, lng: Double)
    {
        self.name = name
        latitude = lat
        longitude = lng
    }
    
    // MARK: - NSCoding
    
    required convenience init?(coder aDecoder: NSCoder)
    {
        guard let name = aDecoder.decodeObjectForKey(kNameKey) as? String

            else { return nil }
        
        self.init(name: name, lat: aDecoder.decodeDoubleForKey(kLatitudeKey), lng: aDecoder.decodeDoubleForKey(kLongitudeKey))
    }
    
    func encodeWithCoder(aCoder: NSCoder)
    {
        aCoder.encodeObject(self.name, forKey: kNameKey)
        aCoder.encodeDouble(self.latitude, forKey: kLatitudeKey)
        aCoder.encodeDouble(self.longitude, forKey: kLongitudeKey)
    }

}
