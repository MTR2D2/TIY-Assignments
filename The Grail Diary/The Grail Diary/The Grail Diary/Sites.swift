//
//  Sites.swift
//  The Grail Diary
//
//  Created by Michael Reynolds on 10/19/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import Foundation

class Sites
{
    var name: String
    var built: String
    var location: String
    
    init(siteDictionary: NSDictionary)
    {
        name = siteDictionary["name"] as! String
        built = siteDictionary["built"] as! String
        location = siteDictionary["location"] as! String
    }
}
