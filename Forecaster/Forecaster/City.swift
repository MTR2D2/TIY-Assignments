//
//  City.swift
//  Forecaster
//
//  Created by Michael Reynolds on 10/29/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import Foundation

class City
{
    let cityName: String
    let latitude: String
    let longitude: String
    
    var weather: WeatherConditions?
    
    init(cityName: String, latitude: String, longitude: String, weather: WeatherConditions?)
    {
        self.cityName = cityName
        self.latitude = latitude
        self.longitude = longitude
        
        if weather != nil
        {
            self.weather = weather!
        }
        else
        {
            self.weather = nil
        }
    }
    
    static func locationWithJSON(results: NSArray) -> City
    {
        var city: City
        var cityName = ""
        var latStr = ""
        var lngStr = ""
        
        if results.count > 0
        {
            for result in results
            {
                let formatted_address = result["formatted_address"] as? String
                if formatted_address != nil
                {
                    let addressComponents = formatted_address!.componentsSeparatedByString(",")
                    cityName = String(addressComponents[0])
                }
                
                let geometry = result["geometry"] as? NSDictionary
                if geometry != nil
                {
                    let latlong = geometry?["location"] as? NSDictionary
                    if latlong != nil
                    {
                        let lat = latlong?["lat"] as! Double
                        let lng = latlong?["lng"] as! Double
                        
                        latStr = String(lat)
                        lngStr = String(lng)
                        
                    }
                }
                
            }
            
        }
        city = City(cityName: cityName, latitude: latStr, longitude: lngStr, weather: nil)
        return city
    }

}
