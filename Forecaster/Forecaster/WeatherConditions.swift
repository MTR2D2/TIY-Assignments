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
    let feelsLike: String
    let icon: String
    
    init(temp: String, feelsLike: String, icon: String)
    {
        self.temperature = temp
        self.feelsLike = feelsLike
        self.icon = icon
      
    }
    
    static func weatherWithJSON(results: NSDictionary) -> WeatherConditions
    {
        var weather: WeatherConditions
        var temperature = ""
        var feelsLike = ""
        var icon = ""
        
        if results.count > 0
        {
 //           if let currently = results["currently"] as? NSDictionary
 //           {
                temperature = String(results["temperature"] as! Double)
            
                feelsLike = String(results["apparentTemperature"] as! Double)
                icon = results["icon"] as! String
//            }
        }
        
        weather = WeatherConditions(temp: temperature, feelsLike: feelsLike, icon: icon)
        
        return weather
    }
    
}
