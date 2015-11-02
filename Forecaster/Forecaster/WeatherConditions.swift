//
//  WeatherConditions.swift
//  Forecaster
//
//  Created by Michael Reynolds on 10/29/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import Foundation

struct WeatherConditions
{
    let temperature: String
    
    init(temp: String)
    {
        self.temperature = temp
      
    }
    
    static func weatherWithJSON(results: NSDictionary) -> WeatherConditions
    {
        var weather: WeatherConditions
        var temperature = ""
        
        if results.count > 0
        {
 //           if let currently = results["currently"] as? NSDictionary
 //           {
                temperature = String(results["temperature"] as! Double)
 //           }
        }
        
        weather = WeatherConditions(temp: temperature)
        return weather
    }
    
}
