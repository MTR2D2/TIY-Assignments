//
//  APIController.swift
//  Forecaster
//
//  Created by Michael Reynolds on 10/29/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import Foundation

class APIController
{
    var delegate: APIControllerProtocol
    
    
    init(delegate: APIControllerProtocol)
    {
        self.delegate = delegate
    }
    
    func searchMapsFor(searchTerm: String)
    {
            let urlPath = "https://maps.googleapis.com/maps/api/geocode/json?address=santa+cruz&components=postal_code:\(searchTerm)&sensor=false"
            let url = NSURL(string: urlPath)
            let session = NSURLSession.sharedSession()
            // not NSURLConnection, use NSURLSession!
            let task = session.dataTaskWithURL(url!, completionHandler: {data, response, error -> Void in
                print("Task completed")
                if error != nil
                {
                    print(error!.localizedDescription)
                }
                else
                {
                    if let dictionary = self.parseJSON(data!)
                    {
                        if let results: NSArray = dictionary["results"] as? NSArray
                        {
                            self.delegate.didReceiveAPIResults(results)
                        }
                    }
                }
            })
            task.resume()
    }
    
    
    func searchWeatherFor(city: City)
    {
        let latitude = city.latitude
        let longitude = city.longitude
        let urlPath = "https://api.forecast.io/forecast/1b3f124941abc3fc2e9ab22e93ba68b4/\(latitude),\(longitude)"
        print(city.latitude) ; print(city.longitude)
        let url = NSURL(string: urlPath)
        let session = NSURLSession.sharedSession()
        // not NSURLConnection, use NSURLSession!
        let task = session.dataTaskWithURL(url!, completionHandler: {data, response, error -> Void in
            print("Task completed")
            if error != nil
            {
                print(error!.localizedDescription)
            }
            else
            {
                if let dictionary = self.parseJSON(data!)
                {
                    if let currently: NSDictionary = dictionary["currently"] as? NSDictionary
                    {
                        self.delegate.didReceiveAPIWeatherResults(currently, city: city)
                    }
                }
            }
        })
        task.resume()
    }

    
    func parseJSON(data: NSData) -> NSDictionary?
    {
        do
        {
            let dictionary: NSDictionary! = try NSJSONSerialization.JSONObjectWithData(data, options: []) as! NSDictionary
            return dictionary
        }
        catch let error as NSError
        {
            print(error)
            return nil
        }
        
    }
 

    
}


//https://api.forecast.io/forecast/APIKEY/LATITUDE,LONGITUDE
