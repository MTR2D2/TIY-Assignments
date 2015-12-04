//
//  APIController.swift
//  VenueMenu
//
//  Created by Michael Reynolds on 12/3/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import Foundation

class APIController
{
    var delegate: APIControllerProtocol?
    
    init(delegate: APIControllerProtocol)
    {
        self.delegate = delegate
    }
    
    func search(var term: String, location: Location)
    {
        print("searching")
        
        let clientID = "LBFW2A3UA0W1S2AITBI5I2JRTYABPZGFJUQ5L4PGLG1FC2OA"
        let clientSecret = "E3ZAMLUF2YFNE2EZXG0M1MS0GUE21LSGEH4QB4N421T50O40"
        
        let baseURL = "https://api.foursquare.com/v2/venues/search?client_id=\(clientID)&client_secret=\(clientSecret)&v=20130815%20"
        
        term = term.stringByReplacingOccurrencesOfString(" ", withString: "%20")
        
        let locationAndTerm = "&ll=\(location.lat),\(location.lng)&query=\(term)"
        
        let URLString = baseURL + locationAndTerm
        
        if let URL = NSURL(string: URLString)
        {
            print(URLString)
            let session = NSURLSession.sharedSession()
            let task = session.dataTaskWithURL(URL, completionHandler: { (data, _, error) -> Void in
                if error == nil
                {
//                    print("error == nil")
                    if let results = self.parseJSON(data!)
                    {
//                        print(results)
                        let response = results.valueForKey("response") as? NSDictionary ?? NSDictionary()
//                            print(response)
                            if let venues = response.valueForKey("venues") as? [NSDictionary]
                            {
                                print(self.delegate)
                                self.delegate?.didRecieveAPIResults(venues)
                            }
                    }
                }
            })//.resume()
            
            task.resume()
            
        }
        else
        {
            print("URL invalid \(URLString)")
        }

    }
    
    func parseJSON(data: NSData) -> NSDictionary?
    {
        do
        {
            let dictionary = try NSJSONSerialization.JSONObjectWithData(data, options: []) as! NSDictionary
            return dictionary
        }
        catch let error as NSError
        {
            print(error)
            
            return nil
        }
        
    }
}
